Content-Type: multipart/mixed; boundary="===============1429132288674809784=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 16/23] drm/virtio: implement blob resources: implement vram object
Date: Thu, 03 Sep 2020 10:00:55 +0800
Message-ID: <202009030939.nmH7l4Ij%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1429132288674809784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200902210847.2689-17-gurchetansingh@chromium.org>
References: <20200902210847.2689-17-gurchetansingh@chromium.org>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: dri-devel(a)lists.freedesktop.org
TO: virtio-dev(a)lists.oasis-open.org
CC: sebastien.boeuf(a)intel.com
CC: kraxel(a)redhat.com
CC: vgoyal(a)redhat.com
CC: mst(a)redhat.com

Hi Gurchetan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20200902]
[cannot apply to drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linu=
s/master drm/drm-next drm-exynos/exynos-drm-next v5.9-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gurchetan-Singh/Blob-prere=
quisites-blob-resources/20200903-051203
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: nios2-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/virtio/virtgpu_vram.c:160:2: warning: Address of local a=
uto-variable assigned to a function parameter. [autoVariables]
    *bo_ptr =3D &vram->base;
    ^

# https://github.com/0day-ci/linux/commit/9897d1cd285de886f453bed042d53ff47=
9eff90f
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Gurchetan-Singh/Blob-prerequisites-blob-re=
sources/20200903-051203
git checkout 9897d1cd285de886f453bed042d53ff479eff90f
vim +160 drivers/gpu/drm/virtio/virtgpu_vram.c

9897d1cd285de8 Gerd Hoffmann 2020-09-02  122  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  123  int virtio_gpu_vram_create(st=
ruct virtio_gpu_device *vgdev,
9897d1cd285de8 Gerd Hoffmann 2020-09-02  124  			   struct virtio_gpu_objec=
t_params *params,
9897d1cd285de8 Gerd Hoffmann 2020-09-02  125  			   struct virtio_gpu_objec=
t **bo_ptr)
9897d1cd285de8 Gerd Hoffmann 2020-09-02  126  {
9897d1cd285de8 Gerd Hoffmann 2020-09-02  127  	struct drm_gem_object *obj;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  128  	struct virtio_gpu_object_vra=
m *vram;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  129  	int ret;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  130  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  131  	vram =3D kzalloc(sizeof(*vra=
m), GFP_KERNEL);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  132  	if (!vram)
9897d1cd285de8 Gerd Hoffmann 2020-09-02  133  		return -ENOMEM;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  134  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  135  	obj =3D &vram->base.base.bas=
e;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  136  	obj->funcs =3D &virtio_gpu_v=
ram_funcs;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  137  	drm_gem_private_object_init(=
vgdev->ddev, obj, params->size);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  138  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  139  	/* Create fake offset */
9897d1cd285de8 Gerd Hoffmann 2020-09-02  140  	ret =3D drm_gem_create_mmap_=
offset(obj);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  141  	if (ret) {
9897d1cd285de8 Gerd Hoffmann 2020-09-02  142  		kfree(vram);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  143  		return ret;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  144  	}
9897d1cd285de8 Gerd Hoffmann 2020-09-02  145  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  146  	ret =3D virtio_gpu_resource_=
id_get(vgdev, &vram->base.hw_res_handle);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  147  	if (ret) {
9897d1cd285de8 Gerd Hoffmann 2020-09-02  148  		kfree(vram);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  149  		return ret;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  150  	}
9897d1cd285de8 Gerd Hoffmann 2020-09-02  151  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02  152  	if (params->blob_flags & VIR=
TGPU_BLOB_FLAG_USE_MAPPABLE) {
9897d1cd285de8 Gerd Hoffmann 2020-09-02  153  		ret =3D virtio_gpu_vram_map=
(&vram->base);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  154  		if (ret) {
9897d1cd285de8 Gerd Hoffmann 2020-09-02  155  			virtio_gpu_vram_free(obj);
9897d1cd285de8 Gerd Hoffmann 2020-09-02  156  			return ret;
9897d1cd285de8 Gerd Hoffmann 2020-09-02  157  		}
9897d1cd285de8 Gerd Hoffmann 2020-09-02  158  	}
9897d1cd285de8 Gerd Hoffmann 2020-09-02  159  =

9897d1cd285de8 Gerd Hoffmann 2020-09-02 @160  	*bo_ptr =3D &vram->base;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1429132288674809784==--

