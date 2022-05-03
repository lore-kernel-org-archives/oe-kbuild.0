Content-Type: multipart/mixed; boundary="===============3689056491218607953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/gem.c:153 tegra_bo_pin() error: 'map->sgt' dereferencing possible ERR_PTR()
Date: Tue, 03 May 2022 17:29:34 +0800
Message-ID: <202205031734.WXoZd12a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3689056491218607953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: c6aeaf56f468a565f6d2f27325fc07d35cdcd3cb drm/tegra: Implement corre=
ct DMA-BUF semantics
date:   5 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-m031-20220427 (https://download.01.org/0day-ci/archi=
ve/20220503/202205031734.WXoZd12a-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/tegra/gem.c:153 tegra_bo_pin() error: 'map->sgt' dereferenc=
ing possible ERR_PTR()

vim +153 drivers/gpu/drm/tegra/gem.c

de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22   5=
7  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   5=
8  static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct=
 host1x_bo *bo,
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   5=
9  					      enum dma_data_direction direction)
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   6=
0  {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
1  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
2  	struct drm_gem_object *gem =3D &obj->gem;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
3  	struct host1x_bo_mapping *map;
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   6=
4  	int err;
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   6=
5  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
6  	map =3D kzalloc(sizeof(*map), GFP_KERNEL);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
7  	if (!map)
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   6=
8  		return ERR_PTR(-ENOMEM);
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   6=
9  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
0  	map->bo =3D host1x_bo_get(bo);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
1  	map->direction =3D direction;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
2  	map->dev =3D dev;
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   7=
3  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
4  	/*
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
5  	 * Imported buffers need special treatment to satisfy the semantics of =
DMA-BUF.
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
6  	 */
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
7  	if (gem->import_attach) {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
8  		struct dma_buf *buf =3D gem->import_attach->dmabuf;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   7=
9  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
0  		map->attach =3D dma_buf_attach(buf, dev);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
1  		if (IS_ERR(map->attach)) {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
2  			err =3D PTR_ERR(map->attach);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
3  			goto free;
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   8=
4  		}
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   8=
5  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
6  		map->sgt =3D dma_buf_map_attachment(map->attach, direction);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
7  		if (IS_ERR(map->sgt)) {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
8  			dma_buf_detach(buf, map->attach);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   8=
9  			err =3D PTR_ERR(map->sgt);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   9=
0  			goto free;
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   9=
1  		}
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   9=
2  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   9=
3  		err =3D sgt_dma_count_chunks(map->sgt);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   9=
4  		map->size =3D gem->size;
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22   9=
5  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   9=
6  		goto out;
af1cbfb9bf0fe07 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28   9=
7  	}
585ee0f27ef7b8d drivers/gpu/drm/tegra/gem.c  Mikko Perttunen 2016-11-08   9=
8  =

af1cbfb9bf0fe07 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28   9=
9  	/*
af1cbfb9bf0fe07 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  10=
0  	 * If we don't have a mapping for this buffer yet, return an SG table
af1cbfb9bf0fe07 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  10=
1  	 * so that host1x can do the mapping for us via the DMA API.
af1cbfb9bf0fe07 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  10=
2  	 */
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  10=
3  	map->sgt =3D kzalloc(sizeof(*map->sgt), GFP_KERNEL);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  10=
4  	if (!map->sgt) {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  10=
5  		err =3D -ENOMEM;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  10=
6  		goto free;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  10=
7  	}
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  10=
8  =

80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  10=
9  	if (obj->pages) {
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
0  		/*
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
1  		 * If the buffer object was allocated from the explicit IOMMU
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
2  		 * API code paths, construct an SG table from the pages.
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
3  		 */
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  11=
4  		err =3D sg_alloc_table_from_pages(map->sgt, obj->pages, obj->num_pages=
, 0, gem->size,
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  11=
5  						GFP_KERNEL);
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
6  		if (err < 0)
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
7  			goto free;
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  11=
8  	} else {
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  11=
9  		/*
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  12=
0  		 * If the buffer object had no pages allocated and if it was
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  12=
1  		 * not imported, it had to be allocated with the DMA API, so
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  12=
2  		 * the DMA API helper can be used.
1f16deac766926f drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  12=
3  		 */
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  12=
4  		err =3D dma_get_sgtable(dev, map->sgt, obj->vaddr, obj->iova, gem->siz=
e);
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  12=
5  		if (err < 0)
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  12=
6  			goto free;
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  12=
7  	}
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  12=
8  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  12=
9  	err =3D dma_map_sgtable(dev, map->sgt, direction, 0);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
0  	if (err)
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
1  		goto free_sgt;
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  13=
2  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
3  out:
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
4  	/*
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
5  	 * If we've manually mapped the buffer object through the IOMMU, make s=
ure to return the
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
6  	 * existing IOVA address of our mapping.
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
7  	 */
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
8  	if (!obj->mm) {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  13=
9  		map->phys =3D sg_dma_address(map->sgt->sgl);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
0  		map->chunks =3D err;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
1  	} else {
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
2  		map->phys =3D obj->iova;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
3  		map->chunks =3D 1;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
4  	}
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
5  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
6  	map->size =3D gem->size;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
7  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
8  	return map;
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  14=
9  =

c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  15=
0  free_sgt:
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  15=
1  	sg_free_table(map->sgt);
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  15=
2  free:
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09 @15=
3  	kfree(map->sgt);
c6aeaf56f468a56 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  15=
4  	kfree(map);
80327ce3d4edaa9 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  15=
5  	return ERR_PTR(err);
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22  15=
6  }
de2ba664c30fcdb drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22  15=
7  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3689056491218607953==--

