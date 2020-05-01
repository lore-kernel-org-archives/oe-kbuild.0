Content-Type: multipart/mixed; boundary="===============1651248488230229950=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 08/11] drm/i915: Link planes in a bigjoiner configuration, v3.
Date: Fri, 01 May 2020 16:21:55 +0800
Message-ID: <202005011641.5nDzxk1r%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1651248488230229950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200430230951.2508-9-manasi.d.navare@intel.com>
References: <20200430230951.2508-9-manasi.d.navare@intel.com>
TO: Manasi Navare <manasi.d.navare@intel.com>

Hi Manasi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20200430]
[cannot apply to drm-intel/for-linux-next linus/master v5.7-rc3]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Manasi-Navare/Rebased-Big-=
Joiner-patch-series-for-8K-2p1p/20200501-071225
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/gpu/drm/i915/display/intel_display.c:6168:10: warning: Either th=
e condition '!fb' is redundant or there is possible null pointer dereferenc=
e: fb. [nullPointerRedundantCheck]
    switch (fb->format->format) {
            ^
   drivers/gpu/drm/i915/display/intel_display.c:6136:22: note: Assuming tha=
t condition '!fb' is not redundant
    bool force_detach =3D !fb || !plane_state->uapi.visible;
                        ^
   drivers/gpu/drm/i915/display/intel_display.c:6134:46: note: Assignment '=
fb=3Dplane_state->hw.fb', assigned value is 0
    struct drm_framebuffer *fb =3D plane_state->hw.fb;
                                                ^
   drivers/gpu/drm/i915/display/intel_display.c:6168:10: note: Null pointer=
 dereference
    switch (fb->format->format) {
            ^
   drivers/gpu/drm/i915/display/intel_display.c:17402:42: warning: Possible=
 null pointer dereference: obj [nullPointer]
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/intel_display.c:17401:36: note: Assignment =
'obj=3D(fb)?to_intel_bo(fb->obj[0]):NULL', assigned value is 0
    struct drm_i915_gem_object *obj =3D intel_fb_obj(fb);
                                      ^
   drivers/gpu/drm/i915/display/intel_display.c:17402:42: note: Null pointe=
r dereference
    struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
                                            ^
   drivers/gpu/drm/i915/display/intel_display.c:17404:6: warning: Possible =
null pointer dereference: obj [nullPointer]
    if (obj->userptr.mm) {
        ^
   drivers/gpu/drm/i915/display/intel_display.c:17401:36: note: Assignment =
'obj=3D(fb)?to_intel_bo(fb->obj[0]):NULL', assigned value is 0
    struct drm_i915_gem_object *obj =3D intel_fb_obj(fb);
                                      ^
   drivers/gpu/drm/i915/display/intel_display.c:17404:6: note: Null pointer=
 dereference
    if (obj->userptr.mm) {
        ^
   drivers/gpu/drm/i915/display/intel_display.c:4302:7: warning: Local vari=
able 'src_w' shadows outer variable [shadowVariable]
     int src_w =3D drm_rect_width(&plane_state->uapi.src) >> 16;
         ^
   drivers/gpu/drm/i915/display/intel_display.c:4265:20: note: Shadowed dec=
laration
    int src_x, src_y, src_w;
                      ^
   drivers/gpu/drm/i915/display/intel_display.c:4302:7: note: Shadow variab=
le
     int src_w =3D drm_rect_width(&plane_state->uapi.src) >> 16;
         ^
   drivers/gpu/drm/i915/display/intel_display.c:11253:7: warning: Local var=
iable 'tmp' shadows outer variable [shadowVariable]
     u32 tmp =3D intel_de_read(dev_priv,
         ^
   drivers/gpu/drm/i915/display/intel_display.c:11209:6: note: Shadowed dec=
laration
    u32 tmp;
        ^
   drivers/gpu/drm/i915/display/intel_display.c:11253:7: note: Shadow varia=
ble
     u32 tmp =3D intel_de_read(dev_priv,
         ^
   drivers/gpu/drm/i915/display/intel_display.c:18711:23: warning: Local va=
riable 'crtc' shadows outer variable [shadowVariable]
      struct intel_crtc *crtc;
                         ^
   drivers/gpu/drm/i915/display/intel_display.c:18640:21: note: Shadowed de=
claration
    struct intel_crtc *crtc;
                       ^
   drivers/gpu/drm/i915/display/intel_display.c:18711:23: note: Shadow vari=
able
      struct intel_crtc *crtc;
                         ^
>> drivers/gpu/drm/i915/display/intel_display.c:12632:12: warning: Argument=
 '!found_plane' to function WARN_ON is always 1 [constArgument]
      WARN_ON(!found_plane);
              ^
   drivers/gpu/drm/i915/display/intel_display.c:12630:7: note: Assuming tha=
t condition '!found_plane' is not redundant
     if (!found_plane) {
         ^
   drivers/gpu/drm/i915/display/intel_display.c:12632:12: note: Argument '!=
found_plane' to function WARN_ON is always 1
      WARN_ON(!found_plane);
              ^
   drivers/gpu/drm/i915/display/intel_display.c:12200:53: warning: Clarify =
calculation precedence for '&' and '?'. [clarifyCalculation]
      clock.p2 =3D dpll & DPLL_DAC_SERIAL_P2_CLOCK_DIV_5 ?
                                                       ^
   drivers/gpu/drm/i915/display/intel_display.c:12204:48: warning: Clarify =
calculation precedence for '&' and '?'. [clarifyCalculation]
      clock.p2 =3D dpll & DPLLB_LVDS_P2_CLOCK_DIV_7 ?
                                                  ^
   drivers/gpu/drm/i915/display/intel_display.c:10542:36: warning: Shifting=
 signed 32-bit value by 31 bits is implementation-defined behaviour [shiftT=
ooManyBitsSigned]
     scaler_state->scaler_users |=3D (1 << SKL_CRTC_INDEX);
                                      ^
   drivers/gpu/drm/i915/display/intel_display.c:10544:37: warning: Shifting=
 signed 32-bit value by 31 bits is implementation-defined behaviour [shiftT=
ooManyBitsSigned]
     scaler_state->scaler_users &=3D ~(1 << SKL_CRTC_INDEX);
                                       ^

# https://github.com/0day-ci/linux/commit/5c3b3baacd079c52fa2f307ae54261429=
c906b72
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5c3b3baacd079c52fa2f307ae54261429c906b72
vim +12632 drivers/gpu/drm/i915/display/intel_display.c

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12592  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12593  static int icl_set_bigj=
oiner_plane_links(struct intel_atomic_state *state,
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12594  					 struct intel_crtc=
_state *new_crtc_state)
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12595  {
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12596  	struct intel_plane *pl=
ane;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12597  	struct intel_crtc *crt=
c =3D to_intel_crtc(new_crtc_state->uapi.crtc);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12598  	struct intel_crtc *oth=
er_crtc =3D new_crtc_state->bigjoiner_linked_crtc;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12599  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12600  	/*
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12601           * Setup and te=
ardown the new bigjoiner plane mappings.
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12602           */
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12603  	for_each_intel_plane_o=
n_crtc(crtc->base.dev, crtc, plane) {
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12604  		struct intel_plane_st=
ate *plane_state;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12605  		struct intel_plane *o=
ther_plane =3D NULL;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12606  		bool found_plane =3D =
false;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12607  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12608  		plane_state =3D intel=
_atomic_get_plane_state(state, plane);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12609  		if (IS_ERR(plane_stat=
e))
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12610  			return PTR_ERR(plane=
_state);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12611  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12612  		for_each_intel_plane_=
on_crtc(crtc->base.dev, other_crtc, other_plane) {
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12613  			if (other_plane->id =
!=3D plane->id)
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12614  				continue;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12615  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12616  			plane_state->bigjoin=
er_plane =3D other_plane;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12617  			plane_state->bigjoin=
er_slave =3D new_crtc_state->bigjoiner_slave;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12618  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12619  			plane_state =3D inte=
l_atomic_get_plane_state(state, other_plane);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12620  			if (IS_ERR(plane_sta=
te))
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12621  				return PTR_ERR(plan=
e_state);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12622  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12623  			plane_state->bigjoin=
er_plane =3D plane;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12624  			plane_state->bigjoin=
er_slave =3D !new_crtc_state->bigjoiner_slave;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12625  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12626  			found_plane =3D true;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12627  			break;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12628  		}
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12629  =

5c3b3baacd079c Maarten Lankhorst 2020-04-30  12630  		if (!found_plane) {
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12631  			/* All pipes should =
have identical planes. */
5c3b3baacd079c Maarten Lankhorst 2020-04-30 @12632  			WARN_ON(!found_plane=
);
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12633  			return -EINVAL;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12634  		}
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12635  	}
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12636  	return 0;
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12637  }
5c3b3baacd079c Maarten Lankhorst 2020-04-30  12638  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1651248488230229950==--

