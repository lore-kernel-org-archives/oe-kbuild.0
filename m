Content-Type: multipart/mixed; boundary="===============8312485102272701146=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [drm-drm-misc:for-linux-next 1/1] Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs from latest version at 'include/uapi/drm/drm.h': 638> * If set to 1, the kernel supports specifying a :ref:`CRTC index<crtc_index>`
Date: Fri, 11 Jun 2021 04:24:24 +0800
Message-ID: <202106110418.EHSILSIt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8312485102272701146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Leandro Ribeiro <leandro.ribeiro@collabora.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Pekka Paalanen <pekka.paalanen@collabora.com>

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   26594678d00f94c62f2e43162bd6d10fd0b74917
commit: 26594678d00f94c62f2e43162bd6d10fd0b74917 [1/1] drm/doc: document ho=
w userspace should find out CRTC index
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  638<  * If set to 1, the ker=
nel supports specifying a CRTC index in the high bits of
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  639<  * &drm_wait_vblank_req=
uest.type.
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  638>  * If set to 1, the ker=
nel supports specifying a :ref:`CRTC index<crtc_index>`
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  639>  * in the high bits of =
&drm_wait_vblank_request.type.
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
m latest version at 'include/uapi/drm/drm.h':  783>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  784>  * This capability is a=
lways supported for all drivers starting from kernel
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  785>  * version 3.13.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  794>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  795>  * This capability has =
been introduced in kernel version 3.15. Starting from
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  796>  * kernel version 3.17,=
 this capability is always supported for all drivers.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  806>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  807>  * If the driver doesn'=
t support atomic mode-setting, enabling this capability
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  808>  * will fail with -EOPN=
OTSUPP.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  809>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  810>  * This capability has =
been introduced in kernel version 4.0. Starting from
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  811>  * kernel version 4.2, =
this capability is always supported for atomic-capable
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  812>  * drivers.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  820>  * See ``DRM_MODE_FLAG_=
PIC_AR_*``.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  821>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  822>  * This capability is a=
lways supported for all drivers starting from kernel
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  823>  * version 4.18.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  814<  * writing back to memo=
ry the scene setup in the commit. Depends on client
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  815<  * also supporting DRM_=
CLIENT_CAP_ATOMIC
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version@'include/uapi/drm/drm.h':  831>  * writing back to memo=
ry the scene setup in the commit. The client must enable
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  832>  * &DRM_CLIENT_CAP_ATOM=
IC first.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  833>  *
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  834>  * This capability is a=
lways supported for atomic-capable drivers starting from
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  835>  * kernel version 4.19.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8312485102272701146==--

