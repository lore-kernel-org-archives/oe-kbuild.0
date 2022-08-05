Content-Type: multipart/mixed; boundary="===============3319732924248023973=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gt/intel_engine.h:320:25: error: dereference of NULL 'engine' [CWE-476]
Date: Fri, 05 Aug 2022 13:38:47 +0800
Message-ID: <202208051316.FPB75l1Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3319732924248023973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2a88c212e652e94f1e4b635910972ac57ba4e97
commit: 573ba126aef37c8315e5bb68d2dad515efa96994 drm/i915/guc: Capture erro=
r state on context reset
date:   1 year ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year ago
config: x86_64-randconfig-c001-20220801 (https://download.01.org/0day-ci/ar=
chive/20220805/202208051316.FPB75l1Y-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D573ba126aef37c8315e5bb68d2dad515efa96994
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 573ba126aef37c8315e5bb68d2dad515efa96994
        # save the config file
        make =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/i915_drv.h:84,
                    from drivers/gpu/drm/i915/gt/intel_context.h:14,
                    from drivers/gpu/drm/i915/gem/i915_gem_context.h:12,
                    from drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:=
8:
   drivers/gpu/drm/i915/gt/intel_engine.h: In function 'capture_error_state=
':
>> drivers/gpu/drm/i915/gt/intel_engine.h:320:25: error: dereference of NUL=
L 'engine' [CWE-476] [-Werror=3Danalyzer-null-dereference]
     320 |         engine->hung_ce =3D ce;
         |         ~~~~~~~~~~~~~~~~^~~~
     'capture_error_state': events 1-2
       |
       |drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:2186:13:
       | 2186 | static void capture_error_state(struct intel_guc *guc,
       |      |             ^~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'capture_error_state'
       |......
       | 2191 |         struct intel_engine_cs *engine =3D __context_to_phy=
sical_engine(ce);
       |      |                                          ~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                                          |
       |      |                                          (2) calling '__con=
text_to_physical_engine' from 'capture_error_state'
       |
       +--> '__context_to_physical_engine': events 3-6
              |
              |  650 | __context_to_physical_engine(struct intel_context *c=
e)
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (3) entry to '__context_to_physical_engine'
              |......
              |  654 |         if (intel_engine_is_virtual(engine))
              |      |            ~
              |      |            |
              |      |            (4) following 'true' branch...
              |  655 |                 engine =3D guc_virtual_get_sibling(e=
ngine, 0);
              |      |                 ~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
              |      |                 |        |
              |      |                 |        (6) calling 'guc_virtual_ge=
t_sibling' from '__context_to_physical_engine'
              |      |                 (5) ...to here
              |
              +--> 'guc_virtual_get_sibling': event 7
                     |
                     |  636 | guc_virtual_get_sibling(struct intel_engine_c=
s *ve, unsigned int sibling)
                     |      | ^~~~~~~~~~~~~~~~~~~~~~~
                     |      | |
                     |      | (7) entry to 'guc_virtual_get_sibling'
                     |
                   'guc_virtual_get_sibling': event 8
                     |
                     |drivers/gpu/drm/i915/i915_drv.h:1248:14:
                     | 1248 |              (tmp__) ? \
                     |      |              ^
                     |      |              |
                     |      |              (8) following 'false' branch...
   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:642:9: note: in expans=
ion of macro 'for_each_engine_masked'
                     |  642 |         for_each_engine_masked(engine, ve->gt=
, mask, tmp)
                     |      |         ^~~~~~~~~~~~~~~~~~~~~~
                     |
                   'guc_virtual_get_sibling': event 9
                     |
                     |cc1:
                     | (9): ...to here
                     |
              <------+
              |
            '__context_to_physical_engine': event 10
              |
              |  655 |                 engine =3D guc_virtual_get_sibling(e=
ngine, 0);
              |      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
              |      |                          |
              |      |                          (10) return of NULL to '__c=
ontext_to_physical_engine' from 'guc_virtual_get_sibling'
              |
       <------+
       |
     'capture_error_state': event 11
       |
       | 2191 |         struct intel_engine_cs *engine =3D __context_to_phy=
sical_engine(ce);
       |      |                                          ^~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                                          |
       |      |                                          (11) return of NUL=
L to 'capture_error_state' from '__context_to_physical_engine'
       |
     'capture_error_state': event 12
       |
       |drivers/gpu/drm/i915/gt/intel_engine.h:320:25:
       |  320 |         engine->hung_ce =3D ce;
       |      |         ~~~~~~~~~~~~~~~~^~~~
       |      |                         |
       |      |                         (12) dereference of NULL 'engine'
       |
   cc1: all warnings being treated as errors


vim +/engine +320 drivers/gpu/drm/i915/gt/intel_engine.h

556120256ecd25 Matthew Brost 2021-07-26  315  =

573ba126aef37c Matthew Brost 2021-07-26  316  static inline void
573ba126aef37c Matthew Brost 2021-07-26  317  intel_engine_set_hung_context=
(struct intel_engine_cs *engine,
573ba126aef37c Matthew Brost 2021-07-26  318  			      struct intel_context=
 *ce)
573ba126aef37c Matthew Brost 2021-07-26  319  {
573ba126aef37c Matthew Brost 2021-07-26 @320  	engine->hung_ce =3D ce;
573ba126aef37c Matthew Brost 2021-07-26  321  }
573ba126aef37c Matthew Brost 2021-07-26  322  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3319732924248023973==--

