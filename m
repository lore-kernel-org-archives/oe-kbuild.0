Content-Type: multipart/mixed; boundary="===============0075089201471203602=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/host1x/context.c:21:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Fri, 12 Aug 2022 03:18:51 +0800
Message-ID: <202208120344.Y0NmMITV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0075089201471203602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/host1x/context.c:21:22: warning: use of uninitialized value '<unknown>' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Mikko Perttunen <mperttunen@nvidia.com>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2ae08b36c06ea8df73a79f6b80ff7964e006e9e3
commit: 8aa5bcb61612060429223d1fbb7a1c30a579fc1f gpu: host1x: Add context d=
evice management code
date:   5 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220812/202208120344.Y0NmMITV-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D8aa5bcb61612060429223d1fbb7a1c30a579fc1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 8aa5bcb61612060429223d1fbb7a1c30a579fc1f
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/gpu/host1x/context.c: In function 'host1x_memory_context_list_in=
it':
>> drivers/gpu/host1x/context.c:21:22: warning: use of uninitialized value =
'<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      21 |         unsigned int i;
         |                      ^
     'host1x_memory_context_list_init': event 1
       |
       |   21 |         unsigned int i;
       |      |                      ^
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |

vim +21 drivers/gpu/host1x/context.c

8aa5bcb6161206 Mikko Perttunen 2022-06-27  15  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  16  int host1x_memory_context_li=
st_init(struct host1x *host1x)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  17  {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  18  	struct host1x_memory_contex=
t_list *cdl =3D &host1x->context_list;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  19  	struct device_node *node =
=3D host1x->dev->of_node;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  20  	struct host1x_memory_contex=
t *ctx;
8aa5bcb6161206 Mikko Perttunen 2022-06-27 @21  	unsigned int i;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  22  	int err;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  23  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  24  	cdl->devs =3D NULL;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  25  	cdl->len =3D 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  26  	mutex_init(&cdl->lock);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  27  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  28  	err =3D of_property_count_u=
32_elems(node, "iommu-map");
8aa5bcb6161206 Mikko Perttunen 2022-06-27  29  	if (err < 0)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  30  		return 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  31  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  32  	cdl->devs =3D kcalloc(err, =
sizeof(*cdl->devs), GFP_KERNEL);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  33  	if (!cdl->devs)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  34  		return -ENOMEM;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  35  	cdl->len =3D err / 4;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  36  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  37  	for (i =3D 0; i < cdl->len;=
 i++) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  38  		struct iommu_fwspec *fwspe=
c;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  39  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  40  		ctx =3D &cdl->devs[i];
8aa5bcb6161206 Mikko Perttunen 2022-06-27  41  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  42  		ctx->host =3D host1x;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  43  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  44  		device_initialize(&ctx->de=
v);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  45  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  46  		/*
8aa5bcb6161206 Mikko Perttunen 2022-06-27  47  		 * Due to an issue with T1=
94 NVENC, only 38 bits can be used.
8aa5bcb6161206 Mikko Perttunen 2022-06-27  48  		 * Anyway, 256GiB of IOVA =
ought to be enough for anyone.
8aa5bcb6161206 Mikko Perttunen 2022-06-27  49  		 */
8aa5bcb6161206 Mikko Perttunen 2022-06-27  50  		ctx->dma_mask =3D DMA_BIT_=
MASK(38);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  51  		ctx->dev.dma_mask =3D &ctx=
->dma_mask;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  52  		ctx->dev.coherent_dma_mask=
 =3D ctx->dma_mask;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  53  		dev_set_name(&ctx->dev, "h=
ost1x-ctx.%d", i);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  54  		ctx->dev.bus =3D &host1x_c=
ontext_device_bus_type;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  55  		ctx->dev.parent =3D host1x=
->dev;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  56  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  57  		dma_set_max_seg_size(&ctx-=
>dev, UINT_MAX);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  58  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  59  		err =3D device_add(&ctx->d=
ev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  60  		if (err) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  61  			dev_err(host1x->dev, "cou=
ld not add context device %d: %d\n", i, err);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  62  			goto del_devices;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  63  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  64  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  65  		err =3D of_dma_configure_i=
d(&ctx->dev, node, true, &i);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  66  		if (err) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  67  			dev_err(host1x->dev, "IOM=
MU configuration failed for context device %d: %d\n",
8aa5bcb6161206 Mikko Perttunen 2022-06-27  68  				i, err);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  69  			device_del(&ctx->dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  70  			goto del_devices;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  71  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  72  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  73  		fwspec =3D dev_iommu_fwspe=
c_get(&ctx->dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  74  		if (!fwspec || !device_iom=
mu_mapped(&ctx->dev)) {
8aa5bcb6161206 Mikko Perttunen 2022-06-27  75  			dev_err(host1x->dev, "Con=
text device %d has no IOMMU!\n", i);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  76  			device_del(&ctx->dev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  77  			goto del_devices;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  78  		}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  79  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  80  		ctx->stream_id =3D fwspec-=
>ids[0] & 0xffff;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  81  	}
8aa5bcb6161206 Mikko Perttunen 2022-06-27  82  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  83  	return 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  84  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  85  del_devices:
8aa5bcb6161206 Mikko Perttunen 2022-06-27  86  	while (i--)
8aa5bcb6161206 Mikko Perttunen 2022-06-27  87  		device_del(&cdl->devs[i].d=
ev);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  88  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  89  	kfree(cdl->devs);
8aa5bcb6161206 Mikko Perttunen 2022-06-27  90  	cdl->len =3D 0;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  91  =

8aa5bcb6161206 Mikko Perttunen 2022-06-27  92  	return err;
8aa5bcb6161206 Mikko Perttunen 2022-06-27  93  }
8aa5bcb6161206 Mikko Perttunen 2022-06-27  94  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0075089201471203602==--

