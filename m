Content-Type: multipart/mixed; boundary="===============2463378657348087777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm: document DRM_IOCTL_MODE_RMFB
Date: Mon, 26 Jul 2021 17:07:44 +0800
Message-ID: <202107261748.83c4z6Kn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2463378657348087777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.pla=
bs.ch>
References: <ephVkof3uGu2RpOdBbrHE3qF98zBfIBRzXe4Vyoboh0@cp4-web-034.plab=
s.ch>
TO: Simon Ser <contact@emersion.fr>
TO: dri-devel(a)lists.freedesktop.org
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Pekka Paalanen <pekka.paalanen@collabora.com>
CC: Leandro Ribeiro <leandro.ribeiro@collabora.com>

Hi Simon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegr=
a-drm/drm/tegra/for-next linus/master drm/drm-next v5.14-rc3 next-20210723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Simon-Ser/drm-document-DRM=
_IOCTL_MODE_RMFB/20210726-155324
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 74 minutes ago
:::::: commit date: 74 minutes ago
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1053> /**
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1054>  * DRM_IOCTL_MODE_RMFB =
- Remove a framebuffer.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1055>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1056>  * This removes a frame=
buffer previously added via ADDFB/ADDFB2. The IOCTL
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1057>  * argument is a frameb=
uffer object ID.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1058>  *
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1059>  * Warning: removing a =
framebuffer currently in-use on an enabled plane will
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1060>  * disable that plane. =
If the plane is primary, the CRTC may also be disabled
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1061>  * (depending on driver=
 capabilities).
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h': 1062>  */

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2463378657348087777==--

