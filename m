Content-Type: multipart/mixed; boundary="===============0615451593096883448=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6 14/22] dma-buf: Introduce new locking convention
Date: Fri, 27 May 2022 20:21:30 +0800
Message-ID: <202205272006.EZ53cUSD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0615451593096883448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-15-dmitry.osipenko@collabora.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
527/202205272006.EZ53cUSD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/dma-buf/dma-buf.c:791 dma_buf_dynamic_attach() warn: inconsistent r=
eturns 'dmabuf->resv'.
drivers/dma-buf/dma-buf.c:1339 dma_buf_vmap_locked() error: uninitialized s=
ymbol 'ret'.

Old smatch warnings:
drivers/dma-buf/dma-buf.c:576 dma_buf_export() warn: '&dmabuf->list_node' n=
ot removed from list

vim +791 drivers/dma-buf/dma-buf.c

84335675f2223c drivers/dma-buf/dma-buf.c Daniel Vetter      2021-01-15  691=
  =

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  692=
  /**
85804b70cca68d drivers/dma-buf/dma-buf.c Daniel Vetter      2020-12-11  693=
   * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  694=
   * @dmabuf:		[in]	buffer to attach device to.
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  695=
   * @dev:		[in]	device to be attached.
6f49c2515e2258 drivers/dma-buf/dma-buf.c Randy Dunlap       2020-04-07  696=
   * @importer_ops:	[in]	importer operations for the attachment
6f49c2515e2258 drivers/dma-buf/dma-buf.c Randy Dunlap       2020-04-07  697=
   * @importer_priv:	[in]	importer private pointer for the attachment
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  698=
   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  699=
   * Returns struct dma_buf_attachment pointer for this attachment. Attachm=
ents
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  700=
   * must be cleaned up by calling dma_buf_detach().
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  701=
   *
85804b70cca68d drivers/dma-buf/dma-buf.c Daniel Vetter      2020-12-11  702=
   * Optionally this calls &dma_buf_ops.attach to allow device-specific att=
ach
85804b70cca68d drivers/dma-buf/dma-buf.c Daniel Vetter      2020-12-11  703=
   * functionality.
85804b70cca68d drivers/dma-buf/dma-buf.c Daniel Vetter      2020-12-11  704=
   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  705=
   * Returns:
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  706=
   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  707=
   * A pointer to newly created &dma_buf_attachment on success, or a negati=
ve
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  708=
   * error code wrapped into a pointer on failure.
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  709=
   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  710=
   * Note that this can fail if the backing storage of @dmabuf is in a plac=
e not
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  711=
   * accessible to @dev, and cannot be moved to a more suitable place. This=
 is
2904a8c1311f02 drivers/dma-buf/dma-buf.c Daniel Vetter      2016-12-09  712=
   * indicated with the error code -EBUSY.
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  713=
   */
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  714  struct dma_buf_attachment *
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  715  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  716  		       const struct dma_buf_attach_ops *importer_ops,
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  717  		       void *importer_priv)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  718=
  {
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  719=
  	struct dma_buf_attachment *attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  720=
  	int ret;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  721=
  =

d1aa06a1eaf5f7 drivers/base/dma-buf.c    Laurent Pinchart   2012-01-26  722=
  	if (WARN_ON(!dmabuf || !dev))
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  723=
  		return ERR_PTR(-EINVAL);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  724=
  =

4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2020-02-19=
  725  	if (WARN_ON(importer_ops && !importer_ops->move_notify))
4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2020-02-19=
  726  		return ERR_PTR(-EINVAL);
4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2020-02-19=
  727  =

db7942b6292306 drivers/dma-buf/dma-buf.c Markus Elfring     2017-05-08  728=
  	attach =3D kzalloc(sizeof(*attach), GFP_KERNEL);
34d84ec4881d13 drivers/dma-buf/dma-buf.c Markus Elfring     2017-05-08  729=
  	if (!attach)
a9fbc3b73127ef drivers/base/dma-buf.c    Laurent Pinchart   2012-01-26  730=
  		return ERR_PTR(-ENOMEM);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  731=
  =

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  732=
  	attach->dev =3D dev;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  733=
  	attach->dmabuf =3D dmabuf;
09606b5446c25b drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-03-22=
  734  	if (importer_ops)
09606b5446c25b drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-03-22=
  735  		attach->peer2peer =3D importer_ops->allow_peer2peer;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  736  	attach->importer_ops =3D importer_ops;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  737  	attach->importer_priv =3D importer_priv;
2ed9201bdd9a8e drivers/base/dma-buf.c    Laurent Pinchart   2012-01-26  738=
  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  739=
  	dma_resv_lock(dmabuf->resv, NULL);
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  740=
  =

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  741=
  	if (dmabuf->ops->attach) {
a19741e5e5a9f1 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-05-28=
  742  		ret =3D dmabuf->ops->attach(dmabuf, attach);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  743=
  		if (ret)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  744=
  			goto err_attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  745=
  	}
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  746=
  	list_add(&attach->node, &dmabuf->attachments);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  747=
  =

15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  748  	/* When either the importer or the exporter can't handle dynamic
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  749  	 * mappings we cache the mapping here to avoid issues with the
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  750  	 * reservation object lock.
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  751  	 */
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  752  	if (dma_buf_attachment_is_dynamic(attach) !=3D
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  753  	    dma_buf_is_dynamic(dmabuf)) {
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  754  		struct sg_table *sgt;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  755  =

bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  756  		if (dma_buf_is_dynamic(attach->dmabuf)) {
7e008b02557cce drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2021-05-17=
  757  			ret =3D dmabuf->ops->pin(attach);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  758  			if (ret)
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  759  				goto err_unlock;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  760  		}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  761  =

84335675f2223c drivers/dma-buf/dma-buf.c Daniel Vetter      2021-01-15  762=
  		sgt =3D __map_dma_buf(attach, DMA_BIDIRECTIONAL);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  763  		if (!sgt)
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  764  			sgt =3D ERR_PTR(-ENOMEM);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  765  		if (IS_ERR(sgt)) {
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  766  			ret =3D PTR_ERR(sgt);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  767  			goto err_unpin;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  768  		}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  769  		attach->sgt =3D sgt;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  770  		attach->dir =3D DMA_BIDIRECTIONAL;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  771  	}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  772  =

97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  773=
  	dma_resv_unlock(dmabuf->resv);
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  774=
  =

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  775=
  	return attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  776=
  =

d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  777=
  err_attach:
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  778=
  	dma_resv_unlock(attach->dmabuf->resv);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  779=
  	kfree(attach);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal       2011-12-26  780=
  	return ERR_PTR(ret);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  781  =

bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  782  err_unpin:
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  783  	if (dma_buf_is_dynamic(attach->dmabuf))
7e008b02557cce drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2021-05-17=
  784  		dmabuf->ops->unpin(attach);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  785  =

15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  786  err_unlock:
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  787=
  	dma_resv_unlock(dmabuf->resv);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  788  =

15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  789  	dma_buf_detach(dmabuf, attach);
97f090c47ec995 drivers/dma-buf/dma-buf.c Dmitry Osipenko    2022-05-27  790=
  =

15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
 @791  	return ERR_PTR(ret);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  792  }
16b0314aa746be drivers/dma-buf/dma-buf.c Greg Kroah-Hartman 2021-10-10  793=
  EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian K=C3=B6nig    2018-07-03=
  794  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0615451593096883448==--

