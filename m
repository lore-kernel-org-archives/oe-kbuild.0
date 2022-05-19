Content-Type: multipart/mixed; boundary="===============1879194546910031942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 09/11] drm/ttm: audit bo->resource usage
Date: Fri, 20 May 2022 03:19:28 +0800
Message-ID: <202205200316.Md7zjc9o-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1879194546910031942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220519095508.115203-10-christian.koenig@amd.com>
References: <20220519095508.115203-10-christian.koenig@amd.com>
TO: "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gmail.com>
TO: intel-gfx(a)lists.freedesktop.org
CC: matthew.william.auld(a)gmail.com
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: dri-devel(a)lists.freedesktop.org

Hi "Christian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc7 next-20220=
519]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-=
radeon-switch-over-to-ttm_bo_init_reserved/20220519-185504
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
520/202205200316.Md7zjc9o-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:909 ttm_bo_validate() error: we previously ass=
umed 'bo->resource' could be null (see line 901)

Old smatch warnings:
drivers/gpu/drm/ttm/ttm_bo.c:672 ttm_mem_evict_first() warn: inconsistent r=
eturns '&bdev->lru_lock'.
include/drm/drm_vma_manager.h:225 drm_vma_node_unmap() warn: should 'drm_vm=
a_node_size(node) << 12' be a 64 bit type?

vim +909 drivers/gpu/drm/ttm/ttm_bo.c

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  883  =

09855acb1c2e37 Jerome Glisse    2009-12-10  884  int ttm_bo_validate(struct=
 ttm_buffer_object *bo,
ca262a9998d461 Jerome Glisse    2009-12-08  885  		    struct ttm_placement=
 *placement,
19be5570107108 Christian K=C3=B6nig  2017-04-12  886  		    struct ttm_oper=
ation_ctx *ctx)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  887  {
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  888  	int ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  889  =

52791eeec1d9f4 Christian K=C3=B6nig  2019-08-11  890  	dma_resv_assert_held=
(bo->base.resv);
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  891  =

d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  892  	/*
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  893  	 * Remove the backin=
g store if no placement is given.
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  894  	 */
a3be8cd70fec2a Thomas Hellstr=C3=B6m 2021-06-02  895  	if (!placement->num_=
placement && !placement->num_busy_placement)
a3be8cd70fec2a Thomas Hellstr=C3=B6m 2021-06-02  896  		return ttm_bo_pipel=
ine_gutting(bo);
d2588d2ded0f3a Christian K=C3=B6nig  2018-03-15  897  =

ba4e7d973dd09b Thomas Hellstrom 2009-06-10  898  	/*
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  899  	 * Check whether we need =
to move buffer.
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  900  	 */
abd7815e9a77bc Christian K=C3=B6nig  2022-05-19 @901  	if (!bo->resource ||=
 !ttm_resource_compat(bo->resource, placement)) {
83876c1bed8c91 Christian K=C3=B6nig  2017-04-12  902  		ret =3D ttm_bo_move=
_buffer(bo, placement, ctx);
ca262a9998d461 Jerome Glisse    2009-12-08  903  		if (ret)
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  904  			return ret;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  905  	}
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  906  	/*
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  907  	 * We might need to =
add a TTM.
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  908  	 */
d3116756a710e3 Christian K=C3=B6nig  2021-04-12 @909  	if (bo->resource->me=
m_type =3D=3D TTM_PL_SYSTEM) {
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  910  		ret =3D ttm_tt_crea=
te(bo, true);
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  911  		if (ret)
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  912  			return ret;
62975d27d647a4 Christian K=C3=B6nig  2020-08-12  913  	}
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  914  	return 0;
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  915  }
09855acb1c2e37 Jerome Glisse    2009-12-10  916  EXPORT_SYMBOL(ttm_bo_valid=
ate);
ba4e7d973dd09b Thomas Hellstrom 2009-06-10  917  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1879194546910031942==--

