Content-Type: multipart/mixed; boundary="===============6875715797140236599=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:for-linux-next 1/3] Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h': 780< * if set to 1, the DRM core will expose the stereo 3D capabilities of the
Date: Tue, 01 Jun 2021 03:46:47 +0800
Message-ID: <202106010345.raFnt5E3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6875715797140236599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Simon Ser <contact@emersion.fr>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2e290c8d8d29278b9a20e2765ab8f6df02f2e707
commit: 88938bf343efbc4d31677a91a0ed1d189be1e7cb [1/3] drm: reference mode =
flags in DRM_CLIENT_CAP_* docs
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  780<  * if set to 1, the DRM=
 core will expose the stereo 3D capabilities of the
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  780>  * If set to 1, the DRM=
 core will expose the stereo 3D capabilities of the
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  782<  * drm_mode_modeinfo.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  782>  * drm_mode_modeinfo. S=
ee ``DRM_MODE_FLAG_3D_*``.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  807>  * See ``DRM_MODE_FLAG_=
PIC_AR_*``.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6875715797140236599==--

