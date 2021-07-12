Content-Type: multipart/mixed; boundary="===============5136046341979462432=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2341:52: warning: Uninitialized variable: pw [uninitvar]
Date: Tue, 13 Jul 2021 06:45:40 +0800
Message-ID: <202107130633.1vd14ku5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5136046341979462432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Chris Wilson <chris@chris-wilson.co.uk>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e73f0f0ee7541171d89f2e2491130c7771ba58d3
commit: c60b93cd4862d108214a14e655358ea714d7a12a drm/i915: Avoid mixing int=
eger types during batch copies
date:   10 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 10 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1535:6: warning: Local va=
riable reloc_gpu shadows outer function [shadowFunction]
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1384:13: note: Shadowed d=
eclaration
   static u32 *reloc_gpu(struct i915_execbuffer *eb,
               ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1535:6: note: Shadow vari=
able
    int reloc_gpu =3D reloc_entry_gpu(eb, vma, offset, target_addr);
        ^
>> drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2341:52: warning: Uniniti=
alized variable: pw [uninitvar]
    GEM_BUG_ON(overflows_type(eb->batch_start_offset, pw->batch_offset));
                                                      ^
   drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:2342:43: warning: Uniniti=
alized variable: pw [uninitvar]
    GEM_BUG_ON(overflows_type(eb->batch_len, pw->batch_length));
                                             ^

vim +2341 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

57a78ca4eceab1 Chris Wilson      2020-06-04  2333  =

686c7c35abc220 Chris Wilson      2019-12-11  2334  static int eb_parse_pipe=
line(struct i915_execbuffer *eb,
686c7c35abc220 Chris Wilson      2019-12-11  2335  			     struct i915_vma =
*shadow,
686c7c35abc220 Chris Wilson      2019-12-11  2336  			     struct i915_vma =
*trampoline)
686c7c35abc220 Chris Wilson      2019-12-11  2337  {
686c7c35abc220 Chris Wilson      2019-12-11  2338  	struct eb_parse_work *p=
w;
686c7c35abc220 Chris Wilson      2019-12-11  2339  	int err;
686c7c35abc220 Chris Wilson      2019-12-11  2340  =

c60b93cd4862d1 Chris Wilson      2020-09-28 @2341  	GEM_BUG_ON(overflows_ty=
pe(eb->batch_start_offset, pw->batch_offset));
c60b93cd4862d1 Chris Wilson      2020-09-28  2342  	GEM_BUG_ON(overflows_ty=
pe(eb->batch_len, pw->batch_length));
c60b93cd4862d1 Chris Wilson      2020-09-28  2343  =

686c7c35abc220 Chris Wilson      2019-12-11  2344  	pw =3D kzalloc(sizeof(*=
pw), GFP_KERNEL);
686c7c35abc220 Chris Wilson      2019-12-11  2345  	if (!pw)
686c7c35abc220 Chris Wilson      2019-12-11  2346  		return -ENOMEM;
686c7c35abc220 Chris Wilson      2019-12-11  2347  =

7d6236bb13352c Chris Wilson      2020-03-03  2348  	err =3D i915_active_acq=
uire(&eb->batch->vma->active);
36c8e356a76e14 Chris Wilson      2020-01-13  2349  	if (err)
36c8e356a76e14 Chris Wilson      2020-01-13  2350  		goto err_free;
36c8e356a76e14 Chris Wilson      2020-01-13  2351  =

36c8e356a76e14 Chris Wilson      2020-01-13  2352  	err =3D i915_active_acq=
uire(&shadow->active);
36c8e356a76e14 Chris Wilson      2020-01-13  2353  	if (err)
36c8e356a76e14 Chris Wilson      2020-01-13  2354  		goto err_batch;
36c8e356a76e14 Chris Wilson      2020-01-13  2355  =

36c8e356a76e14 Chris Wilson      2020-01-13  2356  	if (trampoline) {
36c8e356a76e14 Chris Wilson      2020-01-13  2357  		err =3D i915_active_ac=
quire(&trampoline->active);
36c8e356a76e14 Chris Wilson      2020-01-13  2358  		if (err)
36c8e356a76e14 Chris Wilson      2020-01-13  2359  			goto err_shadow;
36c8e356a76e14 Chris Wilson      2020-01-13  2360  	}
36c8e356a76e14 Chris Wilson      2020-01-13  2361  =

686c7c35abc220 Chris Wilson      2019-12-11  2362  	dma_fence_work_init(&pw=
->base, &eb_parse_ops);
686c7c35abc220 Chris Wilson      2019-12-11  2363  =

686c7c35abc220 Chris Wilson      2019-12-11  2364  	pw->engine =3D eb->engi=
ne;
7d6236bb13352c Chris Wilson      2020-03-03  2365  	pw->batch =3D eb->batch=
->vma;
686c7c35abc220 Chris Wilson      2019-12-11  2366  	pw->batch_offset =3D eb=
->batch_start_offset;
686c7c35abc220 Chris Wilson      2019-12-11  2367  	pw->batch_length =3D eb=
->batch_len;
686c7c35abc220 Chris Wilson      2019-12-11  2368  	pw->shadow =3D shadow;
686c7c35abc220 Chris Wilson      2019-12-11  2369  	pw->trampoline =3D tram=
poline;
686c7c35abc220 Chris Wilson      2019-12-11  2370  =

57a78ca4eceab1 Chris Wilson      2020-06-04  2371  	/* Mark active refs ear=
ly for this worker, in case we get interrupted */
57a78ca4eceab1 Chris Wilson      2020-06-04  2372  	err =3D parser_mark_act=
ive(pw, eb->context->timeline);
57a78ca4eceab1 Chris Wilson      2020-06-04  2373  	if (err)
57a78ca4eceab1 Chris Wilson      2020-06-04  2374  		goto err_commit;
57a78ca4eceab1 Chris Wilson      2020-06-04  2375  =

686c7c35abc220 Chris Wilson      2019-12-11  2376  	err =3D dma_resv_reserv=
e_shared(pw->batch->resv, 1);
686c7c35abc220 Chris Wilson      2019-12-11  2377  	if (err)
c43ce12328df07 Maarten Lankhorst 2020-08-19  2378  		goto err_commit;
686c7c35abc220 Chris Wilson      2019-12-11  2379  =

686c7c35abc220 Chris Wilson      2019-12-11  2380  	/* Wait for all writes =
(and relocs) into the batch to complete */
686c7c35abc220 Chris Wilson      2019-12-11  2381  	err =3D i915_sw_fence_a=
wait_reservation(&pw->base.chain,
686c7c35abc220 Chris Wilson      2019-12-11  2382  					      pw->batch->re=
sv, NULL, false,
686c7c35abc220 Chris Wilson      2019-12-11  2383  					      0, I915_FENCE=
_GFP);
686c7c35abc220 Chris Wilson      2019-12-11  2384  	if (err < 0)
c43ce12328df07 Maarten Lankhorst 2020-08-19  2385  		goto err_commit;
686c7c35abc220 Chris Wilson      2019-12-11  2386  =

686c7c35abc220 Chris Wilson      2019-12-11  2387  	/* Keep the batch alive=
 and unwritten as we parse */
686c7c35abc220 Chris Wilson      2019-12-11  2388  	dma_resv_add_shared_fen=
ce(pw->batch->resv, &pw->base.dma);
686c7c35abc220 Chris Wilson      2019-12-11  2389  =

686c7c35abc220 Chris Wilson      2019-12-11  2390  	/* Force execution to w=
ait for completion of the parser */
686c7c35abc220 Chris Wilson      2019-12-11  2391  	dma_resv_add_excl_fence=
(shadow->resv, &pw->base.dma);
686c7c35abc220 Chris Wilson      2019-12-11  2392  =

92581f9fb99ca4 Chris Wilson      2020-03-25  2393  	dma_fence_work_commit_i=
mm(&pw->base);
686c7c35abc220 Chris Wilson      2019-12-11  2394  	return 0;
686c7c35abc220 Chris Wilson      2019-12-11  2395  =

57a78ca4eceab1 Chris Wilson      2020-06-04  2396  err_commit:
57a78ca4eceab1 Chris Wilson      2020-06-04  2397  	i915_sw_fence_set_error=
_once(&pw->base.chain, err);
57a78ca4eceab1 Chris Wilson      2020-06-04  2398  	dma_fence_work_commit_i=
mm(&pw->base);
57a78ca4eceab1 Chris Wilson      2020-06-04  2399  	return err;
57a78ca4eceab1 Chris Wilson      2020-06-04  2400  =

36c8e356a76e14 Chris Wilson      2020-01-13  2401  err_shadow:
36c8e356a76e14 Chris Wilson      2020-01-13  2402  	i915_active_release(&sh=
adow->active);
36c8e356a76e14 Chris Wilson      2020-01-13  2403  err_batch:
7d6236bb13352c Chris Wilson      2020-03-03  2404  	i915_active_release(&eb=
->batch->vma->active);
36c8e356a76e14 Chris Wilson      2020-01-13  2405  err_free:
686c7c35abc220 Chris Wilson      2019-12-11  2406  	kfree(pw);
686c7c35abc220 Chris Wilson      2019-12-11  2407  	return err;
686c7c35abc220 Chris Wilson      2019-12-11  2408  }
686c7c35abc220 Chris Wilson      2019-12-11  2409  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5136046341979462432==--

