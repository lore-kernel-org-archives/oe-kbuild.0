Content-Type: multipart/mixed; boundary="===============1365878161718379317=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/5] Critical-KlockWork-Fix-intel_tv.c-Possible-Null
Date: Thu, 20 Aug 2020 17:05:44 +0800
Message-ID: <202008201646.zagVqaAm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1365878161718379317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200819043409.26010-4-nischal.varide@intel.com>
References: <20200819043409.26010-4-nischal.varide@intel.com>
TO: Nischal Varide <nischal.varide@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
TO: nischal.varide(a)intel.com

Hi Nischal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v5.9-rc1 next-20200819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nischal-Varide/Critical-Kc=
lockWork-Fixes-intel_atomi-c-PossibleNull/20200819-193249
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/i915/display/intel_tv.c:1840:56: warning: Either the con=
dition 'old_state&&new_state' is redundant or there is possible null pointe=
r dereference: new_state. [nullPointerRedundantCheck]
    new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state->crtc=
);
                                                          ^
   drivers/gpu/drm/i915/display/intel_tv.c:1842:18: note: Assuming that con=
dition 'old_state&&new_state' is not redundant
    if (!(old_state && new_state && new_crtc_state))
                    ^
   drivers/gpu/drm/i915/display/intel_tv.c:1840:56: note: Null pointer dere=
ference
    new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_state->crtc=
);
                                                          ^
   drivers/gpu/drm/i915/display/intel_tv.c:1635:8: warning: Variable 'type'=
 is reassigned a value before the old one has been used. [redundantAssignme=
nt]
     type =3D DRM_MODE_CONNECTOR_Composite;
          ^
   drivers/gpu/drm/i915/display/intel_tv.c:1623:7: note: Variable 'type' is=
 reassigned a value before the old one has been used.
    type =3D -1;
         ^
   drivers/gpu/drm/i915/display/intel_tv.c:1635:8: note: Variable 'type' is=
 reassigned a value before the old one has been used.
     type =3D DRM_MODE_CONNECTOR_Composite;
          ^

# https://github.com/0day-ci/linux/commit/6fb528c1b424d3c8095085afa7e777ac5=
502450b
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Nischal-Varide/Critical-KclockWork-Fixes-i=
ntel_atomi-c-PossibleNull/20200819-193249
git checkout 6fb528c1b424d3c8095085afa7e777ac5502450b
vim +1840 drivers/gpu/drm/i915/display/intel_tv.c

79e539453b34e3 drivers/gpu/drm/i915/intel_tv.c         Jesse Barnes      20=
08-11-07  1830  =

0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1831  static int intel_tv_atomic_check(struct drm_connector *conn=
ector,
6f3b62781bbd26 drivers/gpu/drm/i915/intel_tv.c         Sean Paul         20=
19-06-11  1832  				 struct drm_atomic_state *state)
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1833  {
6f3b62781bbd26 drivers/gpu/drm/i915/intel_tv.c         Sean Paul         20=
19-06-11  1834  	struct drm_connector_state *new_state;
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1835  	struct drm_crtc_state *new_crtc_state;
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1836  	struct drm_connector_state *old_state;
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1837  =

6f3b62781bbd26 drivers/gpu/drm/i915/intel_tv.c         Sean Paul         20=
19-06-11  1838  	new_state =3D drm_atomic_get_new_connector_state(state, co=
nnector);
6f3b62781bbd26 drivers/gpu/drm/i915/intel_tv.c         Sean Paul         20=
19-06-11  1839  	old_state =3D drm_atomic_get_old_connector_state(state, co=
nnector);
6f3b62781bbd26 drivers/gpu/drm/i915/intel_tv.c         Sean Paul         20=
19-06-11 @1840  	new_crtc_state =3D drm_atomic_get_new_crtc_state(state, ne=
w_state->crtc);
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1841  =

6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1842  	if (!(old_state && new_state && new_crtc_state))
6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1843  		return 0;
6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1844  =

6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1845  	if (!new_state->crtc)
6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1846  		return 0;
6fb528c1b424d3 drivers/gpu/drm/i915/display/intel_tv.c Nischal Varide    20=
20-08-19  1847  =

0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1848  	if (old_state->tv.mode !=3D new_state->tv.mode ||
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1849  		old_state->tv.margins.left !=3D new_state->tv.margins.lef=
t ||
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1850  		old_state->tv.margins.right !=3D new_state->tv.margins.ri=
ght ||
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1851  		old_state->tv.margins.top !=3D new_state->tv.margins.top =
||
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1852  		old_state->tv.margins.bottom !=3D new_state->tv.margins.b=
ottom) {
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1853  		/* Force a modeset. */
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1854  =

0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1855  		new_crtc_state->connectors_changed =3D true;
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1856  	}
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1857  =

0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1858  	return 0;
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1859  }
0e891b3f447f4d drivers/gpu/drm/i915/intel_tv.c         Maarten Lankhorst 20=
17-04-10  1860  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1365878161718379317==--

