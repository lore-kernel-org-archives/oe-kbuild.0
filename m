Content-Type: multipart/mixed; boundary="===============3812582721846136563=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/tegra/nvdec.c:180:20: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 15 Aug 2022 08:20:17 +0800
Message-ID: <202208150830.je33LixY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3812582721846136563==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/tegra/nvdec.c:180:20: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mikko Perttunen <mperttunen@nvidia.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5d6a0f4da9275f6c212de33777778673ba91241a
commit: 46f226c93d35b936aeec6eb31da932dc2e86f413 drm/tegra: Add NVDEC driver
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-c002-20220808 (https://download.01.org/0day-ci/archi=
ve/20220815/202208150830.je33LixY-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D46f226c93d35b936aeec6eb31da932dc2e86f413
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 46f226c93d35b936aeec6eb31da932dc2e86f413
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/drm/tegra/nvdec.c: In function 'nvdec_load_firmware':
>> drivers/gpu/drm/tegra/nvdec.c:180:20: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     180 |         dma_addr_t iova;
         |                    ^~~~
     'nvdec_load_firmware': event 1
       |
       |  180 |         dma_addr_t iova;
       |      |                    ^~~~
       |      |                    |
       |      |                    (1) use of uninitialized value '<unknown=
>' here
       |
   drivers/gpu/drm/tegra/nvdec.c: In function 'nvdec_probe':
   drivers/gpu/drm/tegra/nvdec.c:347:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     347 |         u32 host_class;
         |             ^~~~~~~~~~
     'nvdec_probe': event 1
       |
       |  347 |         u32 host_class;
       |      |             ^~~~~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +180 drivers/gpu/drm/tegra/nvdec.c

46f226c93d35b9 Mikko Perttunen 2021-09-16  175  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  176  static int nvdec_load_firmw=
are(struct nvdec *nvdec)
46f226c93d35b9 Mikko Perttunen 2021-09-16  177  {
46f226c93d35b9 Mikko Perttunen 2021-09-16  178  	struct host1x_client *clie=
nt =3D &nvdec->client.base;
46f226c93d35b9 Mikko Perttunen 2021-09-16  179  	struct tegra_drm *tegra =
=3D nvdec->client.drm;
46f226c93d35b9 Mikko Perttunen 2021-09-16 @180  	dma_addr_t iova;
46f226c93d35b9 Mikko Perttunen 2021-09-16  181  	size_t size;
46f226c93d35b9 Mikko Perttunen 2021-09-16  182  	void *virt;
46f226c93d35b9 Mikko Perttunen 2021-09-16  183  	int err;
46f226c93d35b9 Mikko Perttunen 2021-09-16  184  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  185  	if (nvdec->falcon.firmware=
.virt)
46f226c93d35b9 Mikko Perttunen 2021-09-16  186  		return 0;
46f226c93d35b9 Mikko Perttunen 2021-09-16  187  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  188  	err =3D falcon_read_firmwa=
re(&nvdec->falcon, nvdec->config->firmware);
46f226c93d35b9 Mikko Perttunen 2021-09-16  189  	if (err < 0)
46f226c93d35b9 Mikko Perttunen 2021-09-16  190  		return err;
46f226c93d35b9 Mikko Perttunen 2021-09-16  191  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  192  	size =3D nvdec->falcon.fir=
mware.size;
46f226c93d35b9 Mikko Perttunen 2021-09-16  193  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  194  	if (!client->group) {
46f226c93d35b9 Mikko Perttunen 2021-09-16  195  		virt =3D dma_alloc_cohere=
nt(nvdec->dev, size, &iova, GFP_KERNEL);
46f226c93d35b9 Mikko Perttunen 2021-09-16  196  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  197  		err =3D dma_mapping_error=
(nvdec->dev, iova);
46f226c93d35b9 Mikko Perttunen 2021-09-16  198  		if (err < 0)
46f226c93d35b9 Mikko Perttunen 2021-09-16  199  			return err;
46f226c93d35b9 Mikko Perttunen 2021-09-16  200  	} else {
46f226c93d35b9 Mikko Perttunen 2021-09-16  201  		virt =3D tegra_drm_alloc(=
tegra, size, &iova);
46f226c93d35b9 Mikko Perttunen 2021-09-16  202  	}
46f226c93d35b9 Mikko Perttunen 2021-09-16  203  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  204  	nvdec->falcon.firmware.vir=
t =3D virt;
46f226c93d35b9 Mikko Perttunen 2021-09-16  205  	nvdec->falcon.firmware.iov=
a =3D iova;
46f226c93d35b9 Mikko Perttunen 2021-09-16  206  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  207  	err =3D falcon_load_firmwa=
re(&nvdec->falcon);
46f226c93d35b9 Mikko Perttunen 2021-09-16  208  	if (err < 0)
46f226c93d35b9 Mikko Perttunen 2021-09-16  209  		goto cleanup;
46f226c93d35b9 Mikko Perttunen 2021-09-16  210  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  211  	/*
46f226c93d35b9 Mikko Perttunen 2021-09-16  212  	 * In this case we have re=
ceived an IOVA from the shared domain, so we
46f226c93d35b9 Mikko Perttunen 2021-09-16  213  	 * need to make sure to ge=
t the physical address so that the DMA API
46f226c93d35b9 Mikko Perttunen 2021-09-16  214  	 * knows what memory pages=
 to flush the cache for.
46f226c93d35b9 Mikko Perttunen 2021-09-16  215  	 */
46f226c93d35b9 Mikko Perttunen 2021-09-16  216  	if (client->group) {
46f226c93d35b9 Mikko Perttunen 2021-09-16  217  		dma_addr_t phys;
46f226c93d35b9 Mikko Perttunen 2021-09-16  218  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  219  		phys =3D dma_map_single(n=
vdec->dev, virt, size, DMA_TO_DEVICE);
46f226c93d35b9 Mikko Perttunen 2021-09-16  220  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  221  		err =3D dma_mapping_error=
(nvdec->dev, phys);
46f226c93d35b9 Mikko Perttunen 2021-09-16  222  		if (err < 0)
46f226c93d35b9 Mikko Perttunen 2021-09-16  223  			goto cleanup;
46f226c93d35b9 Mikko Perttunen 2021-09-16  224  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  225  		nvdec->falcon.firmware.ph=
ys =3D phys;
46f226c93d35b9 Mikko Perttunen 2021-09-16  226  	}
46f226c93d35b9 Mikko Perttunen 2021-09-16  227  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  228  	return 0;
46f226c93d35b9 Mikko Perttunen 2021-09-16  229  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  230  cleanup:
46f226c93d35b9 Mikko Perttunen 2021-09-16  231  	if (!client->group)
46f226c93d35b9 Mikko Perttunen 2021-09-16  232  		dma_free_coherent(nvdec->=
dev, size, virt, iova);
46f226c93d35b9 Mikko Perttunen 2021-09-16  233  	else
46f226c93d35b9 Mikko Perttunen 2021-09-16  234  		tegra_drm_free(tegra, siz=
e, virt, iova);
46f226c93d35b9 Mikko Perttunen 2021-09-16  235  =

46f226c93d35b9 Mikko Perttunen 2021-09-16  236  	return err;
46f226c93d35b9 Mikko Perttunen 2021-09-16  237  }
46f226c93d35b9 Mikko Perttunen 2021-09-16  238  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3812582721846136563==--

