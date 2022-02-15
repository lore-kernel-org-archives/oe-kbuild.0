Content-Type: multipart/mixed; boundary="===============6490440613181270936=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:iommufd 18/31] drivers/gpu/drm/tegra/drm.c:998:23: warning: Value stored to 'domain' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 16 Feb 2022 03:44:31 +0800
Message-ID: <202202160335.Mb5DqLiM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6490440613181270936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://github.com/jgunthorpe/linux iommufd
head:   6b5b3f20ed6b64824c2d447b4f4555fcb390bf3b
commit: ae38950aefd81c9648c5416ec4a5003e4ec03e42 [18/31] drm/tegra: Use the=
 iommu dma_owner mechanism
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220210 (https://download.01.org/0day-ci/archi=
ve/20220216/202202160335.Mb5DqLiM-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9=
ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/jgunthorpe/linux/commit/ae38950aefd81c9648c541=
6ec4a5003e4ec03e42
        git remote add jgunthorpe https://github.com/jgunthorpe/linux
        git fetch --no-tags jgunthorpe iommufd
        git checkout ae38950aefd81c9648c5416ec4a5003e4ec03e42
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   18 warnings generated.
   drivers/video/fbdev/aty/mach64_gx.c:355:3: warning: Value stored to 'MHz=
100' is never read [clang-analyzer-deadcode.DeadStores]
                   MHz100 =3D MAX_FREQ_2595;
                   ^
   drivers/video/fbdev/aty/mach64_gx.c:355:3: note: Value stored to 'MHz100=
' is never read
   drivers/video/fbdev/aty/mach64_gx.c:358:3: warning: Value stored to 'pro=
gram_bits' is never read [clang-analyzer-deadcode.DeadStores]
                   program_bits =3D 0;       /* MHz100 =3D 257 */
                   ^              ~
   drivers/video/fbdev/aty/mach64_gx.c:358:3: note: Value stored to 'progra=
m_bits' is never read
                   program_bits =3D 0;       /* MHz100 =3D 257 */
                   ^              ~
   drivers/video/fbdev/aty/mach64_gx.c:649:3: warning: Value stored to 'dif=
f' is never read [clang-analyzer-deadcode.DeadStores]
                   diff =3D 0;
                   ^      ~
   drivers/video/fbdev/aty/mach64_gx.c:649:3: note: Value stored to 'diff' =
is never read
                   diff =3D 0;
                   ^      ~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/fbdev/aty/aty128fb.c:824:2: warning: Value stored to 'temp=
' is never read [clang-analyzer-deadcode.DeadStores]
           temp =3D aty_ld_le32(RAGE128_MPP_TB_CONFIG);
           ^
   drivers/video/fbdev/aty/aty128fb.c:824:2: note: Value stored to 'temp' i=
s never read
   drivers/video/fbdev/aty/aty128fb.c:2363:23: warning: Value stored to 'pa=
r' during its initialization is never read [clang-analyzer-deadcode.DeadSto=
res]
           struct aty128fb_par *par =3D info->par;
                                ^~~   ~~~~~~~~~
   drivers/video/fbdev/aty/aty128fb.c:2363:23: note: Value stored to 'par' =
during its initialization is never read
           struct aty128fb_par *par =3D info->par;
                                ^~~   ~~~~~~~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/tegra/drm.c:998:23: warning: Value stored to 'domain' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct iommu_domain *domain =3D iommu_get_domain_for_dev(client-=
>dev);
                                ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/gpu/drm/tegra/drm.c:998:23: note: Value stored to 'domain' durin=
g its initialization is never read
           struct iommu_domain *domain =3D iommu_get_domain_for_dev(client-=
>dev);
                                ^~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   Suppressed 7 warnings (6 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:47:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo85b5.c:47:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:45:6: warning: Value stored to =
'page_count' during its initialization is never read [clang-analyzer-deadco=
de.DeadStores]
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nouveau_bo9039.c:45:6: note: Value stored to 'pa=
ge_count' during its initialization is never read
           u32 page_count =3D new_reg->num_pages;
               ^~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/iio/accel/mma8452.c:252:2: warning: Value stored to 'ret' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/mma8452.c:252:2: note: Value stored to 'ret' is never =
read
           ret =3D i2c_smbus_read_i2c_block_data(data->client, MMA8452_OUT_=
X,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: warning: Value stored to 'ret' i=
s never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/algos/i2c-algo-pcf.c:322:3: note: Value stored to 'ret' is n=
ever read
                   ret =3D pcf_doAddress(adap, pmsg);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/domain +998 drivers/gpu/drm/tegra/drm.c

0c407de5ed1a329 Thierry Reding  2018-05-04   995  =

aacdf19849734d1 Thierry Reding  2019-02-08   996  void host1x_client_iommu_=
detach(struct host1x_client *client)
0c407de5ed1a329 Thierry Reding  2018-05-04   997  {
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  @998  	struct iommu_domain *dom=
ain =3D iommu_get_domain_for_dev(client->dev);
608f43ad27ab267 Thierry Reding  2019-12-02   999  	struct drm_device *drm =
=3D dev_get_drvdata(client->host);
0c407de5ed1a329 Thierry Reding  2018-05-04  1000  	struct tegra_drm *tegra =
=3D drm->dev_private;
0c407de5ed1a329 Thierry Reding  2018-05-04  1001  =

aacdf19849734d1 Thierry Reding  2019-02-08  1002  	if (client->group) {
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  1003  		iommu_detach_device_sha=
red(tegra->domain, client->dev);
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  1004  		iommu_device_release_dm=
a_owner(client->dev,
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  1005  					       DMA_OWNER_PRI=
VATE_DOMAIN);
fa6661b7aa0b520 Thierry Reding  2019-10-28  1006  		client->group =3D NULL;
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  1007  	} else {
ae38950aefd81c9 Jason Gunthorpe 2021-11-18  1008  		iommu_device_release_dm=
a_owner(client->dev, DMA_OWNER_DMA_API);
0c407de5ed1a329 Thierry Reding  2018-05-04  1009  	}
0c407de5ed1a329 Thierry Reding  2018-05-04  1010  }
0c407de5ed1a329 Thierry Reding  2018-05-04  1011  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6490440613181270936==--

