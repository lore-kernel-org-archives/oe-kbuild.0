Content-Type: multipart/mixed; boundary="===============7584928712293660756=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/virtio/virtgpu_vram.c:160:2: warning: Address of local auto-variable assigned to a function parameter. [autoVariables]
Date: Sat, 14 Aug 2021 15:49:32 +0800
Message-ID: <202108141525.U9rk0iLk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7584928712293660756==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Gerd Hoffmann <kraxel@redhat.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   dfa377c35d70c31139b1274ec49f87d380996c42
commit: 16845c5d540929d2f4dc845f11fbbb238e69170a drm/virtio: implement blob=
 resources: implement vram object
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
compiler: powerpc-linux-gcc (GCC) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/virtio/virtgpu_vram.c:160:2: warning: Address of local a=
uto-variable assigned to a function parameter. [autoVariables]
    *bo_ptr =3D &vram->base;
    ^

vim +160 drivers/gpu/drm/virtio/virtgpu_vram.c

16845c5d540929 Gerd Hoffmann 2020-09-23  122  =

16845c5d540929 Gerd Hoffmann 2020-09-23  123  int virtio_gpu_vram_create(st=
ruct virtio_gpu_device *vgdev,
16845c5d540929 Gerd Hoffmann 2020-09-23  124  			   struct virtio_gpu_objec=
t_params *params,
16845c5d540929 Gerd Hoffmann 2020-09-23  125  			   struct virtio_gpu_objec=
t **bo_ptr)
16845c5d540929 Gerd Hoffmann 2020-09-23  126  {
16845c5d540929 Gerd Hoffmann 2020-09-23  127  	struct drm_gem_object *obj;
16845c5d540929 Gerd Hoffmann 2020-09-23  128  	struct virtio_gpu_object_vra=
m *vram;
16845c5d540929 Gerd Hoffmann 2020-09-23  129  	int ret;
16845c5d540929 Gerd Hoffmann 2020-09-23  130  =

16845c5d540929 Gerd Hoffmann 2020-09-23  131  	vram =3D kzalloc(sizeof(*vra=
m), GFP_KERNEL);
16845c5d540929 Gerd Hoffmann 2020-09-23  132  	if (!vram)
16845c5d540929 Gerd Hoffmann 2020-09-23  133  		return -ENOMEM;
16845c5d540929 Gerd Hoffmann 2020-09-23  134  =

16845c5d540929 Gerd Hoffmann 2020-09-23  135  	obj =3D &vram->base.base.bas=
e;
16845c5d540929 Gerd Hoffmann 2020-09-23  136  	obj->funcs =3D &virtio_gpu_v=
ram_funcs;
16845c5d540929 Gerd Hoffmann 2020-09-23  137  	drm_gem_private_object_init(=
vgdev->ddev, obj, params->size);
16845c5d540929 Gerd Hoffmann 2020-09-23  138  =

16845c5d540929 Gerd Hoffmann 2020-09-23  139  	/* Create fake offset */
16845c5d540929 Gerd Hoffmann 2020-09-23  140  	ret =3D drm_gem_create_mmap_=
offset(obj);
16845c5d540929 Gerd Hoffmann 2020-09-23  141  	if (ret) {
16845c5d540929 Gerd Hoffmann 2020-09-23  142  		kfree(vram);
16845c5d540929 Gerd Hoffmann 2020-09-23  143  		return ret;
16845c5d540929 Gerd Hoffmann 2020-09-23  144  	}
16845c5d540929 Gerd Hoffmann 2020-09-23  145  =

16845c5d540929 Gerd Hoffmann 2020-09-23  146  	ret =3D virtio_gpu_resource_=
id_get(vgdev, &vram->base.hw_res_handle);
16845c5d540929 Gerd Hoffmann 2020-09-23  147  	if (ret) {
16845c5d540929 Gerd Hoffmann 2020-09-23  148  		kfree(vram);
16845c5d540929 Gerd Hoffmann 2020-09-23  149  		return ret;
16845c5d540929 Gerd Hoffmann 2020-09-23  150  	}
16845c5d540929 Gerd Hoffmann 2020-09-23  151  =

16845c5d540929 Gerd Hoffmann 2020-09-23  152  	if (params->blob_flags & VIR=
TGPU_BLOB_FLAG_USE_MAPPABLE) {
16845c5d540929 Gerd Hoffmann 2020-09-23  153  		ret =3D virtio_gpu_vram_map=
(&vram->base);
16845c5d540929 Gerd Hoffmann 2020-09-23  154  		if (ret) {
16845c5d540929 Gerd Hoffmann 2020-09-23  155  			virtio_gpu_vram_free(obj);
16845c5d540929 Gerd Hoffmann 2020-09-23  156  			return ret;
16845c5d540929 Gerd Hoffmann 2020-09-23  157  		}
16845c5d540929 Gerd Hoffmann 2020-09-23  158  	}
16845c5d540929 Gerd Hoffmann 2020-09-23  159  =

16845c5d540929 Gerd Hoffmann 2020-09-23 @160  	*bo_ptr =3D &vram->base;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7584928712293660756==--

