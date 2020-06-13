Content-Type: multipart/mixed; boundary="===============6887271647023958452=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-review:Marek-Vasut/dmaengine-xilinx-Add-empty-device_config-function/20200613-230018 9559/10032] drivers/fpga/fpga-mgr.c:828:2: error: implicit declaration of function 'set_dma_ops'
Date: Sun, 14 Jun 2020 01:44:43 +0800
Message-ID: <202006140136.r7XgKwnM%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6887271647023958452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Nava kishore Manne <nava.manne@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/0day-ci/linux/commits/Marek-Vasut/dmaengine-xili=
nx-Add-empty-device_config-function/20200613-230018
head:   f88c4c2d8ab10fec078f00a89e51181e8823c49b
commit: ed71785e2c3c3495e89c7b6c3a38699b59bf83d8 [9559/10032] fpga: support=
 loading from a pre-allocated buffer
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: um-allmodconfig (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0
reproduce (this is a W=3D1 build):
        git checkout ed71785e2c3c3495e89c7b6c3a38699b59bf83d8
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-in=
clude-dirs]
In file included from include/linux/file.h:9,
from include/linux/dma-buf.h:16,
from drivers/fpga/fpga-mgr.c:11:
include/asm-generic/fixmap.h: In function 'fix_to_virt':
include/asm-generic/fixmap.h:32:19: warning: comparison of unsigned express=
ion >=3D 0 is always true [-Wtype-limits]
32 |  BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
|                   ^~
include/linux/compiler.h:330:9: note: in definition of macro '__compiletime=
_assert'
330 |   if (!(condition))              |         ^~~~~~~~~
include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime_a=
ssert'
350 |  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
|  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_a=
ssert'
39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
|                                     ^~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_M=
SG'
50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
|  ^~~~~~~~~~~~~~~~
include/asm-generic/fixmap.h:32:2: note: in expansion of macro 'BUILD_BUG_O=
N'
32 |  BUILD_BUG_ON(idx >=3D __end_of_fixed_addresses);
|  ^~~~~~~~~~~~
In file included from include/linux/uaccess.h:11,
from include/linux/highmem.h:9,
from drivers/fpga/fpga-mgr.c:21:
arch/um/include/asm/uaccess.h: In function '__access_ok':
arch/um/include/asm/uaccess.h:17:29: warning: comparison of unsigned expres=
sion >=3D 0 is always true [-Wtype-limits]
17 |    (((unsigned long) (addr) >=3D FIXADDR_USER_START) &&          |    =
                         ^~
arch/um/include/asm/uaccess.h:45:3: note: in expansion of macro '__access_o=
k_vsyscall'
45 |   __access_ok_vsyscall(addr, size) ||
|   ^~~~~~~~~~~~~~~~~~~~
drivers/fpga/fpga-mgr.c: In function 'fpga_mgr_create':
>> drivers/fpga/fpga-mgr.c:828:2: error: implicit declaration of function '=
set_dma_ops' [-Werror=3Dimplicit-function-declaration]
828 |  set_dma_ops(&mgr->dev, get_dma_ops(dev));
|  ^~~~~~~~~~~
>> drivers/fpga/fpga-mgr.c:828:25: error: implicit declaration of function =
'get_dma_ops'; did you mean 'get_dma_buf'? [-Werror=3Dimplicit-function-dec=
laration]
828 |  set_dma_ops(&mgr->dev, get_dma_ops(dev));
|                         ^~~~~~~~~~~
|                         get_dma_buf
cc1: some warnings being treated as errors

# https://github.com/0day-ci/linux/commit/ed71785e2c3c3495e89c7b6c3a38699b5=
9bf83d8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout ed71785e2c3c3495e89c7b6c3a38699b59bf83d8
vim +/set_dma_ops +828 drivers/fpga/fpga-mgr.c

ebf877a51ad7b6 Alan Tull          2017-11-15  773  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  774  /**
7085e2a94f7df5 Alan Tull          2018-05-16  775   * fpga_mgr_create - cre=
ate and initialize a FPGA manager struct
6a8c3be7ec8eb3 Alan Tull          2015-10-07  776   * @dev:	fpga manager de=
vice from pdev
6a8c3be7ec8eb3 Alan Tull          2015-10-07  777   * @name:	fpga manager n=
ame
6a8c3be7ec8eb3 Alan Tull          2015-10-07  778   * @mops:	pointer to str=
ucture of fpga manager ops
6a8c3be7ec8eb3 Alan Tull          2015-10-07  779   * @priv:	fpga manager p=
rivate data
6a8c3be7ec8eb3 Alan Tull          2015-10-07  780   *
084181fe8cc747 Alan Tull          2018-10-15  781   * The caller of this fu=
nction is responsible for freeing the struct with
084181fe8cc747 Alan Tull          2018-10-15  782   * fpga_mgr_free().  Usi=
ng devm_fpga_mgr_create() instead is recommended.
084181fe8cc747 Alan Tull          2018-10-15  783   *
7085e2a94f7df5 Alan Tull          2018-05-16  784   * Return: pointer to st=
ruct fpga_manager or NULL
6a8c3be7ec8eb3 Alan Tull          2015-10-07  785   */
7085e2a94f7df5 Alan Tull          2018-05-16  786  struct fpga_manager *fpg=
a_mgr_create(struct device *dev, const char *name,
6a8c3be7ec8eb3 Alan Tull          2015-10-07  787  				     const struct fp=
ga_manager_ops *mops,
6a8c3be7ec8eb3 Alan Tull          2015-10-07  788  				     void *priv)
6a8c3be7ec8eb3 Alan Tull          2015-10-07  789  {
6a8c3be7ec8eb3 Alan Tull          2015-10-07  790  	struct fpga_manager *mg=
r;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  791  	int id, ret;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  792  =

baa6d396635129 Jason Gunthorpe    2017-02-01  793  	if (!mops || !mops->wri=
te_complete || !mops->state ||
ed71785e2c3c34 Nava kishore Manne 2020-01-21  794  	    !mops->write_init |=
| (!mops->write && !mops->write_sg)) {
6a8c3be7ec8eb3 Alan Tull          2015-10-07  795  		dev_err(dev, "Attempt =
to register without fpga_manager_ops\n");
7085e2a94f7df5 Alan Tull          2018-05-16  796  		return NULL;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  797  	}
6a8c3be7ec8eb3 Alan Tull          2015-10-07  798  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  799  	if (!name || !strlen(na=
me)) {
6a8c3be7ec8eb3 Alan Tull          2015-10-07  800  		dev_err(dev, "Attempt =
to register with no name!\n");
7085e2a94f7df5 Alan Tull          2018-05-16  801  		return NULL;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  802  	}
6a8c3be7ec8eb3 Alan Tull          2015-10-07  803  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  804  	mgr =3D kzalloc(sizeof(=
*mgr), GFP_KERNEL);
6a8c3be7ec8eb3 Alan Tull          2015-10-07  805  	if (!mgr)
7085e2a94f7df5 Alan Tull          2018-05-16  806  		return NULL;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  807  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  808  	id =3D ida_simple_get(&=
fpga_mgr_ida, 0, 0, GFP_KERNEL);
6a8c3be7ec8eb3 Alan Tull          2015-10-07  809  	if (id < 0) {
6a8c3be7ec8eb3 Alan Tull          2015-10-07  810  		ret =3D id;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  811  		goto error_kfree;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  812  	}
6a8c3be7ec8eb3 Alan Tull          2015-10-07  813  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  814  	mutex_init(&mgr->ref_mu=
tex);
6a8c3be7ec8eb3 Alan Tull          2015-10-07  815  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  816  	mgr->name =3D name;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  817  	mgr->mops =3D mops;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  818  	mgr->priv =3D priv;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  819  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  820  	device_initialize(&mgr-=
>dev);
6a8c3be7ec8eb3 Alan Tull          2015-10-07  821  	mgr->dev.class =3D fpga=
_mgr_class;
845089bbf589be Alan Tull          2017-11-15  822  	mgr->dev.groups =3D mop=
s->groups;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  823  	mgr->dev.parent =3D dev;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  824  	mgr->dev.of_node =3D de=
v->of_node;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  825  	mgr->dev.id =3D id;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  826  =

ed71785e2c3c34 Nava kishore Manne 2020-01-21  827  	/* Make device dma capa=
ble by inheriting from parent's */
ed71785e2c3c34 Nava kishore Manne 2020-01-21 @828  	set_dma_ops(&mgr->dev, =
get_dma_ops(dev));
ed71785e2c3c34 Nava kishore Manne 2020-01-21  829  	ret =3D dma_coerce_mask=
_and_coherent(&mgr->dev, dma_get_mask(dev));
ed71785e2c3c34 Nava kishore Manne 2020-01-21  830  	if (ret) {
ed71785e2c3c34 Nava kishore Manne 2020-01-21  831  		dev_warn(dev,
ed71785e2c3c34 Nava kishore Manne 2020-01-21  832  		"Failed to set DMA mas=
k %llx. Trying to continue... %x\n",
ed71785e2c3c34 Nava kishore Manne 2020-01-21  833  		dma_get_mask(dev), ret=
);
ed71785e2c3c34 Nava kishore Manne 2020-01-21  834  	}
ed71785e2c3c34 Nava kishore Manne 2020-01-21  835  =

6a8c3be7ec8eb3 Alan Tull          2015-10-07  836  	ret =3D dev_set_name(&m=
gr->dev, "fpga%d", id);
07687c031d14a1 Alan Tull          2015-10-29  837  	if (ret)
07687c031d14a1 Alan Tull          2015-10-29  838  		goto error_device;
6a8c3be7ec8eb3 Alan Tull          2015-10-07  839  =

ed71785e2c3c34 Nava kishore Manne 2020-01-21  840  	mgr->miscdev.minor =3D =
MISC_DYNAMIC_MINOR;
ed71785e2c3c34 Nava kishore Manne 2020-01-21  841  	mgr->miscdev.name =3D k=
object_name(&mgr->dev.kobj);
ed71785e2c3c34 Nava kishore Manne 2020-01-21  842  	mgr->miscdev.fops =3D &=
fpga_fops;
ed71785e2c3c34 Nava kishore Manne 2020-01-21  843  	ret =3D misc_register(&=
mgr->miscdev);
ed71785e2c3c34 Nava kishore Manne 2020-01-21  844  	if (ret) {
ed71785e2c3c34 Nava kishore Manne 2020-01-21  845  		pr_err("fpga: failed t=
o register misc device.\n");
ed71785e2c3c34 Nava kishore Manne 2020-01-21  846  		goto error_device;
ed71785e2c3c34 Nava kishore Manne 2020-01-21  847  	}
ed71785e2c3c34 Nava kishore Manne 2020-01-21  848  =

7085e2a94f7df5 Alan Tull          2018-05-16  849  	return mgr;
7085e2a94f7df5 Alan Tull          2018-05-16  850  =

7085e2a94f7df5 Alan Tull          2018-05-16  851  error_device:
7085e2a94f7df5 Alan Tull          2018-05-16  852  	ida_simple_remove(&fpga=
_mgr_ida, id);
7085e2a94f7df5 Alan Tull          2018-05-16  853  error_kfree:
7085e2a94f7df5 Alan Tull          2018-05-16  854  	kfree(mgr);
7085e2a94f7df5 Alan Tull          2018-05-16  855  =

7085e2a94f7df5 Alan Tull          2018-05-16  856  	return NULL;
7085e2a94f7df5 Alan Tull          2018-05-16  857  }
7085e2a94f7df5 Alan Tull          2018-05-16  858  EXPORT_SYMBOL_GPL(fpga_m=
gr_create);
7085e2a94f7df5 Alan Tull          2018-05-16  859  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6887271647023958452==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6887271647023958452==--

