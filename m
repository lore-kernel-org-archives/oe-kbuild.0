Content-Type: multipart/mixed; boundary="===============4421200619396767626=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Avoid gem_context->mutex for simple vma lookup
Date: Tue, 17 Mar 2020 16:55:32 +0300
Message-ID: <20200317135532.GD4650@kadam>
In-Reply-To: <20200316225153.3394-1-chris@chris-wilson.co.uk>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4421200619396767626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20200316]
[cannot apply to v5.6-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/drm-i915-gem-=
Avoid-gem_context-mutex-for-simple-vma-lookup/20200317-110430
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:815 eb_lookup_vmas() error: =
uninitialized symbol 'obj'.

Old smatch warnings:
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1111 reloc_move_to_gpu() war=
n: maybe use && instead of &
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:1599 eb_move_to_gpu() warn: =
maybe use && instead of &
drivers/gpu/drm/i915/gem/i915_gem_context.h:201 i915_gem_context_get_engine=
() warn: inconsistent indenting
drivers/gpu/drm/i915/gem/i915_gem_context.h:203 i915_gem_context_get_engine=
() warn: inconsistent indenting

# https://github.com/0day-ci/linux/commit/88e913b4b889b5b70ae708967ff75a045=
27b50af
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 88e913b4b889b5b70ae708967ff75a04527b50af
vim +/obj +815 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c

2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  731  static int eb_lookup_vmas(struct i915_execbuffer *eb)
3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  732  {
8f2a1057d6ec21 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2019-04-25  733  	struct radix_tree_root *handles_vma =3D &eb->gem_context=
->handles_vma;
ac70ebe873f516 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-09-12  734  	struct drm_i915_gem_object *obj;
                                                                           =
                                                ^^^^
Uninitialized

746c8f143afad7 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2018-06-10  735  	unsigned int i, batch;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  736  	int err;
3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  737  =

003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  738  	if (unlikely(i915_gem_context_is_closed(eb->gem_context)=
))
003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  739  		return -ENOENT;
003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  740  =

2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  741  	INIT_LIST_HEAD(&eb->relocs);
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  742  	INIT_LIST_HEAD(&eb->unbound);
d55495b4dcce2e drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-15  743  =

746c8f143afad7 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2018-06-10  744  	batch =3D eb_batch_index(eb);
746c8f143afad7 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2018-06-10  745  =

170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  746  	for (i =3D 0; i < eb->buffer_count; i++) {
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  747  		u32 handle =3D eb->exec[i].handle;
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  748  		struct i915_lut_handle *lut;
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  749  		struct i915_vma *vma;
4ff4b44cbb70c2 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  750  =

88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  751  lookup:
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  752  		rcu_read_lock();
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  753  		vma =3D radix_tree_lookup(handles_vma, handle);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  754  		if (likely(vma))
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  755  			vma =3D i915_vma_tryget(vma);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  756  		rcu_read_unlock();
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  757  		if (likely(vma))
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  758  			goto add_vma;
                                                                           =
                                     ^^^^^^^^^^^^
Assume we hit this goto

3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  759  =

170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  760  		obj =3D i915_gem_object_lookup(eb->file, handle);
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  761  		if (unlikely(!obj)) {
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  762  			err =3D -ENOENT;
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  763  			goto err_vma;
27173f1f95db5e drivers/gpu/drm/i915/i915_gem_execbuffer.c     Ben Widawsky =
 2013-08-14  764  		}
6f65e29acad749 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Ben Widawsky =
 2013-12-06  765  =

f5d974f9d2a811 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-07-30  766  		vma =3D i915_vma_instance(obj, eb->context->vm, NULL);
772b5408e3aac9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chengguang Xu=
 2019-02-21  767  		if (IS_ERR(vma)) {
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  768  			err =3D PTR_ERR(vma);
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  769  			goto err_obj;
27173f1f95db5e drivers/gpu/drm/i915/i915_gem_execbuffer.c     Ben Widawsky =
 2013-08-14  770  		}
27173f1f95db5e drivers/gpu/drm/i915/i915_gem_execbuffer.c     Ben Widawsky =
 2013-08-14  771  =

13f1bfd3b3329b drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2019-02-28  772  		lut =3D i915_lut_handle_alloc();
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  773  		if (unlikely(!lut)) {
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  774  			err =3D -ENOMEM;
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  775  			goto err_obj;
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  776  		}
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  777  =

155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  778  		/* transfer ref to lut */
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  779  		i915_gem_object_get(obj);
155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  780  		if (!atomic_fetch_inc(&vma->open_count))
3365e2268b6bc3 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2018-05-03  781  			i915_vma_reopen(vma);
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  782  		lut->handle =3D handle;
155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  783  		lut->ctx =3D eb->gem_context;
155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  784  =

88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  785  		mutex_lock(&eb->gem_context->mutex);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  786  		err =3D -ENOENT;
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  787  		if (unlikely(!i915_gem_context_is_closed(eb->gem_contex=
t)))
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  788  			err =3D radix_tree_insert(handles_vma, handle, vma);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  789  		mutex_unlock(&eb->gem_context->mutex);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  790  		if (unlikely(err)) {
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  791  			atomic_dec(&vma->open_count);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  792  			i915_gem_object_put(obj);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  793  			i915_lut_handle_free(lut);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  794  			i915_gem_object_put(obj);
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  795  			if (err =3D=3D -EEXIST)
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  796  				goto lookup;
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  797  			goto err_vma;
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  798  		}
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  799  =

155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  800  		i915_gem_object_lock(obj);
155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  801  		list_add(&lut->obj_link, &obj->lut_list);
155ab8836caa69 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2019-06-06  802  		i915_gem_object_unlock(obj);
d1b48c1e7184d9 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  803  =

170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  804  add_vma:
003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  805  		err =3D eb_validate_vma(eb, &eb->exec[i], vma);
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  806  		if (unlikely(err))
88e913b4b889b5 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-16  807  			goto err_obj;

And this goto

dade2a6165fd7b drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  808  =

003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  809  		eb_add_vma(eb, i, batch, vma);
3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  810  	}
3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  811  =

003d8b9143a69f drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  812  	return 0;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  813  =

170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  814  err_obj:
170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16 @815  	i915_gem_object_put(obj);
                                                                           =
                                         ^^^

170fa29b14fadf drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-08-16  816  err_vma:
7d6236bb13352c drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c Chris Wilson =
 2020-03-03  817  	eb->vma[i].vma =3D NULL;
2889caa9232109 drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2017-06-16  818  	return err;
3b96eff447b4ca drivers/gpu/drm/i915/i915_gem_execbuffer.c     Chris Wilson =
 2013-01-08  819  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4421200619396767626==--

