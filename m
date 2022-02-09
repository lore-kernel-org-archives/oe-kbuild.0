Content-Type: multipart/mixed; boundary="===============1284159898409942843=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/gem.c:153 tegra_bo_pin() error: 'map->sgt' dereferencing possible ERR_PTR()
Date: Wed, 09 Feb 2022 18:33:12 +0800
Message-ID: <202202091831.HZ38Xu1E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1284159898409942843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e6251ab4551f51fa4cee03523e08051898c3ce82
commit: c6aeaf56f468a565f6d2f27325fc07d35cdcd3cb drm/tegra: Implement corre=
ct DMA-BUF semantics
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-m031-20220208 (https://download.01.org/0day-ci/archi=
ve/20220209/202202091831.HZ38Xu1E-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/tegra/gem.c:153 tegra_bo_pin() error: 'map->sgt' dereferenc=
ing possible ERR_PTR()

vim +153 drivers/gpu/drm/tegra/gem.c

de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22   57=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   58=
  static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct =
host1x_bo *bo,
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   59=
  					      enum dma_data_direction direction)
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   60=
  {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   61=
  	struct tegra_bo *obj =3D host1x_to_tegra_bo(bo);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   62=
  	struct drm_gem_object *gem =3D &obj->gem;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   63=
  	struct host1x_bo_mapping *map;
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   64=
  	int err;
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   65=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   66=
  	map =3D kzalloc(sizeof(*map), GFP_KERNEL);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   67=
  	if (!map)
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   68=
  		return ERR_PTR(-ENOMEM);
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   69=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   70=
  	map->bo =3D host1x_bo_get(bo);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   71=
  	map->direction =3D direction;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   72=
  	map->dev =3D dev;
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   73=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   74=
  	/*
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   75=
  	 * Imported buffers need special treatment to satisfy the semantics of D=
MA-BUF.
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   76=
  	 */
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   77=
  	if (gem->import_attach) {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   78=
  		struct dma_buf *buf =3D gem->import_attach->dmabuf;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   79=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   80=
  		map->attach =3D dma_buf_attach(buf, dev);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   81=
  		if (IS_ERR(map->attach)) {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   82=
  			err =3D PTR_ERR(map->attach);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   83=
  			goto free;
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   84=
  		}
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   85=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   86=
  		map->sgt =3D dma_buf_map_attachment(map->attach, direction);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   87=
  		if (IS_ERR(map->sgt)) {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   88=
  			dma_buf_detach(buf, map->attach);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   89=
  			err =3D PTR_ERR(map->sgt);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   90=
  			goto free;
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   91=
  		}
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03   92=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   93=
  		err =3D sgt_dma_count_chunks(map->sgt);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   94=
  		map->size =3D gem->size;
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22   95=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09   96=
  		goto out;
af1cbfb9bf0fe0 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28   97=
  	}
585ee0f27ef7b8 drivers/gpu/drm/tegra/gem.c  Mikko Perttunen 2016-11-08   98=
  =

af1cbfb9bf0fe0 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28   99=
  	/*
af1cbfb9bf0fe0 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  100=
  	 * If we don't have a mapping for this buffer yet, return an SG table
af1cbfb9bf0fe0 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  101=
  	 * so that host1x can do the mapping for us via the DMA API.
af1cbfb9bf0fe0 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  102=
  	 */
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  103=
  	map->sgt =3D kzalloc(sizeof(*map->sgt), GFP_KERNEL);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  104=
  	if (!map->sgt) {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  105=
  		err =3D -ENOMEM;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  106=
  		goto free;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  107=
  	}
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  108=
  =

80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  109=
  	if (obj->pages) {
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  110=
  		/*
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  111=
  		 * If the buffer object was allocated from the explicit IOMMU
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  112=
  		 * API code paths, construct an SG table from the pages.
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  113=
  		 */
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  114=
  		err =3D sg_alloc_table_from_pages(map->sgt, obj->pages, obj->num_pages,=
 0, gem->size,
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  115=
  						GFP_KERNEL);
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  116=
  		if (err < 0)
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  117=
  			goto free;
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  118=
  	} else {
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  119=
  		/*
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  120=
  		 * If the buffer object had no pages allocated and if it was
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  121=
  		 * not imported, it had to be allocated with the DMA API, so
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  122=
  		 * the DMA API helper can be used.
1f16deac766926 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-12-03  123=
  		 */
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  124=
  		err =3D dma_get_sgtable(dev, map->sgt, obj->vaddr, obj->iova, gem->size=
);
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  125=
  		if (err < 0)
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  126=
  			goto free;
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  127=
  	}
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  128=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  129=
  	err =3D dma_map_sgtable(dev, map->sgt, direction, 0);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  130=
  	if (err)
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  131=
  		goto free_sgt;
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  132=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  133=
  out:
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  134=
  	/*
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  135=
  	 * If we've manually mapped the buffer object through the IOMMU, make su=
re to return the
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  136=
  	 * existing IOVA address of our mapping.
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  137=
  	 */
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  138=
  	if (!obj->mm) {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  139=
  		map->phys =3D sg_dma_address(map->sgt->sgl);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  140=
  		map->chunks =3D err;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  141=
  	} else {
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  142=
  		map->phys =3D obj->iova;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  143=
  		map->chunks =3D 1;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  144=
  	}
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  145=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  146=
  	map->size =3D gem->size;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  147=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  148=
  	return map;
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  149=
  =

c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  150=
  free_sgt:
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  151=
  	sg_free_table(map->sgt);
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  152=
  free:
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09 @153=
  	kfree(map->sgt);
c6aeaf56f468a5 drivers/gpu/drm/tegra/gem.c  Thierry Reding  2021-09-09  154=
  	kfree(map);
80327ce3d4edaa drivers/gpu/drm/tegra/gem.c  Thierry Reding  2019-10-28  155=
  	return ERR_PTR(err);
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22  156=
  }
de2ba664c30fcd drivers/gpu/host1x/drm/gem.c Arto Merilainen 2013-03-22  157=
  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1284159898409942843==--

