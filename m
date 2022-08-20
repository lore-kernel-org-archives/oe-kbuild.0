Content-Type: multipart/mixed; boundary="===============3791400984491021470=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a3xx_gpu.c:603 a3xx_gpu_init() warn: passing zero to 'ERR_PTR'
Date: Sat, 20 Aug 2022 20:40:29 +0800
Message-ID: <202208202056.qiNcnRei-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3791400984491021470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
CC: Dave Airlie <airlied@redhat.com>

Hi Dave,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   50cd95ac46548429e5bba7ca75cc97d11a697947
commit: 970eae15600a883e4ad27dd0757b18871cc983ab BackMerge tag 'v5.15-rc7' =
into drm-next
date:   10 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 10 months ago
config: microblaze-randconfig-m041-20220820 (https://download.01.org/0day-c=
i/archive/20220820/202208202056.qiNcnRei-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:603 a3xx_gpu_init() warn: passing zer=
o to 'ERR_PTR'
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:730 a4xx_gpu_init() warn: passing zer=
o to 'ERR_PTR'

vim +/ERR_PTR +603 drivers/gpu/drm/msm/adreno/a3xx_gpu.c

70c70f091b1ffd Rob Clark      2014-05-30  514  =

7198e6b03155f6 Rob Clark      2013-07-19  515  struct msm_gpu *a3xx_gpu_ini=
t(struct drm_device *dev)
7198e6b03155f6 Rob Clark      2013-07-19  516  {
7198e6b03155f6 Rob Clark      2013-07-19  517  	struct a3xx_gpu *a3xx_gpu =
=3D NULL;
55459968176f13 Rob Clark      2013-12-05  518  	struct adreno_gpu *adreno_g=
pu;
7198e6b03155f6 Rob Clark      2013-07-19  519  	struct msm_gpu *gpu;
060530f1ea6740 Rob Clark      2014-03-03  520  	struct msm_drm_private *pri=
v =3D dev->dev_private;
060530f1ea6740 Rob Clark      2014-03-03  521  	struct platform_device *pde=
v =3D priv->gpu_pdev;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  522  	struct icc_path *ocmem_icc_=
path;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  523  	struct icc_path *icc_path;
7198e6b03155f6 Rob Clark      2013-07-19  524  	int ret;
7198e6b03155f6 Rob Clark      2013-07-19  525  =

7198e6b03155f6 Rob Clark      2013-07-19  526  	if (!pdev) {
6a41da17e87dee Mamta Shukla   2018-10-20  527  		DRM_DEV_ERROR(dev->dev, "n=
o a3xx device\n");
7198e6b03155f6 Rob Clark      2013-07-19  528  		ret =3D -ENXIO;
7198e6b03155f6 Rob Clark      2013-07-19  529  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  530  	}
7198e6b03155f6 Rob Clark      2013-07-19  531  =

7198e6b03155f6 Rob Clark      2013-07-19  532  	a3xx_gpu =3D kzalloc(sizeof=
(*a3xx_gpu), GFP_KERNEL);
7198e6b03155f6 Rob Clark      2013-07-19  533  	if (!a3xx_gpu) {
7198e6b03155f6 Rob Clark      2013-07-19  534  		ret =3D -ENOMEM;
7198e6b03155f6 Rob Clark      2013-07-19  535  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  536  	}
7198e6b03155f6 Rob Clark      2013-07-19  537  =

55459968176f13 Rob Clark      2013-12-05  538  	adreno_gpu =3D &a3xx_gpu->b=
ase;
55459968176f13 Rob Clark      2013-12-05  539  	gpu =3D &adreno_gpu->base;
7198e6b03155f6 Rob Clark      2013-07-19  540  =

70c70f091b1ffd Rob Clark      2014-05-30  541  	gpu->perfcntrs =3D perfcntr=
s;
70c70f091b1ffd Rob Clark      2014-05-30  542  	gpu->num_perfcntrs =3D ARRA=
Y_SIZE(perfcntrs);
70c70f091b1ffd Rob Clark      2014-05-30  543  =

3bcefb0497f9fc Rob Clark      2014-09-05  544  	adreno_gpu->registers =3D a=
3xx_registers;
3bcefb0497f9fc Rob Clark      2014-09-05  545  =

f97decac5f4c2d Jordan Crouse  2017-10-20  546  	ret =3D adreno_gpu_init(dev=
, pdev, adreno_gpu, &funcs, 1);
7198e6b03155f6 Rob Clark      2013-07-19  547  	if (ret)
7198e6b03155f6 Rob Clark      2013-07-19  548  		goto fail;
7198e6b03155f6 Rob Clark      2013-07-19  549  =

55459968176f13 Rob Clark      2013-12-05  550  	/* if needed, allocate gmem=
: */
55459968176f13 Rob Clark      2013-12-05  551  	if (adreno_is_a330(adreno_g=
pu)) {
26c0b26dcd005d Brian Masney   2019-08-23  552  		ret =3D adreno_gpu_ocmem_i=
nit(&adreno_gpu->base.pdev->dev,
26c0b26dcd005d Brian Masney   2019-08-23  553  					    adreno_gpu, &a3xx_g=
pu->ocmem);
26c0b26dcd005d Brian Masney   2019-08-23  554  		if (ret)
26c0b26dcd005d Brian Masney   2019-08-23  555  			goto fail;
55459968176f13 Rob Clark      2013-12-05  556  	}
55459968176f13 Rob Clark      2013-12-05  557  =

667ce33e57d0de Rob Clark      2016-09-28  558  	if (!gpu->aspace) {
871d812aa43e63 Rob Clark      2013-11-16  559  		/* TODO we think it is pos=
sible to configure the GPU to
871d812aa43e63 Rob Clark      2013-11-16  560  		 * restrict access to VRAM=
 carveout.  But the required
871d812aa43e63 Rob Clark      2013-11-16  561  		 * registers are unknown. =
 For now just bail out and
871d812aa43e63 Rob Clark      2013-11-16  562  		 * limp along with just mo=
desetting.  If it turns out
871d812aa43e63 Rob Clark      2013-11-16  563  		 * to not be possible to r=
estrict access, then we must
871d812aa43e63 Rob Clark      2013-11-16  564  		 * implement a cmdstream v=
alidator.
871d812aa43e63 Rob Clark      2013-11-16  565  		 */
6a41da17e87dee Mamta Shukla   2018-10-20  566  		DRM_DEV_ERROR(dev->dev, "N=
o memory protection without IOMMU\n");
3f7759e7b7585a Iskren Chernev 2020-12-30  567  		if (!allow_vram_carveout) {
871d812aa43e63 Rob Clark      2013-11-16  568  			ret =3D -ENXIO;
871d812aa43e63 Rob Clark      2013-11-16  569  			goto fail;
871d812aa43e63 Rob Clark      2013-11-16  570  		}
3f7759e7b7585a Iskren Chernev 2020-12-30  571  	}
871d812aa43e63 Rob Clark      2013-11-16  572  =

5785dd7a8ef0de Akhil P Oommen 2020-10-28  573  	icc_path =3D devm_of_icc_ge=
t(&pdev->dev, "gfx-mem");
3eda901995371d Dan Carpenter  2021-10-01  574  	if (IS_ERR(icc_path)) {
3eda901995371d Dan Carpenter  2021-10-01  575  		ret =3D PTR_ERR(icc_path);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  576  		goto fail;
3eda901995371d Dan Carpenter  2021-10-01  577  	}
5785dd7a8ef0de Akhil P Oommen 2020-10-28  578  =

5785dd7a8ef0de Akhil P Oommen 2020-10-28  579  	ocmem_icc_path =3D devm_of_=
icc_get(&pdev->dev, "ocmem");
3eda901995371d Dan Carpenter  2021-10-01  580  	if (IS_ERR(ocmem_icc_path))=
 {
3eda901995371d Dan Carpenter  2021-10-01  581  		ret =3D PTR_ERR(ocmem_icc_=
path);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  582  		/* allow -ENODATA, ocmem i=
cc is optional */
5785dd7a8ef0de Akhil P Oommen 2020-10-28  583  		if (ret !=3D -ENODATA)
5785dd7a8ef0de Akhil P Oommen 2020-10-28  584  			goto fail;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  585  		ocmem_icc_path =3D NULL;
5785dd7a8ef0de Akhil P Oommen 2020-10-28  586  	}
5785dd7a8ef0de Akhil P Oommen 2020-10-28  587  =

5785dd7a8ef0de Akhil P Oommen 2020-10-28  588  =

d163ba0b65f2e4 Brian Masney   2019-11-21  589  	/*
d163ba0b65f2e4 Brian Masney   2019-11-21  590  	 * Set the ICC path to maxi=
mum speed for now by multiplying the fastest
d163ba0b65f2e4 Brian Masney   2019-11-21  591  	 * frequency by the bus wid=
th (8). We'll want to scale this later on to
d163ba0b65f2e4 Brian Masney   2019-11-21  592  	 * improve battery life.
d163ba0b65f2e4 Brian Masney   2019-11-21  593  	 */
5785dd7a8ef0de Akhil P Oommen 2020-10-28  594  	icc_set_bw(icc_path, 0, Bps=
_to_icc(gpu->fast_rate) * 8);
5785dd7a8ef0de Akhil P Oommen 2020-10-28  595  	icc_set_bw(ocmem_icc_path, =
0, Bps_to_icc(gpu->fast_rate) * 8);
d163ba0b65f2e4 Brian Masney   2019-11-21  596  =

871d812aa43e63 Rob Clark      2013-11-16  597  	return gpu;
7198e6b03155f6 Rob Clark      2013-07-19  598  =

7198e6b03155f6 Rob Clark      2013-07-19  599  fail:
7198e6b03155f6 Rob Clark      2013-07-19  600  	if (a3xx_gpu)
7198e6b03155f6 Rob Clark      2013-07-19  601  		a3xx_destroy(&a3xx_gpu->ba=
se.base);
7198e6b03155f6 Rob Clark      2013-07-19  602  =

7198e6b03155f6 Rob Clark      2013-07-19 @603  	return ERR_PTR(ret);

:::::: The code at line 603 was first introduced by commit
:::::: 7198e6b03155f6dadecadba004eb83b81a6ffe4c drm/msm: add a3xx gpu suppo=
rt

:::::: TO: Rob Clark <robdclark@gmail.com>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3791400984491021470==--

