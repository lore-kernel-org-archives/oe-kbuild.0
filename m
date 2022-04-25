Content-Type: multipart/mixed; boundary="===============5261566252787156251=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 12/17] drm/shmem-helper: Add generic memory shrinker
Date: Tue, 26 Apr 2022 04:17:19 +0800
Message-ID: <202204260432.PrSqpr86-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5261566252787156251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220424190424.540501-13-dmitry.osipenko@collabora.com>
References: <20220424190424.540501-13-dmitry.osipenko@collabora.com>
TO: Dmitry Osipenko <dmitry.osipenko@collabora.com>
TO: David Airlie <airlied@linux.ie>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: Gurchetan Singh <gurchetansingh@chromium.org>
TO: "Chia-I Wu" <olvaffe@gmail.com>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Daniel Almeida <daniel.almeida@collabora.com>
TO: Gert Wollny <gert.wollny@collabora.com>
TO: Gustavo Padovan <gustavo.padovan@collabora.com>
TO: Daniel Stone <daniel@fooishbar.org>
TO: Tomeu Vizoso <tomeu.vizoso@collabora.com>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Steven Price <steven.price@arm.com>
TO: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
TO: Rob Clark <robdclark@gmail.com>
TO: Emil Velikov <emil.l.velikov@gmail.com>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Qiang Yu <yuq825@gmail.com>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Dmitry Osipenko <digetx@gmail.com>
CC: linux-kernel(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: virtualization(a)lists.linux-foundation.org

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20220422]
[cannot apply to v5.18-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-=
generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220425-030=
800
base:   git://anongit.freedesktop.org/drm/drm drm-next
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 67a24652cf3a7fa84713818079c6d79b3c8edc88
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/gpu/drm/drm_gem_shmem_helper.c:984:29: warning: Boolean result i=
s used in bitwise operation. Clarify expression with parentheses. [clarifyC=
ondition]
    WARN_ON_ONCE(!shmem->pages ^ pages_inactive);
                               ^

vim +984 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   965  =

2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   966  static vm_fault_t drm=
_gem_shmem_fault(struct vm_fault *vmf)
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   967  {
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   968  	struct vm_area_struc=
t *vma =3D vmf->vma;
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   969  	struct drm_gem_objec=
t *obj =3D vma->vm_private_data;
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   970  	struct drm_gem_shmem=
_object *shmem =3D to_drm_gem_shmem_obj(obj);
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   971  	loff_t num_pages =3D=
 obj->size >> PAGE_SHIFT;
d611b4a0907cec Neil Roberts    2021-02-23   972  	vm_fault_t ret;
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   973  	struct page *page;
11d5a4745e00e7 Neil Roberts    2021-02-23   974  	pgoff_t page_offset;
67a24652cf3a7f Dmitry Osipenko 2022-04-24   975  	bool pages_inactive;
67a24652cf3a7f Dmitry Osipenko 2022-04-24   976  	int err;
11d5a4745e00e7 Neil Roberts    2021-02-23   977  =

11d5a4745e00e7 Neil Roberts    2021-02-23   978  	/* We don't use vmf->pgof=
f since that has the fake offset */
11d5a4745e00e7 Neil Roberts    2021-02-23   979  	page_offset =3D (vmf->add=
ress - vma->vm_start) >> PAGE_SHIFT;
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   980  =

37e84948f9e9ba Dmitry Osipenko 2022-04-24   981  	dma_resv_lock(shmem->base=
.resv, NULL);
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   982  =

67a24652cf3a7f Dmitry Osipenko 2022-04-24   983  	pages_inactive =3D (shmem=
->evicted || shmem->madv < 0 || !shmem->pages_use_count);
67a24652cf3a7f Dmitry Osipenko 2022-04-24  @984  	WARN_ON_ONCE(!shmem->page=
s ^ pages_inactive);
67a24652cf3a7f Dmitry Osipenko 2022-04-24   985  =

67a24652cf3a7f Dmitry Osipenko 2022-04-24   986  	if (page_offset >=3D num_=
pages || (!shmem->pages && !shmem->evicted)) {
d611b4a0907cec Neil Roberts    2021-02-23   987  		ret =3D VM_FAULT_SIGBUS;
d611b4a0907cec Neil Roberts    2021-02-23   988  	} else {
67a24652cf3a7f Dmitry Osipenko 2022-04-24   989  		err =3D drm_gem_shmem_sw=
ap_in_locked(shmem);
67a24652cf3a7f Dmitry Osipenko 2022-04-24   990  		if (err) {
67a24652cf3a7f Dmitry Osipenko 2022-04-24   991  			ret =3D VM_FAULT_OOM;
67a24652cf3a7f Dmitry Osipenko 2022-04-24   992  			goto unlock;
67a24652cf3a7f Dmitry Osipenko 2022-04-24   993  		}
67a24652cf3a7f Dmitry Osipenko 2022-04-24   994  =

11d5a4745e00e7 Neil Roberts    2021-02-23   995  		page =3D shmem->pages[pa=
ge_offset];
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12   996  =

8b93d1d7dbd578 Daniel Vetter   2021-08-12   997  		ret =3D vmf_insert_pfn(v=
ma, vmf->address, page_to_pfn(page));
d611b4a0907cec Neil Roberts    2021-02-23   998  	}
67a24652cf3a7f Dmitry Osipenko 2022-04-24   999  unlock:
37e84948f9e9ba Dmitry Osipenko 2022-04-24  1000  	dma_resv_unlock(shmem->ba=
se.resv);
d611b4a0907cec Neil Roberts    2021-02-23  1001  =

d611b4a0907cec Neil Roberts    2021-02-23  1002  	return ret;
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12  1003  }
2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12  1004  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5261566252787156251==--

