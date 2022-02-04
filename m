Content-Type: multipart/mixed; boundary="===============1262731326267716758=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/4] drm/i915/gt: Drop invalidate_csb_entries
Date: Fri, 04 Feb 2022 18:19:28 +0800
Message-ID: <202202041817.Nkp2C2e2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1262731326267716758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220203200403.378958-3-michael.cheng@intel.com>
References: <20220203200403.378958-3-michael.cheng@intel.com>
TO: Michael Cheng <michael.cheng@intel.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: tvrtko.ursulin(a)linux.intel.com
CC: michael.cheng(a)intel.com
CC: wayne.boyer(a)intel.com
CC: casey.g.bowman(a)intel.com
CC: lucas.demarchi(a)intel.com
CC: dri-devel(a)lists.freedesktop.org

Hi Michael,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next drm/=
drm-next tegra-drm/drm/tegra/for-next v5.17-rc2 next-20220203]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Cheng/Use-drm_clfl=
ush-instead-of-clflush/20220204-040643
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220204/202202041817.Nkp2C2e2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:2743 reset_csb_pointer=
s() warn: taking sizeof binop

Old smatch warnings:
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:391 __unwind_incomplet=
e_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3837 execlists_create_=
virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/intel_execlists_submission.c:3838 execlists_create_=
virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +2743 drivers/gpu/drm/i915/gt/intel_execlists_submission.c

ef11c01db405b4 drivers/gpu/drm/i915/intel_lrc.c                     Chris W=
ilson  2016-12-18  2711  =

23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2712  static void reset_csb_pointers(struct intel_engine=
_cs *engine)
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2713  {
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2714  	struct intel_engine_execlists * const execlists =
=3D &engine->execlists;
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2715  	const unsigned int reset_value =3D execlists->csb=
_size - 1;
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2716  =

23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2717  	ring_set_paused(engine, 0);
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2718  =

b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2719  	/*
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2720  	 * Sometimes Icelake forgets to reset its pointer=
s on a GPU reset.
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2721  	 * Bludgeon them with a mmio update to be sure.
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2722  	 */
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2723  	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2724  		     0xffff << 16 | reset_value << 8 | reset_val=
ue);
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2725  	ENGINE_POSTING_READ(engine, RING_CONTEXT_STATUS_P=
TR);
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2726  =

23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2727  	/*
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2728  	 * After a reset, the HW starts writing into CSB =
entry [0]. We
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2729  	 * therefore have to set our HEAD pointer back on=
e entry so that
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2730  	 * the *first* entry we check is entry 0. To comp=
licate this further,
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2731  	 * as we don't wait for the first interrupt after=
 reset, we have to
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2732  	 * fake the HW write to point back to the last en=
try so that our
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2733  	 * inline comparison of our cached head position =
against the last HW
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2734  	 * write works even before the first interrupt.
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2735  	 */
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2736  	execlists->csb_head =3D reset_value;
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2737  	WRITE_ONCE(*execlists->csb_write, reset_value);
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2738  	wmb(); /* Make sure this is visible to HW (parano=
ia?) */
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2739  =

233c1ae3c83f21 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-09-15  2740  	/* Check that the GPU does indeed update the CSB =
entries! */
233c1ae3c83f21 drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-09-15  2741  	memset(execlists->csb_status, -1, (reset_value + =
1) * sizeof(u64));
394d677552381d drivers/gpu/drm/i915/gt/intel_execlists_submission.c Michael=
 Cheng 2022-02-03  2742  	drm_clflush_virt_range(&execlists->csb_status[0],
394d677552381d drivers/gpu/drm/i915/gt/intel_execlists_submission.c Michael=
 Cheng 2022-02-03 @2743  				sizeof(&execlists->csb_status[reset_value]));
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2744  =

b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2745  	/* Once more for luck and our trusty paranoia */
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2746  	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2747  		     0xffff << 16 | reset_value << 8 | reset_val=
ue);
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2748  	ENGINE_POSTING_READ(engine, RING_CONTEXT_STATUS_P=
TR);
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2749  =

b428d57006663d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-05-13  2750  	GEM_BUG_ON(READ_ONCE(*execlists->csb_write) !=3D =
reset_value);
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2751  }
23122a4d992b5d drivers/gpu/drm/i915/gt/intel_lrc.c                  Chris W=
ilson  2020-04-16  2752  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1262731326267716758==--

