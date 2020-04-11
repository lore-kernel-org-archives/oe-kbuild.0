Content-Type: multipart/mixed; boundary="===============1724266332369080232=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/selftests: selftest for timeline semaphore
Date: Sat, 11 Apr 2020 17:36:36 +0800
Message-ID: <202004111758.khTQ26ya%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1724266332369080232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200410165158.29546-4-venkata.s.dhanalakota@intel.com>
References: <20200410165158.29546-4-venkata.s.dhanalakota@intel.com>
TO: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
CC: intel-gfx(a)lists.freedesktop.org
CC: chris.p.wilson(a)intel.com

Hi Venkata,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[cannot apply to drm-intel/for-linux-next linus/master v5.6 next-20200410]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Venkata-Sandeep-Dhanalakot=
a/drm-i915-introduce-a-mechanism-to-extend-execbuf2/20200411-031057
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:349:53: sparse: =
warning: incorrect type in argument 1 (different address spaces)
>> drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:349:53: sparse: =
   expected struct dma_fence *fence
>> drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:349:53: sparse: =
   got struct dma_fence [noderef] <asn:4> *fence
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:366:44: sparse: =
warning: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:366:44: sparse: =
   expected struct dma_fence *fence
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:366:44: sparse: =
   got struct dma_fence [noderef] <asn:4> *fence
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:471:53: sparse: =
warning: incorrect type in argument 1 (different address spaces)
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:471:53: sparse: =
   expected struct dma_fence *fence
   drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c:471:53: sparse: =
   got struct dma_fence [noderef] <asn:4> *fence

# https://github.com/0day-ci/linux/commit/362cf777546c74e0be786cf6ae2f42031=
a6a03c8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 362cf777546c74e0be786cf6ae2f42031a6a03c8
vim +349 drivers/gpu/drm/selftests/test-drm_timeline_semaphore.c

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  329  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  330  static int igt_=
waitseqno(void *ignored)
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  331  {
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  332  	struct fence_c=
hain *signal;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  333  	struct mock_ti=
meline *t[6];
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  334  	struct chain_i=
nfo ci;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  335  	struct dma_fen=
ce *f;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  336  	int i, count =
=3D 5;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  337  	int err =3D 0;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  338  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  339  	allocate_chain=
s(&ci, 1, 0);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  340  	if (IS_ERR_OR_=
NULL(ci.chains))
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  341  		return -ENOME=
M;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  342  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  343  	signal =3D ci.=
chains[0];
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  344  	atomic_set(&si=
gnal->signalers, count);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  345  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  346  	/* wait for su=
bmit */
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  347  	for (i =3D 0;i=
 < count; i++) {
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  348  		t[i] =3D time=
line(i, 0x0);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10 @349  		dma_fence_add=
_callback(t[i]->syncobj->fence,
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  350  				       &sig=
nal->cb,
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  351  				       fenc=
e_callback);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  352  	}
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  353  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  354  	for (i =3D 0;i=
 < count; i++) {
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  355  		if(dma_fence_=
is_signaled(&signal->chain.base))
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  356  			 err =3D -1;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  357  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  358  		f =3D drm_syn=
cobj_fence_get(t[i]->syncobj);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  359  		dma_fence_sig=
nal(f);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  360  	}
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  361  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  362  	if(!dma_fence_=
is_signaled(&signal->chain.base))
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  363  		 err =3D -1;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  364  =

362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  365  	for (i =3D 0;i=
 < count; i++) {
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  366  		dma_fence_put=
(t[i]->syncobj->fence);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  367  		kmem_cache_fr=
ee(slab_timeline, t[i]);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  368  	}
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  369  	delete_chains(=
&ci);
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  370  	return err;
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  371  }
362cf777546c74 Venkata Sandeep Dhanalakota 2020-04-10  372  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1724266332369080232==--

