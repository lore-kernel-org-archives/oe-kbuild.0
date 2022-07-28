Content-Type: multipart/mixed; boundary="===============8119695813335976571=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9805/13276] drivers/interconnect/imx/imx.c:45:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Thu, 28 Jul 2022 18:25:25 +0800
Message-ID: <202207281809.5KW3F7St-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8119695813335976571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/i=
nterconnect/imx/imx.c:45:13: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Peng Fan <peng.fan@nxp.com>
CC: Georgi Djakov <djakov@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
commit: 7980d85a9443029c39a9d131c13732258e44a8de [9805/13276] interconnect:=
 imx: configure NoC mode/prioriry/ext_control
:::::: branch date: 22 hours ago
:::::: commit date: 13 days ago
config: arm-randconfig-c002-20220727 (https://download.01.org/0day-ci/archi=
ve/20220728/202207281809.5KW3F7St-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D7980d85a9443029c39a9d131c13732258e44a8de
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 7980d85a9443029c39a9d131c13732258e44a8de
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/interconnect/imx/imx.c: In function 'imx_icc_node_set':
>> drivers/interconnect/imx/imx.c:45:13: warning: use of uninitialized valu=
e '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      45 |         u64 freq;
         |             ^~~~
     'imx_icc_set': events 1-2
       |
       |   87 | static int imx_icc_set(struct icc_node *src, struct icc_nod=
e *dst)
       |      |            ^~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'imx_icc_set'
       |......
       |   91 |         ret =3D imx_icc_node_set(src);
       |      |               ~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (2) calling 'imx_icc_node_set' from 'imx_icc_=
set'
       |
       +--> 'imx_icc_node_set': events 3-4
              |
              |   39 | static int imx_icc_node_set(struct icc_node *node)
              |      |            ^~~~~~~~~~~~~~~~
              |      |            |
              |      |            (3) entry to 'imx_icc_node_set'
              |......
              |   45 |         u64 freq;
              |      |             ~~~~
              |      |             |
              |      |             (4) use of uninitialized value '<unknown=
>' here
              |

vim +45 drivers/interconnect/imx/imx.c

9d6c7ee7c4bb21 Abel Vesa       2022-01-06  38  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  39  static int imx_icc_node_set(=
struct icc_node *node)
f0d8048525d7d8 Leonard Crestez 2020-04-28  40  {
f0d8048525d7d8 Leonard Crestez 2020-04-28  41  	struct device *dev =3D node=
->provider->dev;
f0d8048525d7d8 Leonard Crestez 2020-04-28  42  	struct imx_icc_node *node_d=
ata =3D node->data;
7980d85a944302 Peng Fan        2022-07-03  43  	void __iomem *base;
7980d85a944302 Peng Fan        2022-07-03  44  	u32 prio;
f0d8048525d7d8 Leonard Crestez 2020-04-28 @45  	u64 freq;
f0d8048525d7d8 Leonard Crestez 2020-04-28  46  =

7980d85a944302 Peng Fan        2022-07-03  47  	if (node_data->setting && n=
ode->peak_bw) {
7980d85a944302 Peng Fan        2022-07-03  48  		base =3D node_data->settin=
g->reg + node_data->imx_provider->noc_base;
7980d85a944302 Peng Fan        2022-07-03  49  		if (node_data->setting->mo=
de =3D=3D IMX_NOC_MODE_FIXED) {
7980d85a944302 Peng Fan        2022-07-03  50  			prio =3D node_data->setti=
ng->prio_level;
7980d85a944302 Peng Fan        2022-07-03  51  			prio =3D PRIORITY_COMP_MA=
RK | (prio << 8) | prio;
7980d85a944302 Peng Fan        2022-07-03  52  			writel(prio, base + IMX_N=
OC_PRIO_REG);
7980d85a944302 Peng Fan        2022-07-03  53  			writel(node_data->setting=
->mode, base + IMX_NOC_MODE_REG);
7980d85a944302 Peng Fan        2022-07-03  54  			writel(node_data->setting=
->ext_control, base + IMX_NOC_EXT_CTL_REG);
7980d85a944302 Peng Fan        2022-07-03  55  			dev_dbg(dev, "%s: mode: 0=
x%x, prio: 0x%x, ext_control: 0x%x\n",
7980d85a944302 Peng Fan        2022-07-03  56  				node_data->desc->name, n=
ode_data->setting->mode, prio,
7980d85a944302 Peng Fan        2022-07-03  57  				node_data->setting->ext_=
control);
7980d85a944302 Peng Fan        2022-07-03  58  		} else if (node_data->sett=
ing->mode =3D=3D IMX_NOC_MODE_UNCONFIGURED) {
7980d85a944302 Peng Fan        2022-07-03  59  			dev_dbg(dev, "%s: mode no=
t unconfigured\n", node_data->desc->name);
7980d85a944302 Peng Fan        2022-07-03  60  		} else {
7980d85a944302 Peng Fan        2022-07-03  61  			dev_info(dev, "%s: mode: =
%d not supported\n",
7980d85a944302 Peng Fan        2022-07-03  62  				 node_data->desc->name, =
node_data->setting->mode);
7980d85a944302 Peng Fan        2022-07-03  63  			return -EOPNOTSUPP;
7980d85a944302 Peng Fan        2022-07-03  64  		}
7980d85a944302 Peng Fan        2022-07-03  65  	}
7980d85a944302 Peng Fan        2022-07-03  66  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  67  	if (!node_data->qos_dev)
f0d8048525d7d8 Leonard Crestez 2020-04-28  68  		return 0;
f0d8048525d7d8 Leonard Crestez 2020-04-28  69  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  70  	freq =3D (node->avg_bw + no=
de->peak_bw) * node_data->desc->adj->bw_mul;
f0d8048525d7d8 Leonard Crestez 2020-04-28  71  	do_div(freq, node_data->des=
c->adj->bw_div);
f0d8048525d7d8 Leonard Crestez 2020-04-28  72  	dev_dbg(dev, "node %s devic=
e %s avg_bw %ukBps peak_bw %ukBps min_freq %llukHz\n",
f0d8048525d7d8 Leonard Crestez 2020-04-28  73  		node->name, dev_name(node_=
data->qos_dev),
f0d8048525d7d8 Leonard Crestez 2020-04-28  74  		node->avg_bw, node->peak_b=
w, freq);
f0d8048525d7d8 Leonard Crestez 2020-04-28  75  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  76  	if (freq > S32_MAX) {
f0d8048525d7d8 Leonard Crestez 2020-04-28  77  		dev_err(dev, "%s can't req=
uest more than S32_MAX freq\n",
f0d8048525d7d8 Leonard Crestez 2020-04-28  78  				node->name);
f0d8048525d7d8 Leonard Crestez 2020-04-28  79  		return -ERANGE;
f0d8048525d7d8 Leonard Crestez 2020-04-28  80  	}
f0d8048525d7d8 Leonard Crestez 2020-04-28  81  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  82  	dev_pm_qos_update_request(&=
node_data->qos_req, freq);
f0d8048525d7d8 Leonard Crestez 2020-04-28  83  =

f0d8048525d7d8 Leonard Crestez 2020-04-28  84  	return 0;
f0d8048525d7d8 Leonard Crestez 2020-04-28  85  }
f0d8048525d7d8 Leonard Crestez 2020-04-28  86  =


:::::: The code at line 45 was first introduced by commit
:::::: f0d8048525d7d8618a79550cd70de9ce0a6a496f interconnect: Add imx core =
driver

:::::: TO: Leonard Crestez <leonard.crestez@nxp.com>
:::::: CC: Georgi Djakov <georgi.djakov@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8119695813335976571==--

