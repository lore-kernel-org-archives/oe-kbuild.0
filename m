Content-Type: multipart/mixed; boundary="===============2139639711100684763=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [mlankhorst:locking-rework 11/13] drivers/gpu/drm/i915/gt/intel_renderstate.c:233 intel_renderstate_init() error: uninitialized symbol 'obj'.
Date: Mon, 13 Jan 2020 13:37:44 +0300
Message-ID: <20200113103743.GB9488@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2139639711100684763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://people.freedesktop.org/~mlankhorst/linux locking-rework
head:   9f6ac3cc57cdcc31f3dad6a029e3a09464d47a67
commit: 8ecb06e80c2bbd0f47689a5c6720f7e87344d34d [11/13] drm/i915: Use ww l=
ocking in intel_renderstate.

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gt/intel_renderstate.c:233 intel_renderstate_init() er=
ror: uninitialized symbol 'obj'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_object.h:124 __i915_gem_object_lock() err=
or: we previously assumed 'ww' could be null (see line 116)

git remote add mlankhorst git://people.freedesktop.org/~mlankhorst/linux
git remote update mlankhorst
git checkout 8ecb06e80c2bbd0f47689a5c6720f7e87344d34d
vim +/obj +233 drivers/gpu/drm/i915/gt/intel_renderstate.c

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  171  int intel_renderstate_init(struct intel_renderstate *so,
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  172  			   struct intel_context *ce)
9d0a6fa6c5e618 drivers/gpu/drm/i915/i915_gem_render_state.c Mika Kuoppala  =
   2014-05-14  173  {
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  174  	struct intel_engine_cs *engine =3D ce->engine;
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  175  	struct drm_i915_gem_object *obj;
7c2fa7faf18f80 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2017-11-10  176  	int err;
9d0a6fa6c5e618 drivers/gpu/drm/i915/i915_gem_render_state.c Mika Kuoppala  =
   2014-05-14  177  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  178  	memset(so, 0, sizeof(*so));
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  179  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  180  	so->rodata =3D render_state_get_rodata(engine);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  181  	if (so->rodata) {
                                                                           =
                         ^^^^^^^^^^
"obj" isn't initialize in it's writable

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  182  		if (so->rodata->batch_items * 4 > PAGE_SIZE)
15d21db8723984 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-08-02  183  			return -EINVAL;
564ddb2fae4da0 drivers/gpu/drm/i915/i915_gem_render_state.c Oscar Mateo    =
   2014-08-21  184  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  185  		obj =3D i915_gem_object_create_internal(engine->i915,=
 PAGE_SIZE);
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  186  		if (IS_ERR(obj))
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  187  			return PTR_ERR(obj);
4e50f082ac51c9 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-10-28  188  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  189  		so->vma =3D i915_vma_instance(obj, &engine->gt->ggtt-=
>vm, NULL);
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  190  		if (IS_ERR(so->vma)) {
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  191  			err =3D PTR_ERR(so->vma);
15d21db8723984 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-08-02  192  			goto err_obj;
a5e85c8a4dca07 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-08-15  193  		}
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  194  	}
564ddb2fae4da0 drivers/gpu/drm/i915/i915_gem_render_state.c Oscar Mateo    =
   2014-08-21  195  =

8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  196  	i915_gem_ww_ctx_init(&so->ww, true);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  197  retry:
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  198  	err =3D intel_context_pin(ce);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  199  	if (err)
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  200  		goto err_fini;

And we this this goto.

8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  201  =

8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  202  	/* return early if there's nothing to setup */
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  203  	if (!err && !so->rodata)
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  204  		return 0;
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  205  =

8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  206  	err =3D i915_gem_object_lock(so->vma->obj, &so->ww);
7c2fa7faf18f80 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2017-11-10  207  	if (err)
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  208  		goto err_context;
4c7d62c6b8a2b4 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-10-28  209  =

8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  210  	err =3D i915_vma_pin(so->vma, 0, 0, PIN_GLOBAL | PIN_H=
IGH);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  211  	if (err)
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  212  		goto err_context;
7e82ad50023cee drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-04  213  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  214  	err =3D render_state_setup(so, engine->i915);
7c2fa7faf18f80 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2017-11-10  215  	if (err)
15d21db8723984 drivers/gpu/drm/i915/i915_gem_render_state.c Chris Wilson   =
   2016-08-02  216  		goto err_unpin;
9d0a6fa6c5e618 drivers/gpu/drm/i915/i915_gem_render_state.c Mika Kuoppala  =
   2014-05-14  217  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  218  	return 0;
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  219  =

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  220  err_unpin:
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  221  	i915_vma_unpin(so->vma);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  222  err_context:
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  223  	intel_context_unpin(ce);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  224  err_fini:
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  225  	if (err =3D=3D -EDEADLK) {
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  226  		err =3D i915_gem_ww_ctx_backoff(&so->ww);
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  227  		if (!err)
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  228  			goto retry;
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  229  	}
8ecb06e80c2bbd drivers/gpu/drm/i915/gt/intel_renderstate.c  Maarten Lankhor=
st 2019-12-18  230  	i915_gem_ww_ctx_fini(&so->ww);
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  231  	i915_vma_close(so->vma);
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  232  err_obj:
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02 @233  	i915_gem_object_put(obj);
                                                                           =
                     ^^^^^^^^^^^^^^^^^^^^^^^^
Problem.

42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  234  	so->vma =3D NULL;
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  235  	return err;
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  236  }
42d105113018a5 drivers/gpu/drm/i915/gt/intel_renderstate.c  Chris Wilson   =
   2019-12-02  237  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============2139639711100684763==--

