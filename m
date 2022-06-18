Content-Type: multipart/mixed; boundary="===============7055957460919456641=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/display/intel_panel.c:159:46: warning: dereference of NULL 'preferred_mode' [CWE-476]
Date: Sun, 19 Jun 2022 07:44:16 +0800
Message-ID: <202206190758.RdYUewoz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7055957460919456641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/i915/display/intel_panel.c:159:46: warning: dereference of NULL 'pre=
ferred_mode' [CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Ville Syrj=C3=A4l=C3=A4" <ville.syrjala@linux.intel.com>
CC: Jani Nikula <jani.nikula@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: c19909d037b640a5e3580c68f420e7ba058c68e4 drm/i915: Allow higher ref=
resh rate alternate fixed modes
date:   3 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c001-20220613 (https://download.01.org/0day-ci/ar=
chive/20220619/202206190758.RdYUewoz-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc19909d037b640a5e3580c68f420e7ba058c68e4
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c19909d037b640a5e3580c68f420e7ba058c68e4
        # save the config file
         ARCH=3Dx86_64 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/display/intel_panel.c: In function 'is_alt_fixed_mo=
de':
>> drivers/gpu/drm/i915/display/intel_panel.c:159:46: warning: dereference =
of NULL 'preferred_mode' [CWE-476] [-Wanalyzer-null-dereference]
     159 |                 mode->clock !=3D preferred_mode->clock;
         |                                ~~~~~~~~~~~~~~^~~~~~~
     'intel_panel_add_edid_alt_fixed_modes': event 1
       |
       |  162 | static void intel_panel_add_edid_alt_fixed_modes(struct int=
el_connector *connector)
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'intel_panel_add_edid_alt_fixed_mo=
des'
       |
     'intel_panel_add_edid_alt_fixed_modes': event 2
       |
       |include/linux/list.h:555:59:
       |  555 |         pos__ !=3D head__ ? list_entry(pos__, type, member)=
 : NULL; \
   drivers/gpu/drm/i915/display/intel_panel.c:52:16: note: in expansion of =
macro 'list_first_entry_or_null'
       |   52 |         return list_first_entry_or_null(&connector->panel.f=
ixed_modes,
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~
       |
     'intel_panel_add_edid_alt_fixed_modes': event 3
       |
       |cc1:
       | (3): ...to here
       |
     'intel_panel_add_edid_alt_fixed_modes': event 4
       |
       |include/linux/list.h:727:14:
       |  727 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (4) following 'true' branch...
   drivers/gpu/drm/i915/display/intel_panel.c:169:9: note: in expansion of =
macro 'list_for_each_entry_safe'
       |  169 |         list_for_each_entry_safe(mode, next, &connector->ba=
se.probed_modes, head) {
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
       |
     'intel_panel_add_edid_alt_fixed_modes': events 5-6
       |
       |  170 |                 if (!is_alt_fixed_mode(mode, preferred_mode=
))
       |      |                 ^~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |    |
       |      |                 |    (6) calling 'is_alt_fixed_mode' from '=
intel_panel_add_edid_alt_fixed_modes'
       |      |                 (5) ...to here
       |
       +--> 'is_alt_fixed_mode': events 7-10
              |
              |  152 | static bool is_alt_fixed_mode(const struct drm_displ=
ay_mode *mode,
              |      |             ^~~~~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'is_alt_fixed_mode'
              |......
              |  155 |         return drm_mode_match(mode, preferred_mode,
              |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |  156 |                               DRM_MODE_MATCH_TIMINGS=
 |
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~=
~~
              |  157 |                               DRM_MODE_MATCH_FLAGS |
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~
              |  158 |                               DRM_MODE_MATCH_3D_FLAG=
S) &&
              |      |                               ~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
              |      |                                                     =
   |
              |      |                                                     =
   (8) following 'true' branch...
              |  159 |                 mode->clock !=3D preferred_mode->clo=
ck;
              |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |                        |
              |      |                     (9) ...to here           (10) de=
reference of NULL 'preferred_mode'
              |

vim +/preferred_mode +159 drivers/gpu/drm/i915/display/intel_panel.c

1d8e1c75ffa844 drivers/gpu/drm/i915/intel_panel.c         Chris Wilson  201=
0-08-07  151  =

c19909d037b640 drivers/gpu/drm/i915/display/intel_panel.c Ville Syrj=C3=A4l=
=C3=A4 2022-03-31  152  static bool is_alt_fixed_mode(const struct drm_disp=
lay_mode *mode,
c19909d037b640 drivers/gpu/drm/i915/display/intel_panel.c Ville Syrj=C3=A4l=
=C3=A4 2022-03-31  153  			      const struct drm_display_mode *preferred_m=
ode)
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  154  {
c19909d037b640 drivers/gpu/drm/i915/display/intel_panel.c Ville Syrj=C3=A4l=
=C3=A4 2022-03-31  155  	return drm_mode_match(mode, preferred_mode,
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  156  			      DRM_MODE_MATCH_TIMINGS |
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  157  			      DRM_MODE_MATCH_FLAGS |
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  158  			      DRM_MODE_MATCH_3D_FLAGS) &&
c19909d037b640 drivers/gpu/drm/i915/display/intel_panel.c Ville Syrj=C3=A4l=
=C3=A4 2022-03-31 @159  		mode->clock !=3D preferred_mode->clock;
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  160  }
9f6fbe22be90b7 drivers/gpu/drm/i915/intel_panel.c         Ville Syrj=C3=A4l=
=C3=A4 2019-03-21  161  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7055957460919456641==--

