Content-Type: multipart/mixed; boundary="===============2519159904863693645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/virtio: Fix NULL vs IS_ERR checking in virtio_gpu_object_shmem_init
Date: Sun, 02 Jan 2022 08:59:41 +0800
Message-ID: <202201020823.RqskJWLZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2519159904863693645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211222072649.18169-1-linmq006@gmail.com>
References: <20211222072649.18169-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>
CC: linmq006(a)gmail.com
CC: David Airlie <airlied@linux.ie>
CC: linux-kernel(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Gurchetan Singh <gurchetansingh@chromium.org>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: virtualization(a)lists.linux-foundation.org

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.16-rc6]
[cannot apply to drm/drm-next next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/drm-virtio-Fi=
x-NULL-vs-IS_ERR-checking-in-virtio_gpu_object_shmem_init/20211222-152857
base:    a7904a538933c525096ca2ccde1e60d0ee62c08e
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm-randconfig-c002-20211228 (https://download.01.org/0day-ci/archi=
ve/20220102/202201020823.RqskJWLZ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/fa5dcbfe5084bcdae76ccb313=
f3099bf06063c57
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/drm-virtio-Fix-NULL-v=
s-IS_ERR-checking-in-virtio_gpu_object_shmem_init/20211222-152857
        git checkout fa5dcbfe5084bcdae76ccb313f3099bf06063c57
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           if (error || !*bpp || !tp)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:380:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:380:21: note: Left side of '||' is true
           if (error || !*bpp || !tp)
                              ^
   fs/xfs/libxfs/xfs_da_btree.c:381:3: note: Returning zero (loaded from 'e=
rror'), which participates in a condition later
                   return error;
                   ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1604:11: note: Returning from 'xfs_da3_node=
_read'
                   error =3D xfs_da3_node_read(args->trans, args->dp, blkno,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1606:7: note: 'error' is 0
                   if (error) {
                       ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:1606:3: note: Taking false branch
                   if (error) {
                   ^
   fs/xfs/libxfs/xfs_da_btree.c:1611:10: note: Access to field 'b_addr' res=
ults in a dereference of a null pointer (loaded from field 'bp')
                   curr =3D blk->bp->b_addr;
                          ^    ~~
   fs/xfs/libxfs/xfs_da_btree.c:2203:22: warning: Dereference of null point=
er [clang-analyzer-core.NullDereference]
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
                               ^~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2153:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2153:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2163:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2163:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2166:9: note: Assuming 'nmap' is <=3D 1
           ASSERT(nmap <=3D 1);
                  ^
   fs/xfs/xfs_linux.h:207:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   fs/xfs/libxfs/xfs_da_btree.c:2166:9: note: 'nmap' is <=3D 1
           ASSERT(nmap <=3D 1);
                  ^
   fs/xfs/xfs_linux.h:207:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2166:2: note: '?' condition is true
           ASSERT(nmap <=3D 1);
           ^
   fs/xfs/xfs_linux.h:207:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/libxfs/xfs_da_btree.c:2167:6: note: Assuming 'nmap' is not equal =
to 1
           if (nmap =3D=3D 1) {
               ^~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2167:2: note: Taking false branch
           if (nmap =3D=3D 1) {
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2170:13: note: Assuming 'nmap' is not equal=
 to 0
           } else if (nmap =3D=3D 0 && count > 1) {
                      ^~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2170:23: note: Left side of '&&' is false
           } else if (nmap =3D=3D 0 && count > 1) {
                                ^
   fs/xfs/libxfs/xfs_da_btree.c:2195:3: note: Null pointer value stored to =
'mapp'
                   mapp =3D NULL;
                   ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2201:2: note: Loop condition is false. Exec=
ution continues on line 2203
           for (i =3D 0, got =3D 0; i < mapi; i++)
           ^
   fs/xfs/libxfs/xfs_da_btree.c:2203:6: note: Assuming 'got' is equal to 'c=
ount'
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
               ^~~~~~~~~~~~
   fs/xfs/libxfs/xfs_da_btree.c:2203:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_da_btree.c:2203:22: note: Dereference of null pointer
           if (got !=3D count || mapp[0].br_startoff !=3D *bno ||
                               ^~~~~~~~~~~~~~~~~~~
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> drivers/gpu/drm/virtio/virtgpu_object.c:253:3: warning: Use of memory af=
ter it is freed [clang-analyzer-unix.Malloc]
                   return ret;
                   ^      ~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:227:2: note: Taking false branch
           if (IS_ERR(shmem_obj))
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:232:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/virtio/virtgpu_object.c:232:2: note: Taking false branch
           if (ret < 0)
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:237:6: note: Assuming 'fence' is=
 null
           if (fence) {
               ^~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:237:2: note: Taking false branch
           if (fence) {
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:250:6: note: Assuming 'ret' is n=
ot equal to 0
           if (ret !=3D 0) {
               ^~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:250:2: note: Taking true branch
           if (ret !=3D 0) {
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:252:3: note: Calling 'virtio_gpu=
_free_object'
                   virtio_gpu_free_object(&shmem_obj->base);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:106:6: note: Assuming field 'cre=
ated' is false
           if (bo->created) {
               ^~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:106:2: note: Taking false branch
           if (bo->created) {
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:112:2: note: Calling 'virtio_gpu=
_cleanup_object'
           virtio_gpu_cleanup_object(bo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:69:6: note: Assuming the conditi=
on is true
           if (virtio_gpu_is_shmem(bo)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:69:2: note: Taking true branch
           if (virtio_gpu_is_shmem(bo)) {
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:72:14: note: Field 'pages' is no=
n-null
                   if (shmem->pages) {
                              ^
   drivers/gpu/drm/virtio/virtgpu_object.c:72:3: note: Taking true branch
                   if (shmem->pages) {
                   ^
   drivers/gpu/drm/virtio/virtgpu_object.c:73:8: note: Assuming field 'mapp=
ed' is 0
                           if (shmem->mapped) {
                               ^~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:73:4: note: Taking false branch
                           if (shmem->mapped) {
                           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:80:4: note: Memory is released
                           kfree(shmem->pages);
                           ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:112:2: note: Returning; memory w=
as released
           virtio_gpu_cleanup_object(bo);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:252:3: note: Returning; memory w=
as released
                   virtio_gpu_free_object(&shmem_obj->base);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:253:3: note: Use of memory after=
 it is freed
                   return ret;
                   ^      ~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:260:3: warning: 4th function cal=
l argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
                   ^
   drivers/gpu/drm/virtio/virtgpu_object.c:219:2: note: 'ents' declared wit=
hout an initial value
           struct virtio_gpu_mem_entry *ents;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:227:6: note: Calling 'IS_ERR'
           if (IS_ERR(shmem_obj))
               ^~~~~~~~~~~~~~~~~
   include/linux/err.h:36:9: note: Assuming the condition is false
           return IS_ERR_VALUE((unsigned long)ptr);
                  ^
   include/linux/err.h:22:34: note: expanded from macro 'IS_ERR_VALUE'
   #define IS_ERR_VALUE(x) unlikely((unsigned long)(void *)(x) >=3D (unsign=
ed long)-MAX_ERRNO)
                           ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/err.h:36:2: note: Returning zero, which participates in a =
condition later
           return IS_ERR_VALUE((unsigned long)ptr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:227:6: note: Returning from 'IS_=
ERR'
           if (IS_ERR(shmem_obj))
               ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/virtio/virtgpu_object.c:227:2: note: Taking false branch
           if (IS_ERR(shmem_obj))
           ^
   drivers/gpu/drm/virtio/virtgpu_object.c:232:6: note: 'ret' is >=3D 0
           if (ret < 0)
               ^~~
   drivers/gpu/drm/virtio/virtgpu_object.c:232:2: note: Taking false branch
           if (ret < 0)

vim +253 drivers/gpu/drm/virtio/virtgpu_object.c

2f2aa13724d568 Gerd Hoffmann  2020-02-07  210  =

dc5698e80cf724 Dave Airlie    2013-09-09  211  int virtio_gpu_object_create=
(struct virtio_gpu_device *vgdev,
4441235f9566e6 Gerd Hoffmann  2019-03-18  212  			     struct virtio_gpu_ob=
ject_params *params,
530b28426a94b8 Gerd Hoffmann  2019-03-18  213  			     struct virtio_gpu_ob=
ject **bo_ptr,
530b28426a94b8 Gerd Hoffmann  2019-03-18  214  			     struct virtio_gpu_fe=
nce *fence)
dc5698e80cf724 Dave Airlie    2013-09-09  215  {
e2324300f427ff Gerd Hoffmann  2019-08-29  216  	struct virtio_gpu_object_ar=
ray *objs =3D NULL;
c66df701e783bc Gerd Hoffmann  2019-08-29  217  	struct drm_gem_shmem_object=
 *shmem_obj;
dc5698e80cf724 Dave Airlie    2013-09-09  218  	struct virtio_gpu_object *b=
o;
2f2aa13724d568 Gerd Hoffmann  2020-02-07  219  	struct virtio_gpu_mem_entry=
 *ents;
2f2aa13724d568 Gerd Hoffmann  2020-02-07  220  	unsigned int nents;
dc5698e80cf724 Dave Airlie    2013-09-09  221  	int ret;
dc5698e80cf724 Dave Airlie    2013-09-09  222  =

dc5698e80cf724 Dave Airlie    2013-09-09  223  	*bo_ptr =3D NULL;
dc5698e80cf724 Dave Airlie    2013-09-09  224  =

c66df701e783bc Gerd Hoffmann  2019-08-29  225  	params->size =3D roundup(pa=
rams->size, PAGE_SIZE);
c66df701e783bc Gerd Hoffmann  2019-08-29  226  	shmem_obj =3D drm_gem_shmem=
_create(vgdev->ddev, params->size);
c66df701e783bc Gerd Hoffmann  2019-08-29  227  	if (IS_ERR(shmem_obj))
c66df701e783bc Gerd Hoffmann  2019-08-29  228  		return PTR_ERR(shmem_obj);
c66df701e783bc Gerd Hoffmann  2019-08-29  229  	bo =3D gem_to_virtio_gpu_ob=
j(&shmem_obj->base);
dc5698e80cf724 Dave Airlie    2013-09-09  230  =

556c62e85f9b97 Matthew Wilcox 2018-10-30  231  	ret =3D virtio_gpu_resource=
_id_get(vgdev, &bo->hw_res_handle);
e2324300f427ff Gerd Hoffmann  2019-08-29  232  	if (ret < 0)
e2324300f427ff Gerd Hoffmann  2019-08-29  233  		goto err_free_gem;
e2324300f427ff Gerd Hoffmann  2019-08-29  234  =

530b28426a94b8 Gerd Hoffmann  2019-03-18  235  	bo->dumb =3D params->dumb;
530b28426a94b8 Gerd Hoffmann  2019-03-18  236  =

e2324300f427ff Gerd Hoffmann  2019-08-29  237  	if (fence) {
e2324300f427ff Gerd Hoffmann  2019-08-29  238  		ret =3D -ENOMEM;
e2324300f427ff Gerd Hoffmann  2019-08-29  239  		objs =3D virtio_gpu_array_=
alloc(1);
e2324300f427ff Gerd Hoffmann  2019-08-29  240  		if (!objs)
e2324300f427ff Gerd Hoffmann  2019-08-29  241  			goto err_put_id;
c66df701e783bc Gerd Hoffmann  2019-08-29  242  		virtio_gpu_array_add_obj(o=
bjs, &bo->base.base);
e2324300f427ff Gerd Hoffmann  2019-08-29  243  =

e2324300f427ff Gerd Hoffmann  2019-08-29  244  		ret =3D virtio_gpu_array_l=
ock_resv(objs);
e2324300f427ff Gerd Hoffmann  2019-08-29  245  		if (ret !=3D 0)
e2324300f427ff Gerd Hoffmann  2019-08-29  246  			goto err_put_objs;
e2324300f427ff Gerd Hoffmann  2019-08-29  247  	}
e2324300f427ff Gerd Hoffmann  2019-08-29  248  =

2f2aa13724d568 Gerd Hoffmann  2020-02-07  249  	ret =3D virtio_gpu_object_s=
hmem_init(vgdev, bo, &ents, &nents);
2f2aa13724d568 Gerd Hoffmann  2020-02-07  250  	if (ret !=3D 0) {
377f8331d0565e xndcn          2021-03-05  251  		virtio_gpu_array_put_free(=
objs);
2f2aa13724d568 Gerd Hoffmann  2020-02-07  252  		virtio_gpu_free_object(&sh=
mem_obj->base);
2f2aa13724d568 Gerd Hoffmann  2020-02-07 @253  		return ret;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2519159904863693645==--

