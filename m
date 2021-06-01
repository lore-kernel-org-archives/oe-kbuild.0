Content-Type: multipart/mixed; boundary="===============0577632206201628373=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 5/9] drm: Add Client Cap for advance gamma mode
Date: Tue, 01 Jun 2021 18:58:24 +0800
Message-ID: <202106011833.vXCXP9Jg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0577632206201628373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210601104135.29020-6-uma.shankar@intel.com>
References: <20210601104135.29020-6-uma.shankar@intel.com>
TO: Uma Shankar <uma.shankar@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
TO: dri-devel(a)lists.freedesktop.org
CC: Uma Shankar <uma.shankar@intel.com>
CC: bhanuprakash.modem(a)intel.com

Hi Uma,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegr=
a-drm/drm/tegra/for-next linus/master v5.13-rc4 next-20210601]
[cannot apply to drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Uma-Shankar/Enhance-pipe-c=
olor-support-for-multi-segmented-luts/20210601-180720
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 51 minutes ago
:::::: commit date: 51 minutes ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
cd tools/perf && ./check-headers.sh

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


perfheadercheck warnings: (new ones prefixed by >>)
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  819> /**
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  820>  * Add support for adva=
nce gamma mode UAPI
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  821>  * If set to 1, DRM wil=
l enable advance gamma mode
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  822>  * UAPI to process the =
gamma mode based on extended
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  823>  * range and segments.
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  824>  */
>> Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  825> #define DRM_CLIENT_CAP_=
ADVANCE_GAMMA_MODES     6
   Warning: Kernel ABI header at 'tools/include/uapi/drm/drm.h' differs fro=
m latest version at 'include/uapi/drm/drm.h':  826> =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0577632206201628373==--

