Content-Type: multipart/mixed; boundary="===============0730653162634558651=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [asahilinux:bits/120-spmi 3/4] drivers/nvmem/spmi-mfd-nvmem.c:40:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 14 Aug 2022 23:49:27 +0800
Message-ID: <202208142340.YtHpyTAP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0730653162634558651==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
vmem/spmi-mfd-nvmem.c:40:13: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/120-spmi
head:   0324791a3cdc3e93df57f6293e2cfaaadc264aeb
commit: 7d8a1a4c3dddcdaa51aa354bf82074a86640794c [3/4] nvmem: Add spmi-mfd-=
nvmem driver
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: arm-randconfig-c002-20220804 (https://download.01.org/0day-ci/archi=
ve/20220814/202208142340.YtHpyTAP-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/7d8a1a4c3dddcdaa51aa35=
4bf82074a86640794c
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/120-spmi
        git checkout 7d8a1a4c3dddcdaa51aa354bf82074a86640794c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/nvmem/spmi-mfd-nvmem.c: In function 'spmi_mfd_nvmem_probe':
>> drivers/nvmem/spmi-mfd-nvmem.c:40:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      40 |         int len;
         |             ^~~
     'spmi_mfd_nvmem_probe': event 1
       |
       |   40 |         int len;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +40 drivers/nvmem/spmi-mfd-nvmem.c

7d8a1a4c3dddcd Hector Martin 2022-02-15  35  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  36  static int spmi_mfd_nvmem_prob=
e(struct platform_device *pdev)
7d8a1a4c3dddcd Hector Martin 2022-02-15  37  {
7d8a1a4c3dddcd Hector Martin 2022-02-15  38  	struct spmi_mfd_nvmem *nvmem;
7d8a1a4c3dddcd Hector Martin 2022-02-15  39  	const __be32 *addr;
7d8a1a4c3dddcd Hector Martin 2022-02-15 @40  	int len;
7d8a1a4c3dddcd Hector Martin 2022-02-15  41  	struct nvmem_config nvmem_cfg=
 =3D {
7d8a1a4c3dddcd Hector Martin 2022-02-15  42  		.dev =3D &pdev->dev,
7d8a1a4c3dddcd Hector Martin 2022-02-15  43  		.name =3D "spmi_mfd_nvmem",
7d8a1a4c3dddcd Hector Martin 2022-02-15  44  		.id =3D NVMEM_DEVID_AUTO,
7d8a1a4c3dddcd Hector Martin 2022-02-15  45  		.word_size =3D 1,
7d8a1a4c3dddcd Hector Martin 2022-02-15  46  		.stride =3D 1,
7d8a1a4c3dddcd Hector Martin 2022-02-15  47  		.reg_read =3D spmi_mfd_nvmem=
_read,
7d8a1a4c3dddcd Hector Martin 2022-02-15  48  		.reg_write =3D spmi_mfd_nvme=
m_write,
7d8a1a4c3dddcd Hector Martin 2022-02-15  49  	};
7d8a1a4c3dddcd Hector Martin 2022-02-15  50  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  51  	nvmem =3D devm_kzalloc(&pdev-=
>dev, sizeof(*nvmem), GFP_KERNEL);
7d8a1a4c3dddcd Hector Martin 2022-02-15  52  	if (!nvmem)
7d8a1a4c3dddcd Hector Martin 2022-02-15  53  		return -ENOMEM;
7d8a1a4c3dddcd Hector Martin 2022-02-15  54  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  55  	nvmem_cfg.priv =3D nvmem;
7d8a1a4c3dddcd Hector Martin 2022-02-15  56  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  57  	nvmem->regmap =3D dev_get_reg=
map(pdev->dev.parent, NULL);
7d8a1a4c3dddcd Hector Martin 2022-02-15  58  	if (!nvmem->regmap) {
7d8a1a4c3dddcd Hector Martin 2022-02-15  59  		dev_err(&pdev->dev, "Parent =
regmap unavailable.\n");
7d8a1a4c3dddcd Hector Martin 2022-02-15  60  		return -ENXIO;
7d8a1a4c3dddcd Hector Martin 2022-02-15  61  	}
7d8a1a4c3dddcd Hector Martin 2022-02-15  62  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  63  	addr =3D of_get_property(pdev=
->dev.of_node, "reg", &len);
7d8a1a4c3dddcd Hector Martin 2022-02-15  64  	if (!addr) {
7d8a1a4c3dddcd Hector Martin 2022-02-15  65  		dev_err(&pdev->dev, "no reg =
property\n");
7d8a1a4c3dddcd Hector Martin 2022-02-15  66  		return -EINVAL;
7d8a1a4c3dddcd Hector Martin 2022-02-15  67  	}
7d8a1a4c3dddcd Hector Martin 2022-02-15  68  	if (len !=3D 2 * sizeof(u32))=
 {
7d8a1a4c3dddcd Hector Martin 2022-02-15  69  		dev_err(&pdev->dev, "invalid=
 reg property\n");
7d8a1a4c3dddcd Hector Martin 2022-02-15  70  		return -EINVAL;
7d8a1a4c3dddcd Hector Martin 2022-02-15  71  	}
7d8a1a4c3dddcd Hector Martin 2022-02-15  72  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  73  	nvmem->base =3D be32_to_cpup(=
&addr[0]);
7d8a1a4c3dddcd Hector Martin 2022-02-15  74  	nvmem_cfg.size =3D be32_to_cp=
up(&addr[1]);
7d8a1a4c3dddcd Hector Martin 2022-02-15  75  =

7d8a1a4c3dddcd Hector Martin 2022-02-15  76  	return PTR_ERR_OR_ZERO(devm_n=
vmem_register(&pdev->dev, &nvmem_cfg));
7d8a1a4c3dddcd Hector Martin 2022-02-15  77  }
7d8a1a4c3dddcd Hector Martin 2022-02-15  78  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0730653162634558651==--

