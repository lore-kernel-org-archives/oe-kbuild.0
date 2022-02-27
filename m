Content-Type: multipart/mixed; boundary="===============0251703966585660054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1562 a6xx_gmu_init() warn: passing a valid pointer to 'PTR_ERR'
Date: Sun, 27 Feb 2022 10:43:26 +0800
Message-ID: <202202271057.2nmPq4I3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0251703966585660054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Christian K=C3=B6nig" <christian.koenig@amd.com>
CC: Rob Clark <robdclark@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2293be58d6a18cab800e25e42081bacb75c05752
commit: b3ed524f84f573ece1aa2f26e9db3c34a593e0d1 drm/msm: allow compile_tes=
t on !ARM
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: m68k-randconfig-m031-20220227 (https://download.01.org/0day-ci/arch=
ive/20220227/202202271057.2nmPq4I3-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1562 a6xx_gmu_init() warn: passing a =
valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/msm/adreno/a6xx_gmu.c:619 a6xx_gmu_rpmh_init() error: unini=
tialized symbol 'seqptr'.

vim +/PTR_ERR +1562 drivers/gpu/drm/msm/adreno/a6xx_gmu.c

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1474  =

981f2aabeae6f23 Sean Paul      2019-05-23  1475  int a6xx_gmu_init(struct a=
6xx_gpu *a6xx_gpu, struct device_node *node)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1476  {
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1477  	struct adreno_gpu *adreno=
_gpu =3D &a6xx_gpu->base;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1478  	struct a6xx_gmu *gmu =3D =
&a6xx_gpu->gmu;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1479  	struct platform_device *p=
dev =3D of_find_device_by_node(node);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1480  	int ret;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1481  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1482  	if (!pdev)
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1483  		return -ENODEV;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1484  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1485  	gmu->dev =3D &pdev->dev;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1486  =

29ac8979cdf7205 Jonathan Marek 2020-04-23  1487  	of_dma_configure(gmu->dev=
, node, true);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1488  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1489  	/* Fow now, don't do anyt=
hing fancy until we get our feet under us */
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1490  	gmu->idle_level =3D GMU_I=
DLE_STATE_ACTIVE;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1491  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1492  	pm_runtime_enable(gmu->de=
v);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1493  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1494  	/* Get the list of clocks=
 */
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1495  	ret =3D a6xx_gmu_clocks_p=
robe(gmu);
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1496  	if (ret)
998efc74672c2d9 Sean Paul      2019-05-23  1497  		goto err_put_device;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1498  =

29ac8979cdf7205 Jonathan Marek 2020-04-23  1499  	ret =3D a6xx_gmu_memory_p=
robe(gmu);
29ac8979cdf7205 Jonathan Marek 2020-04-23  1500  	if (ret)
29ac8979cdf7205 Jonathan Marek 2020-04-23  1501  		goto err_put_device;
29ac8979cdf7205 Jonathan Marek 2020-04-23  1502  =

f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1503  =

f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1504  	/* A660 now requires hand=
ling "prealloc requests" in GMU firmware
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1505  	 * For now just hardcode =
allocations based on the known firmware.
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1506  	 * note: there is no indi=
cation that these correspond to "dummy" or
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1507  	 * "debug" regions, but t=
his "guess" allows reusing these BOs which
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1508  	 * are otherwise unused b=
y a660.
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1509  	 */
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1510  	gmu->dummy.size =3D SZ_4K;
192f4ee3e408553 Akhil P Oommen 2021-07-30  1511  	if (adreno_is_a660_family=
(adreno_gpu)) {
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1512  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->debug, SZ_4K * 7, 0x60400000);
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1513  		if (ret)
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1514  			goto err_memory;
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1515  =

f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1516  		gmu->dummy.size =3D SZ_8=
K;
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1517  	}
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1518  =

c6ed04f856a4ebb Jonathan Marek 2020-04-23  1519  	/* Allocate memory for th=
e GMU dummy page */
f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1520  	ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->dummy, gmu->dummy.size, 0x60000000);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1521  	if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1522  		goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1523  =

f6d62d091cfd1c3 Jonathan Marek 2021-06-08  1524  	if (adreno_is_a650_family=
(adreno_gpu)) {
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1525  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->icache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1526  			SZ_16M - SZ_16K, 0x0400=
0);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1527  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1528  			goto err_memory;
083cc3a4d451bd9 Rob Clark      2021-08-07  1529  	} else if (adreno_is_a640=
_family(adreno_gpu)) {
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1530  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->icache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1531  			SZ_256K - SZ_16K, 0x040=
00);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1532  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1533  			goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1534  =

c6ed04f856a4ebb Jonathan Marek 2020-04-23  1535  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->dcache,
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1536  			SZ_256K - SZ_16K, 0x440=
00);
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1537  		if (ret)
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1538  			goto err_memory;
c6ed04f856a4ebb Jonathan Marek 2020-04-23  1539  	} else {
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1540  		/* HFI v1, has sptprac */
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1541  		gmu->legacy =3D true;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1542  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1543  		/* Allocate memory for t=
he GMU debug region */
29ac8979cdf7205 Jonathan Marek 2020-04-23  1544  		ret =3D a6xx_gmu_memory_=
alloc(gmu, &gmu->debug, SZ_16K, 0);
29ac8979cdf7205 Jonathan Marek 2020-04-23  1545  		if (ret)
a62fb211ad0c9e1 Sean Paul      2019-05-23  1546  			goto err_memory;
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1547  	}
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1548  =

8167e6fa76c8f71 Jonathan Marek 2020-04-23  1549  	/* Allocate memory for fo=
r the HFI queues */
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1550  	ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->hfi, SZ_16K, 0);
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1551  	if (ret)
8167e6fa76c8f71 Jonathan Marek 2020-04-23  1552  		goto err_memory;
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1553  =

ad4968d51dd3a22 Jonathan Marek 2020-04-23  1554  	/* Allocate memory for th=
e GMU log region */
ad4968d51dd3a22 Jonathan Marek 2020-04-23  1555  	ret =3D a6xx_gmu_memory_a=
lloc(gmu, &gmu->log, SZ_4K, 0);
ad4968d51dd3a22 Jonathan Marek 2020-04-23  1556  	if (ret)
ad4968d51dd3a22 Jonathan Marek 2020-04-23  1557  		goto err_memory;
ad4968d51dd3a22 Jonathan Marek 2020-04-23  1558  =

4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1559  	/* Map the GMU registers =
*/
4b565ca5a2cbbbb Jordan Crouse  2018-08-06  1560  	gmu->mmio =3D a6xx_gmu_ge=
t_mmio(pdev, "gmu");
29ac8979cdf7205 Jonathan Marek 2020-04-23  1561  	if (IS_ERR(gmu->mmio)) {
29ac8979cdf7205 Jonathan Marek 2020-04-23 @1562  		ret =3D PTR_ERR(gmu->mmi=
o);

:::::: The code at line 1562 was first introduced by commit
:::::: 29ac8979cdf7205bf70ec9be60bd2442acc0422a drm/msm/a6xx: use msm_gem f=
or GMU memory objects

:::::: TO: Jonathan Marek <jonathan@marek.ca>
:::::: CC: Rob Clark <robdclark@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0251703966585660054==--

