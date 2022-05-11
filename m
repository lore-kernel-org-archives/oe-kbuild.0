Content-Type: multipart/mixed; boundary="===============5857537214167164290=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/virtio: use the fence for every plane update
Date: Wed, 11 May 2022 21:28:44 +0800
Message-ID: <202205112132.FqtvzLWA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5857537214167164290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220511000623.12938-3-dongwon.kim@intel.com>
References: <20220511000623.12938-3-dongwon.kim@intel.com>
TO: Dongwon Kim <dongwon.kim@intel.com>
TO: dri-devel(a)lists.freedesktop.org
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Dongwon Kim <dongwon.kim@intel.com>
CC: Gurchetan Singh <gurchetansingh@chromium.org>

Hi Dongwon,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-=
next drm-tip/drm-tip tegra-drm/drm/tegra/for-next v5.18-rc6 next-20220510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dongwon-Kim/drm-virt=
io-release-ops-for-virtgpu-fence-release/20220511-081226
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: parisc-randconfig-m031-20220509 (https://download.01.org/0day-ci/ar=
chive/20220511/202205112132.FqtvzLWA-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/virtio/virtgpu_plane.c:158 virtio_gpu_resource_flush() erro=
r: uninitialized symbol 'objs'.

vim +/objs +158 drivers/gpu/drm/virtio/virtgpu_plane.c

544c521d4ab8f2 Gerd Hoffmann   2019-10-23  131  =

5c68ab9276aae4 Vivek Kasireddy 2021-06-10  132  static void virtio_gpu_reso=
urce_flush(struct drm_plane *plane,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  133  				      uint32_t x, uint3=
2_t y,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  134  				      uint32_t width, u=
int32_t height)
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  135  {
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  136  	struct drm_device *dev =3D=
 plane->dev;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  137  	struct virtio_gpu_device *=
vgdev =3D dev->dev_private;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  138  	struct virtio_gpu_framebuf=
fer *vgfb;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  139  	struct virtio_gpu_object *=
bo;
47558b189c1d34 Dongwon Kim     2022-05-10  140  	struct virtio_gpu_object_a=
rray *objs;
47558b189c1d34 Dongwon Kim     2022-05-10  141  	struct virtio_gpu_fence *f=
ence;
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  142  =

5c68ab9276aae4 Vivek Kasireddy 2021-06-10  143  	vgfb =3D to_virtio_gpu_fra=
mebuffer(plane->state->fb);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  144  	bo =3D gem_to_virtio_gpu_o=
bj(vgfb->base.obj[0]);
5c7787de5069b5 Dongwon Kim     2022-05-10  145  	fence =3D virtio_gpu_fence=
_alloc(vgdev, vgdev->fence_drv.context, 0);
47558b189c1d34 Dongwon Kim     2022-05-10  146  =

47558b189c1d34 Dongwon Kim     2022-05-10  147  	if (fence) {
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  148  		objs =3D virtio_gpu_array=
_alloc(1);
47558b189c1d34 Dongwon Kim     2022-05-10  149  		if (!objs) {
47558b189c1d34 Dongwon Kim     2022-05-10  150  			kfree(fence);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  151  			return;
47558b189c1d34 Dongwon Kim     2022-05-10  152  		}
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  153  		virtio_gpu_array_add_obj(=
objs, vgfb->base.obj[0]);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  154  		virtio_gpu_array_lock_res=
v(objs);
47558b189c1d34 Dongwon Kim     2022-05-10  155  	}
47558b189c1d34 Dongwon Kim     2022-05-10  156  =

5c68ab9276aae4 Vivek Kasireddy 2021-06-10  157  	virtio_gpu_cmd_resource_fl=
ush(vgdev, bo->hw_res_handle, x, y,
47558b189c1d34 Dongwon Kim     2022-05-10 @158  				      width, height, ob=
js, fence);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  159  	virtio_gpu_notify(vgdev);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  160  =

47558b189c1d34 Dongwon Kim     2022-05-10  161  	if (fence) {
47558b189c1d34 Dongwon Kim     2022-05-10  162  		dma_fence_wait_timeout(&f=
ence->f, true,
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  163  				       msecs_to_jiffies=
(50));
47558b189c1d34 Dongwon Kim     2022-05-10  164  		dma_fence_put(&fence->f);
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  165  	}
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  166  }
5c68ab9276aae4 Vivek Kasireddy 2021-06-10  167  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5857537214167164290==--

