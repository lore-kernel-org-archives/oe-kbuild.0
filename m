Content-Type: multipart/mixed; boundary="===============8057224640414547680=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/i915/gem/i915_gem_mman.c:961:20: error: dereference of NULL 'mmo' [CWE-476]
Date: Fri, 05 Aug 2022 04:26:53 +0800
Message-ID: <202208050420.DMCkrna5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8057224640414547680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
commit: cf3e3e86d77970211e0983130e896ae242601003 drm/i915: Use ttm mmap han=
dling for ttm bo's.
date:   1 year, 2 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 1 year, 2 months ago
config: x86_64-randconfig-c001-20220801 (https://download.01.org/0day-ci/ar=
chive/20220805/202208050420.DMCkrna5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcf3e3e86d77970211e0983130e896ae242601003
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cf3e3e86d77970211e0983130e896ae242601003
        # save the config file
        make =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/gpu/drm/i915/gem/i915_gem_mman.c: In function 'i915_gem_mmap':
>> drivers/gpu/drm/i915/gem/i915_gem_mman.c:961:20: error: dereference of N=
ULL 'mmo' [CWE-476] [-Werror=3Danalyzer-null-dereference]
     961 |         switch (mmo->mmap_type) {
         |                 ~~~^~~~~~~~~~~
     'i915_gem_mmap': events 1-4
       |
       |  880 | int i915_gem_mmap(struct file *filp, struct vm_area_struct =
*vma)
       |      |     ^~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'i915_gem_mmap'
       |......
       |  889 |         if (drm_dev_is_unplugged(dev))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  892 |         rcu_read_lock();
       |      |         ~~~~~~~~~~~~~
       |      |         |
       |      |         (3) ...to here
       |  893 |         drm_vma_offset_lock_lookup(dev->vma_offset_manager);
       |  894 |         node =3D drm_vma_offset_exact_lookup_locked(dev->vm=
a_offset_manager,
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                |
       |      |                (4) calling 'drm_vma_offset_exact_lookup_loc=
ked' from 'i915_gem_mmap'
       |  895 |                                                   vma->vm_p=
goff,
       |      |                                                   ~~~~~~~~~=
~~~~~
       |  896 |                                                   vma_pages=
(vma));
       |      |                                                   ~~~~~~~~~=
~~~~~~
       |
       +--> 'drm_vma_offset_exact_lookup_locked': event 5
              |
              |include/drm/drm_vma_manager.h:95:1:
              |   95 | drm_vma_offset_exact_lookup_locked(struct drm_vma_of=
fset_manager *mgr,
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'drm_vma_offset_exact_lookup_locked'
              |
            'drm_vma_offset_exact_lookup_locked': event 6
              |
              |  102 |         return (node && node->vm_node.start =3D=3D s=
tart) ? node : NULL;
              |
            'drm_vma_offset_exact_lookup_locked': event 7
              |
              |  102 |         return (node && node->vm_node.start =3D=3D s=
tart) ? node : NULL;
              |
       <------+
       |
     'i915_gem_mmap': events 8-13
       |
       |drivers/gpu/drm/i915/gem/i915_gem_mman.c:894:16:
       |  894 |         node =3D drm_vma_offset_exact_lookup_locked(dev->vm=
a_offset_manager,
       |      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~
       |      |                |
       |      |                (8) returning to 'i915_gem_mmap' from 'drm_v=
ma_offset_exact_lookup_locked'
       |  895 |                                                   vma->vm_p=
goff,
       |      |                                                   ~~~~~~~~~=
~~~~~
       |  896 |                                                   vma_pages=
(vma));
       |      |                                                   ~~~~~~~~~=
~~~~~~
       |  897 |         if (node && drm_vma_node_is_allowed(node, priv)) {
       |      |            ~    =

       |      |            |
       |      |            (9) following 'true' branch...
       |......
       |  903 |                 if (!node->driver_private) {
       |      |                 ~~ ~
       |      |                 |  |
       |      |                 |  (11) following 'false' branch...
       |      |                 (10) ...to here
       |......
       |  909 |                         obj =3D i915_gem_object_get_rcu
       |      |                         ~~~   ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |     |
       |      |                         |     (13) calling 'i915_gem_object=
_get_rcu' from 'i915_gem_mmap'
       |      |                         (12) ...to here
       |  910 |                                 (container_of(node, struct =
drm_i915_gem_object,
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
       |  911 |                                               base.vma_node=
));
       |      |                                               ~~~~~~~~~~~~~=
~~
       |
       +--> 'i915_gem_object_get_rcu': events 14-15
              |
              |drivers/gpu/drm/i915/gem/i915_gem_object.h:105:1:
              |  105 | i915_gem_object_get_rcu(struct drm_i915_gem_object *=
obj)
              |      | ^~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (14) entry to 'i915_gem_object_get_rcu'
              |  106 | {
              |  107 |         if (obj && !kref_get_unless_zero(&obj->base.=
refcount))
              |      |            ~
              |      |            |
              |      |            (15) following 'true' branch (when 'obj' =
is non-NULL)...
              |
            'i915_gem_object_get_rcu': events 16-17
              |
              |include/linux/kref.h:111:9:
              |  111 |         return refcount_inc_not_zero(&kref->refcount=
);
              |      |         ^~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |      |
              |      |         |      (17) calling 'refcount_inc_not_zero' =
from 'i915_gem_object_get_rcu'
              |      |         (16) ...to here
              |


vim +/mmo +961 drivers/gpu/drm/i915/gem/i915_gem_mman.c

f17b898009d8c9 Chris Wilson      2020-01-01  873  =

cc662126b4134e Abdiel Janulgue   2019-12-04  874  /*
cc662126b4134e Abdiel Janulgue   2019-12-04  875   * This overcomes the lim=
itation in drm_gem_mmap's assignment of a
cc662126b4134e Abdiel Janulgue   2019-12-04  876   * drm_gem_object as the =
vma->vm_private_data. Since we need to
cc662126b4134e Abdiel Janulgue   2019-12-04  877   * be able to resolve mul=
tiple mmap offsets which could be tied
cc662126b4134e Abdiel Janulgue   2019-12-04  878   * to a single gem object.
cc662126b4134e Abdiel Janulgue   2019-12-04  879   */
cc662126b4134e Abdiel Janulgue   2019-12-04  880  int i915_gem_mmap(struct =
file *filp, struct vm_area_struct *vma)
cc662126b4134e Abdiel Janulgue   2019-12-04  881  {
cc662126b4134e Abdiel Janulgue   2019-12-04  882  	struct drm_vma_offset_no=
de *node;
cc662126b4134e Abdiel Janulgue   2019-12-04  883  	struct drm_file *priv =
=3D filp->private_data;
cc662126b4134e Abdiel Janulgue   2019-12-04  884  	struct drm_device *dev =
=3D priv->minor->dev;
280d14a69da2e7 Chris Wilson      2020-01-30  885  	struct drm_i915_gem_obje=
ct *obj =3D NULL;
cc662126b4134e Abdiel Janulgue   2019-12-04  886  	struct i915_mmap_offset =
*mmo =3D NULL;
f17b898009d8c9 Chris Wilson      2020-01-01  887  	struct file *anon;
cc662126b4134e Abdiel Janulgue   2019-12-04  888  =

cc662126b4134e Abdiel Janulgue   2019-12-04  889  	if (drm_dev_is_unplugged=
(dev))
cc662126b4134e Abdiel Janulgue   2019-12-04  890  		return -ENODEV;
cc662126b4134e Abdiel Janulgue   2019-12-04  891  =

280d14a69da2e7 Chris Wilson      2020-01-30  892  	rcu_read_lock();
cc662126b4134e Abdiel Janulgue   2019-12-04  893  	drm_vma_offset_lock_look=
up(dev->vma_offset_manager);
cc662126b4134e Abdiel Janulgue   2019-12-04  894  	node =3D drm_vma_offset_=
exact_lookup_locked(dev->vma_offset_manager,
cc662126b4134e Abdiel Janulgue   2019-12-04  895  						  vma->vm_pgoff,
cc662126b4134e Abdiel Janulgue   2019-12-04  896  						  vma_pages(vma));
280d14a69da2e7 Chris Wilson      2020-01-30  897  	if (node && drm_vma_node=
_is_allowed(node, priv)) {
cc662126b4134e Abdiel Janulgue   2019-12-04  898  		/*
cc662126b4134e Abdiel Janulgue   2019-12-04  899  		 * Skip 0-refcnted obje=
cts as it is in the process of being
cc662126b4134e Abdiel Janulgue   2019-12-04  900  		 * destroyed and will b=
e invalid when the vma manager lock
cc662126b4134e Abdiel Janulgue   2019-12-04  901  		 * is released.
cc662126b4134e Abdiel Janulgue   2019-12-04  902  		 */
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  903  		if (!node->driver_priva=
te) {
280d14a69da2e7 Chris Wilson      2020-01-30  904  			mmo =3D container_of(n=
ode, struct i915_mmap_offset, vma_node);
280d14a69da2e7 Chris Wilson      2020-01-30  905  			obj =3D i915_gem_objec=
t_get_rcu(mmo->obj);
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  906  =

cf3e3e86d77970 Maarten Lankhorst 2021-06-10  907  			GEM_BUG_ON(obj && obj-=
>ops->mmap_ops);
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  908  		} else {
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  909  			obj =3D i915_gem_objec=
t_get_rcu
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  910  				(container_of(node, s=
truct drm_i915_gem_object,
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  911  					      base.vma_node)=
);
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  912  =

cf3e3e86d77970 Maarten Lankhorst 2021-06-10  913  			GEM_BUG_ON(obj && !obj=
->ops->mmap_ops);
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  914  		}
cc662126b4134e Abdiel Janulgue   2019-12-04  915  	}
cc662126b4134e Abdiel Janulgue   2019-12-04  916  	drm_vma_offset_unlock_lo=
okup(dev->vma_offset_manager);
280d14a69da2e7 Chris Wilson      2020-01-30  917  	rcu_read_unlock();
cc662126b4134e Abdiel Janulgue   2019-12-04  918  	if (!obj)
280d14a69da2e7 Chris Wilson      2020-01-30  919  		return node ? -EACCES :=
 -EINVAL;
cc662126b4134e Abdiel Janulgue   2019-12-04  920  =

280d14a69da2e7 Chris Wilson      2020-01-30  921  	if (i915_gem_object_is_r=
eadonly(obj)) {
cc662126b4134e Abdiel Janulgue   2019-12-04  922  		if (vma->vm_flags & VM_=
WRITE) {
280d14a69da2e7 Chris Wilson      2020-01-30  923  			i915_gem_object_put(ob=
j);
cc662126b4134e Abdiel Janulgue   2019-12-04  924  			return -EINVAL;
cc662126b4134e Abdiel Janulgue   2019-12-04  925  		}
cc662126b4134e Abdiel Janulgue   2019-12-04  926  		vma->vm_flags &=3D ~VM_=
MAYWRITE;
cc662126b4134e Abdiel Janulgue   2019-12-04  927  	}
cc662126b4134e Abdiel Janulgue   2019-12-04  928  =

280d14a69da2e7 Chris Wilson      2020-01-30  929  	anon =3D mmap_singleton(=
to_i915(dev));
f17b898009d8c9 Chris Wilson      2020-01-01  930  	if (IS_ERR(anon)) {
280d14a69da2e7 Chris Wilson      2020-01-30  931  		i915_gem_object_put(obj=
);
f17b898009d8c9 Chris Wilson      2020-01-01  932  		return PTR_ERR(anon);
f17b898009d8c9 Chris Wilson      2020-01-01  933  	}
f17b898009d8c9 Chris Wilson      2020-01-01  934  =

cc662126b4134e Abdiel Janulgue   2019-12-04  935  	vma->vm_flags |=3D VM_PF=
NMAP | VM_DONTEXPAND | VM_DONTDUMP;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  936  =

cf3e3e86d77970 Maarten Lankhorst 2021-06-10  937  	if (i915_gem_object_has_=
iomem(obj))
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  938  		vma->vm_flags |=3D VM_I=
O;
cc662126b4134e Abdiel Janulgue   2019-12-04  939  =

f17b898009d8c9 Chris Wilson      2020-01-01  940  	/*
f17b898009d8c9 Chris Wilson      2020-01-01  941  	 * We keep the ref on mm=
o->obj, not vm_file, but we require
f17b898009d8c9 Chris Wilson      2020-01-01  942  	 * vma->vm_file->f_mappi=
ng, see vma_link(), for later revocation.
f17b898009d8c9 Chris Wilson      2020-01-01  943  	 * Our userspace is accu=
stomed to having per-file resource cleanup
f17b898009d8c9 Chris Wilson      2020-01-01  944  	 * (i.e. contexts, objec=
ts and requests) on their close(fd), which
f17b898009d8c9 Chris Wilson      2020-01-01  945  	 * requires avoiding ext=
raneous references to their filp, hence why
f17b898009d8c9 Chris Wilson      2020-01-01  946  	 * we prefer to use an a=
nonymous file for their mmaps.
f17b898009d8c9 Chris Wilson      2020-01-01  947  	 */
295992fb815e79 Christian K=C3=B6nig   2020-09-14  948  	vma_set_file(vma, a=
non);
295992fb815e79 Christian K=C3=B6nig   2020-09-14  949  	/* Drop the initial=
 creation reference, the vma is now holding one. */
295992fb815e79 Christian K=C3=B6nig   2020-09-14  950  	fput(anon);
f17b898009d8c9 Chris Wilson      2020-01-01  951  =

cf3e3e86d77970 Maarten Lankhorst 2021-06-10  952  	if (obj->ops->mmap_ops) {
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  953  		vma->vm_page_prot =3D p=
gprot_decrypted(vm_get_page_prot(vma->vm_flags));
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  954  		vma->vm_ops =3D obj->op=
s->mmap_ops;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  955  		vma->vm_private_data =
=3D node->driver_private;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  956  		return 0;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  957  	}
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  958  =

cf3e3e86d77970 Maarten Lankhorst 2021-06-10  959  	vma->vm_private_data =3D=
 mmo;
cf3e3e86d77970 Maarten Lankhorst 2021-06-10  960  =

cc662126b4134e Abdiel Janulgue   2019-12-04 @961  	switch (mmo->mmap_type) {
cc662126b4134e Abdiel Janulgue   2019-12-04  962  	case I915_MMAP_TYPE_WC:
cc662126b4134e Abdiel Janulgue   2019-12-04  963  		vma->vm_page_prot =3D
cc662126b4134e Abdiel Janulgue   2019-12-04  964  			pgprot_writecombine(vm=
_get_page_prot(vma->vm_flags));
cc662126b4134e Abdiel Janulgue   2019-12-04  965  		vma->vm_ops =3D &vm_ops=
_cpu;
cc662126b4134e Abdiel Janulgue   2019-12-04  966  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  967  =

cc662126b4134e Abdiel Janulgue   2019-12-04  968  	case I915_MMAP_TYPE_WB:
cc662126b4134e Abdiel Janulgue   2019-12-04  969  		vma->vm_page_prot =3D v=
m_get_page_prot(vma->vm_flags);
cc662126b4134e Abdiel Janulgue   2019-12-04  970  		vma->vm_ops =3D &vm_ops=
_cpu;
cc662126b4134e Abdiel Janulgue   2019-12-04  971  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  972  =

cc662126b4134e Abdiel Janulgue   2019-12-04  973  	case I915_MMAP_TYPE_UC:
cc662126b4134e Abdiel Janulgue   2019-12-04  974  		vma->vm_page_prot =3D
cc662126b4134e Abdiel Janulgue   2019-12-04  975  			pgprot_noncached(vm_ge=
t_page_prot(vma->vm_flags));
cc662126b4134e Abdiel Janulgue   2019-12-04  976  		vma->vm_ops =3D &vm_ops=
_cpu;
cc662126b4134e Abdiel Janulgue   2019-12-04  977  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  978  =

cc662126b4134e Abdiel Janulgue   2019-12-04  979  	case I915_MMAP_TYPE_GTT:
cc662126b4134e Abdiel Janulgue   2019-12-04  980  		vma->vm_page_prot =3D
cc662126b4134e Abdiel Janulgue   2019-12-04  981  			pgprot_writecombine(vm=
_get_page_prot(vma->vm_flags));
cc662126b4134e Abdiel Janulgue   2019-12-04  982  		vma->vm_ops =3D &vm_ops=
_gtt;
cc662126b4134e Abdiel Janulgue   2019-12-04  983  		break;
cc662126b4134e Abdiel Janulgue   2019-12-04  984  	}
cc662126b4134e Abdiel Janulgue   2019-12-04  985  	vma->vm_page_prot =3D pg=
prot_decrypted(vma->vm_page_prot);
cc662126b4134e Abdiel Janulgue   2019-12-04  986  =

cc662126b4134e Abdiel Janulgue   2019-12-04  987  	return 0;
b414fcd5be0b00 Chris Wilson      2019-05-28  988  }
b414fcd5be0b00 Chris Wilson      2019-05-28  989  =


:::::: The code at line 961 was first introduced by commit
:::::: cc662126b4134e25fcfb6cad480de0fa95a4d3d8 drm/i915: Introduce DRM_I91=
5_GEM_MMAP_OFFSET

:::::: TO: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8057224640414547680==--

