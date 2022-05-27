Content-Type: multipart/mixed; boundary="===============7427517542572250512=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 17/22] drm/shmem-helper: Add generic memory shrinker
Date: Fri, 27 May 2022 22:03:23 +0800
Message-ID: <202205272155.MxDiru43-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7427517542572250512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220526235040.678984-18-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-18-dmitry.osipenko@collabora.com>
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
TO: "Pan, Xinhui" <Xinhui.Pan@amd.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Tomasz Figa <tfiga@chromium.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
TO: Jani Nikula <jani.nikula@linux.intel.com>

Hi Dmitry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20220527]
[cannot apply to drm/drm-next media-tree/master drm-intel/for-linux-next v5=
.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Osipenko/Add-=
generic-memory-shrinker-to-VirtIO-GPU-and-Panfrost-DRM-drivers/20220527-075=
717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
cdeffe87f790dfd1baa193020411ce9a538446d7
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
527/202205272155.MxDiru43-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/drm_gem_shmem_helper.c:226 drm_gem_shmem_set_evictable() wa=
rn: inconsistent returns 'shmem->base.resv'.
drivers/gpu/drm/drm_gem_shmem_helper.c:253 drm_gem_shmem_set_purgeable() wa=
rn: inconsistent returns 'shmem->base.resv'.
drivers/gpu/drm/drm_gem_shmem_helper.c:703 drm_gem_shmem_fault() error: we =
previously assumed 'shmem->pages' could be null (see line 694)

Old smatch warnings:
include/drm/drm_vma_manager.h:225 drm_vma_node_unmap() warn: should 'drm_vm=
a_node_size(node) << 12' be a 64 bit type?

vim +226 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db7 Noralf Tr=C3=B8nnes  2019-03-12  204  =

875fd932de880a Dmitry Osipenko 2022-05-27  205  /**
875fd932de880a Dmitry Osipenko 2022-05-27  206   * drm_gem_shmem_set_evicta=
ble() - Make GEM evictable by memory shrinker
875fd932de880a Dmitry Osipenko 2022-05-27  207   * @shmem: shmem GEM object
875fd932de880a Dmitry Osipenko 2022-05-27  208   *
875fd932de880a Dmitry Osipenko 2022-05-27  209   * Tell memory shrinker tha=
t this GEM can be evicted. Initially eviction is
875fd932de880a Dmitry Osipenko 2022-05-27  210   * disabled for all GEMs. I=
f GEM was purged, then -ENOMEM is returned.
875fd932de880a Dmitry Osipenko 2022-05-27  211   *
875fd932de880a Dmitry Osipenko 2022-05-27  212   * Returns:
875fd932de880a Dmitry Osipenko 2022-05-27  213   * 0 on success or a negati=
ve error code on failure.
875fd932de880a Dmitry Osipenko 2022-05-27  214   */
875fd932de880a Dmitry Osipenko 2022-05-27  215  int drm_gem_shmem_set_evict=
able(struct drm_gem_shmem_object *shmem)
875fd932de880a Dmitry Osipenko 2022-05-27  216  {
875fd932de880a Dmitry Osipenko 2022-05-27  217  	dma_resv_lock(shmem->base.=
resv, NULL);
875fd932de880a Dmitry Osipenko 2022-05-27  218  =

875fd932de880a Dmitry Osipenko 2022-05-27  219  	if (shmem->madv < 0)
875fd932de880a Dmitry Osipenko 2022-05-27  220  		return -ENOMEM;
875fd932de880a Dmitry Osipenko 2022-05-27  221  =

875fd932de880a Dmitry Osipenko 2022-05-27  222  	shmem->eviction_enabled =
=3D true;
875fd932de880a Dmitry Osipenko 2022-05-27  223  =

875fd932de880a Dmitry Osipenko 2022-05-27  224  	dma_resv_unlock(shmem->bas=
e.resv);
875fd932de880a Dmitry Osipenko 2022-05-27  225  =

875fd932de880a Dmitry Osipenko 2022-05-27 @226  	return 0;
875fd932de880a Dmitry Osipenko 2022-05-27  227  }
875fd932de880a Dmitry Osipenko 2022-05-27  228  EXPORT_SYMBOL_GPL(drm_gem_s=
hmem_set_evictable);
875fd932de880a Dmitry Osipenko 2022-05-27  229  =

875fd932de880a Dmitry Osipenko 2022-05-27  230  /**
875fd932de880a Dmitry Osipenko 2022-05-27  231   * drm_gem_shmem_set_purgea=
ble() - Make GEM purgeable by memory shrinker
875fd932de880a Dmitry Osipenko 2022-05-27  232   * @shmem: shmem GEM object
875fd932de880a Dmitry Osipenko 2022-05-27  233   *
875fd932de880a Dmitry Osipenko 2022-05-27  234   * Tell memory shrinker tha=
t this GEM can be purged. Initially purging is
875fd932de880a Dmitry Osipenko 2022-05-27  235   * disabled for all GEMs. I=
f GEM was purged, then -ENOMEM is returned.
875fd932de880a Dmitry Osipenko 2022-05-27  236   *
875fd932de880a Dmitry Osipenko 2022-05-27  237   * Returns:
875fd932de880a Dmitry Osipenko 2022-05-27  238   * 0 on success or a negati=
ve error code on failure.
875fd932de880a Dmitry Osipenko 2022-05-27  239   */
875fd932de880a Dmitry Osipenko 2022-05-27  240  int drm_gem_shmem_set_purge=
able(struct drm_gem_shmem_object *shmem)
875fd932de880a Dmitry Osipenko 2022-05-27  241  {
875fd932de880a Dmitry Osipenko 2022-05-27  242  	dma_resv_lock(shmem->base.=
resv, NULL);
875fd932de880a Dmitry Osipenko 2022-05-27  243  =

875fd932de880a Dmitry Osipenko 2022-05-27  244  	if (shmem->madv < 0)
875fd932de880a Dmitry Osipenko 2022-05-27  245  		return -ENOMEM;
875fd932de880a Dmitry Osipenko 2022-05-27  246  =

875fd932de880a Dmitry Osipenko 2022-05-27  247  	shmem->purge_enabled =3D t=
rue;
875fd932de880a Dmitry Osipenko 2022-05-27  248  =

875fd932de880a Dmitry Osipenko 2022-05-27  249  	drm_gem_shmem_update_pages=
_state(shmem);
875fd932de880a Dmitry Osipenko 2022-05-27  250  =

875fd932de880a Dmitry Osipenko 2022-05-27  251  	dma_resv_unlock(shmem->bas=
e.resv);
875fd932de880a Dmitry Osipenko 2022-05-27  252  =

875fd932de880a Dmitry Osipenko 2022-05-27 @253  	return 0;
875fd932de880a Dmitry Osipenko 2022-05-27  254  }
875fd932de880a Dmitry Osipenko 2022-05-27  255  EXPORT_SYMBOL_GPL(drm_gem_s=
hmem_set_purgeable);
875fd932de880a Dmitry Osipenko 2022-05-27  256  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7427517542572250512==--

