Content-Type: multipart/mixed; boundary="===============1437119711372231404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/ttm: audit bo->resource usage v2
Date: Mon, 11 Jul 2022 11:03:15 +0800
Message-ID: <202207111026.8Yp48spG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1437119711372231404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220707102453.3633-5-christian.koenig@amd.com>
References: <20220707102453.3633-5-christian.koenig@amd.com>
TO: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
TO: intel-gfx(a)lists.freedesktop.org
TO: dri-devel(a)lists.freedesktop.org
TO: nouveau(a)lists.freedesktop.org
TO: amd-gfx(a)lists.freedesktop.org
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-=
ttm-rename-and-cleanup-ttm_bo_init_reserved/20220707-192538
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
711/202207111026.8Yp48spG-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate() error: we previously ass=
umed 'bo->resource' could be null (see line 907)

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:672 ttm_mem_evict_first() warn: inconsistent r=
eturns '&bdev->lru_lock'.

vim +915 drivers/gpu/drm/ttm/ttm_bo.c

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  889  =

09855acb1c2e37 Jerome Glisse    2009-12-10  890  int ttm_bo_validate(struct=
 ttm_buffer_object *bo,
ca262a9998d461 Jerome Glisse    2009-12-08  891  		    struct ttm_placement=
 *placement,
19be5570107108 Christian K=C3=B6nig  2017-04-12  892  		    struct ttm_oper=
ation_ctx *ctx)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  893  {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  894  	int ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  895  =

52791eeec1d9f4 Christian K=C3=B6nig  2019-08-11  896  	dma_resv_assert_held=
(bo->base.resv);
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  897  =

d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  898  	/*
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  899  	 * Remove the backin=
g store if no placement is given.
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  900  	 */
a3be8cd70fec2a Thomas Hellstr=C3=B6m 2021-06-02  901  	if (!placement->num_=
placement && !placement->num_busy_placement)
a3be8cd70fec2a Thomas Hellstr=C3=B6m 2021-06-02  902  		return ttm_bo_pipel=
ine_gutting(bo);
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  903  =

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  904  	/*
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  905  	 * Check whether we need =
to move buffer.
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  906  	 */
dafc2f46058f06 Christian K=C3=B6nig  2022-07-07 @907  	if (!bo->resource ||=
 !ttm_resource_compat(bo->resource, placement)) {
83876c1bed8c91 Christian K=C3=B6nig  2017-04-12  908  		ret =3D ttm_bo_move=
_buffer(bo, placement, ctx);
ca262a9998d461 Jerome Glisse    2009-12-08  909  		if (ret)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  910  			return ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  911  	}
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  912  	/*
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  913  	 * We might need to =
add a TTM.
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  914  	 */
d3116756a710e3 Christian K=C3=B6nig  2021-04-12 @915  	if (bo->resource->me=
m_type =3D=3D TTM_PL_SYSTEM) {
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  916  		ret =3D ttm_tt_crea=
te(bo, true);
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  917  		if (ret)
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  918  			return ret;
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  919  	}
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  920  	return 0;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  921  }
09855acb1c2e37 Jerome Glisse    2009-12-10  922  EXPORT_SYMBOL(ttm_bo_valid=
ate);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  923  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1437119711372231404==--

