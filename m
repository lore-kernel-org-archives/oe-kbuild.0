Content-Type: multipart/mixed; boundary="===============5560731342942256162=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a4xx_gpu.c:730 a4xx_gpu_init() warn: passing zero to 'ERR_PTR'
Date: Sat, 23 Apr 2022 06:30:54 +0800
Message-ID: <202204230650.xZNB0AaK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5560731342942256162==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
CC: Dave Airlie <airlied@redhat.com>

Hi Dave,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   281b9d9a4b02229b602a14f7540206b0fbe4134f
commit: 970eae15600a883e4ad27dd0757b18871cc983ab BackMerge tag 'v5.15-rc7' =
into drm-next
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: xtensa-randconfig-m031-20220422 (https://download.01.org/0day-ci/ar=
chive/20220423/202204230650.xZNB0AaK-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:730 a4xx_gpu_init() warn: passing zer=
o to 'ERR_PTR'
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:603 a3xx_gpu_init() warn: passing zer=
o to 'ERR_PTR'

vim +/ERR_PTR +730 drivers/gpu/drm/msm/adreno/a4xx_gpu.c

23bd62fd419755 Aravind Ganesan 2014-09-08  643  =

23bd62fd419755 Aravind Ganesan 2014-09-08  644  struct msm_gpu *a4xx_gpu_in=
it(struct drm_device *dev)
23bd62fd419755 Aravind Ganesan 2014-09-08  645  {
23bd62fd419755 Aravind Ganesan 2014-09-08  646  	struct a4xx_gpu *a4xx_gpu =
=3D NULL;
23bd62fd419755 Aravind Ganesan 2014-09-08  647  	struct adreno_gpu *adreno_=
gpu;
23bd62fd419755 Aravind Ganesan 2014-09-08  648  	struct msm_gpu *gpu;
23bd62fd419755 Aravind Ganesan 2014-09-08  649  	struct msm_drm_private *pr=
iv =3D dev->dev_private;
23bd62fd419755 Aravind Ganesan 2014-09-08  650  	struct platform_device *pd=
ev =3D priv->gpu_pdev;
5785dd7a8ef0de Akhil P Oommen  2020-10-28  651  	struct icc_path *ocmem_icc=
_path;
5785dd7a8ef0de Akhil P Oommen  2020-10-28  652  	struct icc_path *icc_path;
23bd62fd419755 Aravind Ganesan 2014-09-08  653  	int ret;
23bd62fd419755 Aravind Ganesan 2014-09-08  654  =

23bd62fd419755 Aravind Ganesan 2014-09-08  655  	if (!pdev) {
6a41da17e87dee Mamta Shukla    2018-10-20  656  		DRM_DEV_ERROR(dev->dev, "=
no a4xx device\n");
23bd62fd419755 Aravind Ganesan 2014-09-08  657  		ret =3D -ENXIO;
23bd62fd419755 Aravind Ganesan 2014-09-08  658  		goto fail;
23bd62fd419755 Aravind Ganesan 2014-09-08  659  	}
23bd62fd419755 Aravind Ganesan 2014-09-08  660  =

23bd62fd419755 Aravind Ganesan 2014-09-08  661  	a4xx_gpu =3D kzalloc(sizeo=
f(*a4xx_gpu), GFP_KERNEL);
23bd62fd419755 Aravind Ganesan 2014-09-08  662  	if (!a4xx_gpu) {
23bd62fd419755 Aravind Ganesan 2014-09-08  663  		ret =3D -ENOMEM;
23bd62fd419755 Aravind Ganesan 2014-09-08  664  		goto fail;
23bd62fd419755 Aravind Ganesan 2014-09-08  665  	}
23bd62fd419755 Aravind Ganesan 2014-09-08  666  =

23bd62fd419755 Aravind Ganesan 2014-09-08  667  	adreno_gpu =3D &a4xx_gpu->=
base;
23bd62fd419755 Aravind Ganesan 2014-09-08  668  	gpu =3D &adreno_gpu->base;
23bd62fd419755 Aravind Ganesan 2014-09-08  669  =

23bd62fd419755 Aravind Ganesan 2014-09-08  670  	gpu->perfcntrs =3D NULL;
23bd62fd419755 Aravind Ganesan 2014-09-08  671  	gpu->num_perfcntrs =3D 0;
23bd62fd419755 Aravind Ganesan 2014-09-08  672  =

f97decac5f4c2d Jordan Crouse   2017-10-20  673  	ret =3D adreno_gpu_init(de=
v, pdev, adreno_gpu, &funcs, 1);
23bd62fd419755 Aravind Ganesan 2014-09-08  674  	if (ret)
23bd62fd419755 Aravind Ganesan 2014-09-08  675  		goto fail;
23bd62fd419755 Aravind Ganesan 2014-09-08  676  =

d3b68ddf1d3836 Shawn Guo       2020-05-09  677  	adreno_gpu->registers =3D =
adreno_is_a405(adreno_gpu) ? a405_registers :
d3b68ddf1d3836 Shawn Guo       2020-05-09  678  							     a4xx_registers;
d3b68ddf1d3836 Shawn Guo       2020-05-09  679  =

23bd62fd419755 Aravind Ganesan 2014-09-08  680  	/* if needed, allocate gme=
m: */
26c0b26dcd005d Brian Masney    2019-08-23  681  	ret =3D adreno_gpu_ocmem_i=
nit(dev->dev, adreno_gpu,
26c0b26dcd005d Brian Masney    2019-08-23  682  				    &a4xx_gpu->ocmem);
26c0b26dcd005d Brian Masney    2019-08-23  683  	if (ret)
26c0b26dcd005d Brian Masney    2019-08-23  684  		goto fail;
23bd62fd419755 Aravind Ganesan 2014-09-08  685  =

667ce33e57d0de Rob Clark       2016-09-28  686  	if (!gpu->aspace) {
23bd62fd419755 Aravind Ganesan 2014-09-08  687  		/* TODO we think it is po=
ssible to configure the GPU to
23bd62fd419755 Aravind Ganesan 2014-09-08  688  		 * restrict access to VRA=
M carveout.  But the required
23bd62fd419755 Aravind Ganesan 2014-09-08  689  		 * registers are unknown.=
  For now just bail out and
23bd62fd419755 Aravind Ganesan 2014-09-08  690  		 * limp along with just m=
odesetting.  If it turns out
23bd62fd419755 Aravind Ganesan 2014-09-08  691  		 * to not be possible to =
restrict access, then we must
23bd62fd419755 Aravind Ganesan 2014-09-08  692  		 * implement a cmdstream =
validator.
23bd62fd419755 Aravind Ganesan 2014-09-08  693  		 */
6a41da17e87dee Mamta Shukla    2018-10-20  694  		DRM_DEV_ERROR(dev->dev, "=
No memory protection without IOMMU\n");
3f7759e7b7585a Iskren Chernev  2020-12-30  695  		if (!allow_vram_carveout)=
 {
23bd62fd419755 Aravind Ganesan 2014-09-08  696  			ret =3D -ENXIO;
23bd62fd419755 Aravind Ganesan 2014-09-08  697  			goto fail;
23bd62fd419755 Aravind Ganesan 2014-09-08  698  		}
3f7759e7b7585a Iskren Chernev  2020-12-30  699  	}
23bd62fd419755 Aravind Ganesan 2014-09-08  700  =

5785dd7a8ef0de Akhil P Oommen  2020-10-28  701  	icc_path =3D devm_of_icc_g=
et(&pdev->dev, "gfx-mem");
980d74e7d03ccf Dan Carpenter   2021-10-01  702  	if (IS_ERR(icc_path)) {
980d74e7d03ccf Dan Carpenter   2021-10-01  703  		ret =3D PTR_ERR(icc_path);
5785dd7a8ef0de Akhil P Oommen  2020-10-28  704  		goto fail;
980d74e7d03ccf Dan Carpenter   2021-10-01  705  	}
5785dd7a8ef0de Akhil P Oommen  2020-10-28  706  =

5785dd7a8ef0de Akhil P Oommen  2020-10-28  707  	ocmem_icc_path =3D devm_of=
_icc_get(&pdev->dev, "ocmem");
980d74e7d03ccf Dan Carpenter   2021-10-01  708  	if (IS_ERR(ocmem_icc_path)=
) {
980d74e7d03ccf Dan Carpenter   2021-10-01  709  		ret =3D PTR_ERR(ocmem_icc=
_path);
5785dd7a8ef0de Akhil P Oommen  2020-10-28  710  		/* allow -ENODATA, ocmem =
icc is optional */
5785dd7a8ef0de Akhil P Oommen  2020-10-28  711  		if (ret !=3D -ENODATA)
5785dd7a8ef0de Akhil P Oommen  2020-10-28  712  			goto fail;
5785dd7a8ef0de Akhil P Oommen  2020-10-28  713  		ocmem_icc_path =3D NULL;
5785dd7a8ef0de Akhil P Oommen  2020-10-28  714  	}
5785dd7a8ef0de Akhil P Oommen  2020-10-28  715  =

21f5a6c08b171b Brian Masney    2019-11-21  716  	/*
21f5a6c08b171b Brian Masney    2019-11-21  717  	 * Set the ICC path to max=
imum speed for now by multiplying the fastest
21f5a6c08b171b Brian Masney    2019-11-21  718  	 * frequency by the bus wi=
dth (8). We'll want to scale this later on to
21f5a6c08b171b Brian Masney    2019-11-21  719  	 * improve battery life.
21f5a6c08b171b Brian Masney    2019-11-21  720  	 */
5785dd7a8ef0de Akhil P Oommen  2020-10-28  721  	icc_set_bw(icc_path, 0, Bp=
s_to_icc(gpu->fast_rate) * 8);
5785dd7a8ef0de Akhil P Oommen  2020-10-28  722  	icc_set_bw(ocmem_icc_path,=
 0, Bps_to_icc(gpu->fast_rate) * 8);
21f5a6c08b171b Brian Masney    2019-11-21  723  =

23bd62fd419755 Aravind Ganesan 2014-09-08  724  	return gpu;
23bd62fd419755 Aravind Ganesan 2014-09-08  725  =

23bd62fd419755 Aravind Ganesan 2014-09-08  726  fail:
23bd62fd419755 Aravind Ganesan 2014-09-08  727  	if (a4xx_gpu)
23bd62fd419755 Aravind Ganesan 2014-09-08  728  		a4xx_destroy(&a4xx_gpu->b=
ase.base);
23bd62fd419755 Aravind Ganesan 2014-09-08  729  =

23bd62fd419755 Aravind Ganesan 2014-09-08 @730  	return ERR_PTR(ret);

:::::: The code at line 730 was first introduced by commit
:::::: 23bd62fd419755b439152915f4df8ff26346f2b7 drm/msm: a4xx support for m=
sm-drm

:::::: TO: Aravind Ganesan <aravindg@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5560731342942256162==--

