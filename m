Content-Type: multipart/mixed; boundary="===============3427028591416238340=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/plane.c:260:19: warning: dereference of NULL 'state' [CWE-476]
Date: Wed, 15 Jun 2022 09:04:17 +0800
Message-ID: <202206150846.1p3w8VjP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3427028591416238340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/tegra/plane.c:260:19: warning: dereference of NULL 'state' [CWE-476]=
 [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dmitry Osipenko <digetx@gmail.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   018ab4fabddd94f1c96f3b59e180691b9e88d5d8
commit: 04d5d5df9df79f9045e76404775fc8a084aac23d drm/tegra: dc: Support mem=
ory bandwidth management
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220615/202206150846.1p3w8VjP-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D04d5d5df9df79f9045e76404775fc8a084aac23d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 04d5d5df9df79f9045e76404775fc8a084aac23d
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
       |      |         (4) ...to here
       |   62 |         copy->tiling =3D state->tiling;
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                      |
       |      |                      (5) dereference of NULL '<unknown>'
       |
   drivers/gpu/drm/tegra/plane.c: In function 'tegra_plane_supports_sector_=
layout':
   drivers/gpu/drm/tegra/plane.c:98:32: warning: dereference of NULL '0' [C=
WE-476] [-Wanalyzer-null-dereference]
      98 |                         if (!dc->soc->supports_sector_layout)
         |                              ~~^~~~~
     'tegra_plane_supports_sector_layout': event 1
       |
       |include/linux/list.h:629:14:
       |  629 |              !list_entry_is_head(pos, head, member);       =
             \
       |      |              ^
       |      |              |
       |      |              (1) following 'true' branch...
   include/drm/drm_crtc.h:1313:9: note: in expansion of macro 'list_for_eac=
h_entry'
       | 1313 |         list_for_each_entry(crtc, &(dev)->mode_config.crtc_=
list, head)
       |      |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/tegra/plane.c:94:9: note: in expansion of macro 'drm_for=
_each_crtc'
       |   94 |         drm_for_each_crtc(crtc, plane->dev) {
       |      |         ^~~~~~~~~~~~~~~~~
       |
     'tegra_plane_supports_sector_layout': events 2-3
       |
       |   95 |                 if (plane->possible_crtcs & drm_crtc_mask(c=
rtc)) {
       |      |                     ~~~~~^~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (2) ...to here
       |......
       |   98 |                         if (!dc->soc->supports_sector_layou=
t)
       |      |                              ~~~~~~~
       |      |                                |
       |      |                                (3) dereference of NULL '<un=
known>'
       |
   drivers/gpu/drm/tegra/plane.c: In function 'tegra_dc_pin':
   drivers/gpu/drm/tegra/plane.c:141:39: warning: dereference of NULL 'dc' =
[CWE-476] [-Wanalyzer-null-dereference]
     141 |         struct iommu_domain *domain =3D iommu_get_domain_for_dev=
(dc->dev);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
     'tegra_plane_prepare_fb': event 1
       |
       |  229 | int tegra_plane_prepare_fb(struct drm_plane *plane,
       |      |     ^~~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'tegra_plane_prepare_fb'
       |
     'tegra_plane_prepare_fb': event 2
       |
       |drivers/gpu/drm/tegra/dc.h:114:65:
       |  114 |         return crtc ? container_of(crtc, struct tegra_dc, b=
ase) : NULL;
       |
     'tegra_plane_prepare_fb': events 3-5
       |
       |drivers/gpu/drm/tegra/plane.c:234:19:
       |  234 |         if (!state->fb)
       |      |            ~ ~~~~~^~~~
       |      |            |      |
       |      |            |      (3) ...to here
       |      |            (4) following 'false' branch...
       |......
       |  237 |         drm_gem_plane_helper_prepare_fb(plane, state);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (5) ...to here
       |
     'tegra_plane_prepare_fb': event 6
       |
       |drivers/gpu/drm/tegra/plane.h:69:12:
       |   69 |         if (state)
       |      |            ^
       |      |            |
       |      |            (6) following 'true' branch (when 'state' is non=
-NULL)...
       |
     'tegra_plane_prepare_fb': event 7
       |
       |cc1:
       | (7): ...to here
       |
     'tegra_plane_prepare_fb': event 8
       |
       |drivers/gpu/drm/tegra/plane.c:239:16:
       |  239 |         return tegra_dc_pin(dc, to_tegra_plane_state(state)=
);
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                |
       |      |                (8) calling 'tegra_dc_pin' from 'tegra_plane=
_prepare_fb'
       |
       +--> 'tegra_dc_pin': events 9-10
              |
              |  139 | static int tegra_dc_pin(struct tegra_dc *dc, struct =
tegra_plane_state *state)
              |      |            ^~~~~~~~~~~~
              |      |            |
              |      |            (9) entry to 'tegra_dc_pin'
              |  140 | {
              |  141 |         struct iommu_domain *domain =3D iommu_get_do=
main_for_dev(dc->dev);
              |      |                                       ~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~
              |      |                                       |
              |      |                                       (10) dereferen=
ce of NULL 'dc'
              |
   drivers/gpu/drm/tegra/plane.c: In function 'tegra_plane_calculate_memory=
_bandwidth':
>> drivers/gpu/drm/tegra/plane.c:260:19: warning: dereference of NULL 'stat=
e' [CWE-476] [-Wanalyzer-null-dereference]
     260 |         if (!state->visible)
         |              ~~~~~^~~~~~~~~
     'tegra_plane_calculate_memory_bandwidth': event 1
       |
       |drivers/gpu/drm/tegra/plane.h:69:12:
       |   69 |         if (state)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'state' is NU=
LL)...
       |
     'tegra_plane_calculate_memory_bandwidth': events 2-3
       |
       |drivers/gpu/drm/tegra/plane.c:260:19:
       |  260 |         if (!state->visible)
       |      |              ~~~~~^~~~~~~~~
       |      |                   |
       |      |                   (2) ...to here
       |      |                   (3) dereference of NULL 'state'
       |
   drivers/gpu/drm/tegra/plane.c: In function 'tegra_plane_state_add':
   drivers/gpu/drm/tegra/plane.c:347:23: warning: dereference of NULL '0' [=
CWE-476] [-Wanalyzer-null-dereference]
     347 |         tegra->planes |=3D WIN_A_ACT_REQ << plane->index;
         |                       ^~
     'tegra_plane_state_add': events 1-6
       |
       |  323 | int tegra_plane_state_add(struct tegra_plane *plane,
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'tegra_plane_state_add'
       |......
       |  332 |         if (IS_ERR(crtc_state))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  336 |         err =3D drm_atomic_helper_check_plane_state(state, =
crtc_state,
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |               |
       |      |               (3) ...to here
       |  337 |                                                   0, INT_MA=
X, true, true);
       |      |                                                   ~~~~~~~~~=
~~~~~~~~~~~~~~
       |  338 |         if (err < 0)
       |      |            ~
       |      |            |
       |      |            (4) following 'false' branch (when 'err >=3D 0')=
...
       |......
       |  341 |         err =3D tegra_plane_calculate_memory_bandwidth(stat=
e);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (5) ...to here
       |      |               (6) calling 'tegra_plane_calculate_memory_ban=
dwidth' from 'tegra_plane_state_add'
       |
       +--> 'tegra_plane_calculate_memory_bandwidth': event 7
              |
              |  251 | static int tegra_plane_calculate_memory_bandwidth(st=
ruct drm_plane_state *state)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'tegra_plane_calculate_memor=
y_bandwidth'
              |
            'tegra_plane_calculate_memory_bandwidth': event 8
              |
              |drivers/gpu/drm/tegra/plane.h:69:12:
              |   69 |         if (state)
              |      |            ^
              |      |            |
              |      |            (8) following 'true' branch (when 'state'=
 is non-NULL)...
              |
            'tegra_plane_calculate_memory_bandwidth': event 9
              |
              |cc1:
              | (9): ...to here
              |
       <------+
       |
     'tegra_plane_state_add': events 10-11
       |
       |drivers/gpu/drm/tegra/plane.c:341:15:
       |  341 |         err =3D tegra_plane_calculate_memory_bandwidth(stat=
e);
       |      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (10) returning to 'tegra_plane_state_add' fro=
m 'tegra_plane_calculate_memory_bandwidth'
       |  342 |         if (err < 0)
       |      |            ~   =

       |      |            |
       |      |            (11) following 'false' branch (when 'err >=3D 0'=
)...
       |
     'tegra_plane_state_add': events 12-13
       |
       |drivers/gpu/drm/tegra/dc.h:32:12:
       |   32 |         if (state)
       |      |            ^
       |      |            |
       |      |            (12) ...to here
       |      |            (13) following 'false' branch (when 'crtc_state'=
 is NULL)...
       |
     'tegra_plane_state_add': events 14-15
       |
       |drivers/gpu/drm/tegra/plane.c:347:23:
       |  347 |         tegra->planes |=3D WIN_A_ACT_REQ << plane->index;
       |      |                       ^~
--
     'tegra_crtc_update_memory_bandwidth': event 7
       |
       |include/drm/drm_atomic.h:927:20:
       |  927 |              (__i) < (__state)->dev->mode_config.num_total_=
plane;       \
       |      |              ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
       |      |                    |
       |      |                    (7) following 'true' branch...
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
       | 1878 |         for_each_old_plane_in_state(old_crtc_state->state, =
plane,
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'tegra_crtc_update_memory_bandwidth': event 8
       |
       |include/drm/drm_atomic.h:929:39:
       |  929 |                 for_each_if ((__state)->planes[__i].ptr && =
             \
       |      |                              ~~~~~~~~~^~~~~~~~
       |      |                                       |
       |      |                                       (8) ...to here
   include/drm/drm_util.h:63:38: note: in definition of macro 'for_each_if'
       |   63 | #define for_each_if(condition) if (!(condition)) {} else
       |      |                                      ^~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
       | 1878 |         for_each_old_plane_in_state(old_crtc_state->state, =
plane,
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'tegra_crtc_update_memory_bandwidth': event 9
       |
       |include/drm/drm_util.h:63:35:
       |   63 | #define for_each_if(condition) if (!(condition)) {} else
       |      |                                   ^
       |      |                                   |
       |      |                                   (9) following 'false' bra=
nch...
   include/drm/drm_atomic.h:929:17: note: in expansion of macro 'for_each_i=
f'
       |  929 |                 for_each_if ((__state)->planes[__i].ptr && =
             \
       |      |                 ^~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
       | 1878 |         for_each_old_plane_in_state(old_crtc_state->state, =
plane,
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'tegra_crtc_update_memory_bandwidth': event 10
       |
       |include/drm/drm_atomic.h:931:49:
       |  931 |                               (old_plane_state) =3D (__stat=
e)->planes[__i].old_state, 1))
       |      |                               ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                                 |
       |      |                                                 (10) ...to =
here
   include/drm/drm_util.h:63:38: note: in definition of macro 'for_each_if'
       |   63 | #define for_each_if(condition) if (!(condition)) {} else
       |      |                                      ^~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
       | 1878 |         for_each_old_plane_in_state(old_crtc_state->state, =
plane,
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
     'tegra_crtc_update_memory_bandwidth': event 11
       |
       |drivers/gpu/drm/tegra/plane.h:69:12:
       |   69 |         if (state)
       |      |            ^
       |      |            |
       |      |            (11) following 'false' branch (when 'old_plane_s=
tate' is NULL)...
       |
     'tegra_crtc_update_memory_bandwidth': event 12
       |
       |drivers/gpu/drm/tegra/dc.c:1881:67:
       | 1881 |                 new_tegra_state =3D to_const_tegra_plane_st=
ate(plane->state);
       |      |                                                            =
  ~~~~~^~~~~~~
       |      |                                                            =
       |
       |      |                                                            =
       (12) ...to here
       |
     'tegra_crtc_update_memory_bandwidth': event 13
       |
       |drivers/gpu/drm/tegra/plane.h:69:12:
       |   69 |         if (state)
       |      |            ^
       |      |            |
       |      |            (13) following 'true' branch...
       |
     'tegra_crtc_update_memory_bandwidth': event 14
       |
       |cc1:
       | (14): ...to here
       |
     'tegra_crtc_update_memory_bandwidth': events 15-17
       |
       |drivers/gpu/drm/tegra/dc.c:1889:20:
       | 1889 |                 if (tegra->dc !=3D dc)
       |      |                    ^
       |      |                    |
       |      |                    (15) following 'false' branch...
       |......
       | 1892 |                 new_avg_bw =3D new_tegra_state->avg_memory_=
bandwidth;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                            |
       |      |                            (16) ...to here
       | 1893 |                 old_avg_bw =3D old_tegra_state->avg_memory_=
bandwidth;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
       |      |                            |
       |      |                            (17) dereference of NULL '<unkno=
wn>'
       |
   drivers/gpu/drm/tegra/plane.h: In function 'tegra_crtc_atomic_begin':
>> drivers/gpu/drm/tegra/dc.c:2120:17: warning: dereference of NULL 'crtc' =
[CWE-476] [-Wanalyzer-null-dereference]
    2120 |         if (crtc->state->event) {
         |             ~~~~^~~~~~~
     'tegra_crtc_atomic_begin': events 1-2
       |
       | 2113 | static void tegra_crtc_atomic_begin(struct drm_crtc *crtc,
       |      |             ^~~~~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'tegra_crtc_atomic_begin'
       |......
       | 2118 |         tegra_crtc_update_memory_bandwidth(crtc, state, tru=
e);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |         |
       |      |         (2) calling 'tegra_crtc_update_memory_bandwidth' fr=
om 'tegra_crtc_atomic_begin'
       |
       +--> 'tegra_crtc_update_memory_bandwidth': event 3
              |
              | 1838 | tegra_crtc_update_memory_bandwidth(struct drm_crtc *=
crtc,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to 'tegra_crtc_update_memory_bandwidth'
              |
            'tegra_crtc_update_memory_bandwidth': event 4
              |
              |drivers/gpu/drm/tegra/dc.h:114:65:
              |  114 |         return crtc ? container_of(crtc, struct tegr=
a_dc, base) : NULL;
              |
            'tegra_crtc_update_memory_bandwidth': events 5-7
              |
              |drivers/gpu/drm/tegra/dc.c:1852:15:
              | 1852 |         if (dc->soc->has_nvdisplay)
              |      |            ~~~^~~~~
              |      |            |  |
              |      |            |  (5) ...to here
              |      |            |  (6) state of 'INIT_VAL(crtc_5(D))': 'n=
ull' -> 'stop' (NULL origin)
              |      |            (7) following 'false' branch...
              |
            'tegra_crtc_update_memory_bandwidth': event 8
              |
              |include/drm/drm_atomic.h:542:21:
              |  542 |         return state->crtcs[drm_crtc_index(crtc)].ol=
d_state;
              |      |                ~~~~~^~~~~~~
              |      |                     |
              |      |                     (8) ...to here
              |
            'tegra_crtc_update_memory_bandwidth': event 9
              |
              |drivers/gpu/drm/tegra/dc.c:1859:12:
              | 1859 |         if (!crtc->state->active) {
              |      |            ^
              |      |            |
              |      |            (9) following 'true' branch...
              |
            'tegra_crtc_update_memory_bandwidth': event 10
              |
              |cc1:
              | (10): ...to here
              |
            'tegra_crtc_update_memory_bandwidth': event 11
              |
              |include/drm/drm_atomic.h:927:20:
              |  927 |              (__i) < (__state)->dev->mode_config.num=
_total_plane;       \
              |      |              ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
              |      |                    |
              |      |                    (11) following 'true' branch...
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
              | 1878 |         for_each_old_plane_in_state(old_crtc_state->=
state, plane,
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'tegra_crtc_update_memory_bandwidth': event 12
              |
              |include/drm/drm_atomic.h:929:39:
              |  929 |                 for_each_if ((__state)->planes[__i].=
ptr &&              \
              |      |                              ~~~~~~~~~^~~~~~~~
              |      |                                       |
              |      |                                       (12) ...to here
   include/drm/drm_util.h:63:38: note: in definition of macro 'for_each_if'
              |   63 | #define for_each_if(condition) if (!(condition)) {} =
else
              |      |                                      ^~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
              | 1878 |         for_each_old_plane_in_state(old_crtc_state->=
state, plane,
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'tegra_crtc_update_memory_bandwidth': event 13
              |
              |include/drm/drm_util.h:63:35:
              |   63 | #define for_each_if(condition) if (!(condition)) {} =
else
              |      |                                   ^
              |      |                                   |
              |      |                                   (13) following 'fa=
lse' branch...
   include/drm/drm_atomic.h:929:17: note: in expansion of macro 'for_each_i=
f'
              |  929 |                 for_each_if ((__state)->planes[__i].=
ptr &&              \
              |      |                 ^~~~~~~~~~~
   drivers/gpu/drm/tegra/dc.c:1878:9: note: in expansion of macro 'for_each=
_old_plane_in_state'
              | 1878 |         for_each_old_plane_in_state(old_crtc_state->=
state, plane,
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |
            'tegra_crtc_update_memory_bandwidth': event 14
              |
              |include/drm/drm_atomic.h:931:49:
              |  931 |                               (old_plane_state) =3D =
(__state)->planes[__i].old_state, 1))

vim +/state +260 drivers/gpu/drm/tegra/plane.c

2e8d8749f6f9bb3 Thierry Reding  2019-10-28  250  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  251  static int tegra_plane_cal=
culate_memory_bandwidth(struct drm_plane_state *state)
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  252  {
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  253  	struct tegra_plane_state =
*tegra_state =3D to_tegra_plane_state(state);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  254  	unsigned int i, bpp, dst_=
w, dst_h, src_w, src_h, mul;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  255  	const struct tegra_dc_soc=
_info *soc;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  256  	const struct drm_format_i=
nfo *fmt;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  257  	struct drm_crtc_state *cr=
tc_state;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  258  	u64 avg_bandwidth, peak_b=
andwidth;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  259  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01 @260  	if (!state->visible)
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  261  		return 0;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  262  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  263  	crtc_state =3D drm_atomic=
_get_new_crtc_state(state->state, state->crtc);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  264  	if (!crtc_state)
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  265  		return -EINVAL;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  266  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  267  	src_w =3D drm_rect_width(=
&state->src) >> 16;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  268  	src_h =3D drm_rect_height=
(&state->src) >> 16;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  269  	dst_w =3D drm_rect_width(=
&state->dst);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  270  	dst_h =3D drm_rect_height=
(&state->dst);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  271  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  272  	fmt =3D state->fb->format;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  273  	soc =3D to_tegra_dc(state=
->crtc)->soc;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  274  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  275  	/*
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  276  	 * Note that real memory =
bandwidth vary depending on format and
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  277  	 * memory layout, we are =
not taking that into account because small
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  278  	 * estimation error isn't=
 important since bandwidth is rounded up
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  279  	 * anyway.
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  280  	 */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  281  	for (i =3D 0, bpp =3D 0; =
i < fmt->num_planes; i++) {
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  282  		unsigned int bpp_plane =
=3D fmt->cpp[i] * 8;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  283  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  284  		/*
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  285  		 * Sub-sampling is relev=
ant for chroma planes only and vertical
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  286  		 * readouts are not cach=
ed, hence only horizontal sub-sampling
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  287  		 * matters.
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  288  		 */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  289  		if (i > 0)
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  290  			bpp_plane /=3D fmt->hsu=
b;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  291  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  292  		bpp +=3D bpp_plane;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  293  	}
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  294  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  295  	/* average bandwidth in k=
bytes/sec */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  296  	avg_bandwidth  =3D min(sr=
c_w, dst_w) * min(src_h, dst_h);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  297  	avg_bandwidth *=3D drm_mo=
de_vrefresh(&crtc_state->adjusted_mode);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  298  	avg_bandwidth  =3D DIV_RO=
UND_UP(avg_bandwidth * bpp, 8) + 999;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  299  	do_div(avg_bandwidth, 100=
0);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  300  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  301  	/* mode.clock in kHz, pea=
k bandwidth in kbytes/sec */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  302  	peak_bandwidth =3D DIV_RO=
UND_UP(crtc_state->adjusted_mode.clock * bpp, 8);
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  303  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  304  	/*
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  305  	 * Tegra30/114 Memory Con=
troller can't interleave DC memory requests
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  306  	 * for the tiled windows =
because DC uses 16-bytes atom, while DDR3
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  307  	 * uses 32-bytes atom.  H=
ence there is x2 memory overfetch for tiled
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  308  	 * framebuffer and DDR3 o=
n these SoCs.
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  309  	 */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  310  	if (soc->plane_tiled_memo=
ry_bandwidth_x2 &&
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  311  	    tegra_state->tiling.m=
ode =3D=3D TEGRA_BO_TILING_MODE_TILED)
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  312  		mul =3D 2;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  313  	else
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  314  		mul =3D 1;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  315  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  316  	/* ICC bandwidth in kbyte=
s/sec */
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  317  	tegra_state->peak_memory_=
bandwidth =3D kBps_to_icc(peak_bandwidth) * mul;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  318  	tegra_state->avg_memory_b=
andwidth  =3D kBps_to_icc(avg_bandwidth)  * mul;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  319  =

04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  320  	return 0;
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  321  }
04d5d5df9df79f9 Dmitry Osipenko 2021-06-01  322  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3427028591416238340==--

