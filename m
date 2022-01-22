Content-Type: multipart/mixed; boundary="===============8552907185437940952=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 35/53] drivers/cxl/core/hdm.c:100:28: sparse: sparse: duplicate [noderef]
Date: Sat, 22 Jan 2022 23:25:56 +0800
Message-ID: <202201222308.W2DGbf9w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8552907185437940952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   e675fabdbbcdb6e32dba688a20fb0bd42e0e2d5d
commit: 47810cb0a1d64b0b7d06e7856981a0afcbe25a0a [35/53] cxl/core/hdm: Add =
CXL standard decoder enumeration to the core
:::::: branch date: 13 hours ago
:::::: commit date: 16 hours ago
config: powerpc-randconfig-s031-20220119 (https://download.01.org/0day-ci/a=
rchive/20220122/202201222308.W2DGbf9w-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commi=
t/?id=3D47810cb0a1d64b0b7d06e7856981a0afcbe25a0a
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/=
cxl/cxl.git
        git fetch --no-tags cxl preview
        git checkout 47810cb0a1d64b0b7d06e7856981a0afcbe25a0a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/cxl/core/hdm.c:100:28: sparse: sparse: duplicate [noderef]
>> drivers/cxl/core/hdm.c:100:28: sparse: sparse: multiple address spaces g=
iven: __iomem & __iomem

vim +100 drivers/cxl/core/hdm.c

47810cb0a1d64b Dan Williams 2022-01-19   93  =

47810cb0a1d64b Dan Williams 2022-01-19   94  /**
47810cb0a1d64b Dan Williams 2022-01-19   95   * devm_cxl_setup_hdm - map HD=
M decoder component registers
47810cb0a1d64b Dan Williams 2022-01-19   96   * @port: cxl_port to map
47810cb0a1d64b Dan Williams 2022-01-19   97   */
47810cb0a1d64b Dan Williams 2022-01-19   98  struct cxl_hdm *devm_cxl_setup=
_hdm(struct device *host, struct cxl_port *port)
47810cb0a1d64b Dan Williams 2022-01-19   99  {
47810cb0a1d64b Dan Williams 2022-01-19 @100  	void __iomem *crb, __iomem *h=
dm;
47810cb0a1d64b Dan Williams 2022-01-19  101  	struct device *dev =3D &port-=
>dev;
47810cb0a1d64b Dan Williams 2022-01-19  102  	struct cxl_hdm *cxlhdm;
47810cb0a1d64b Dan Williams 2022-01-19  103  =

47810cb0a1d64b Dan Williams 2022-01-19  104  	cxlhdm =3D devm_kzalloc(host,=
 sizeof(*cxlhdm), GFP_KERNEL);
47810cb0a1d64b Dan Williams 2022-01-19  105  	if (!cxlhdm)
47810cb0a1d64b Dan Williams 2022-01-19  106  		return ERR_PTR(-ENOMEM);
47810cb0a1d64b Dan Williams 2022-01-19  107  =

47810cb0a1d64b Dan Williams 2022-01-19  108  	cxlhdm->port =3D port;
47810cb0a1d64b Dan Williams 2022-01-19  109  	crb =3D devm_cxl_iomap_block(=
host, port->component_reg_phys,
47810cb0a1d64b Dan Williams 2022-01-19  110  				   CXL_COMPONENT_REG_BLOCK=
_SIZE);
47810cb0a1d64b Dan Williams 2022-01-19  111  	if (!crb) {
47810cb0a1d64b Dan Williams 2022-01-19  112  		dev_err(dev, "No component r=
egisters mapped\n");
47810cb0a1d64b Dan Williams 2022-01-19  113  		return ERR_PTR(-ENXIO);
47810cb0a1d64b Dan Williams 2022-01-19  114  	}
47810cb0a1d64b Dan Williams 2022-01-19  115  =

47810cb0a1d64b Dan Williams 2022-01-19  116  	hdm =3D map_hdm_decoder_regs(=
port, crb);
47810cb0a1d64b Dan Williams 2022-01-19  117  	if (IS_ERR(hdm))
47810cb0a1d64b Dan Williams 2022-01-19  118  		return ERR_CAST(hdm);
47810cb0a1d64b Dan Williams 2022-01-19  119  	cxlhdm->regs.hdm_decoder =3D =
hdm;
47810cb0a1d64b Dan Williams 2022-01-19  120  =

47810cb0a1d64b Dan Williams 2022-01-19  121  	parse_hdm_decoder_caps(cxlhdm=
);
47810cb0a1d64b Dan Williams 2022-01-19  122  	if (cxlhdm->decoder_count =3D=
=3D 0) {
47810cb0a1d64b Dan Williams 2022-01-19  123  		dev_err(dev, "Spec violation=
. Caps invalid\n");
47810cb0a1d64b Dan Williams 2022-01-19  124  		return ERR_PTR(-ENXIO);
47810cb0a1d64b Dan Williams 2022-01-19  125  	}
47810cb0a1d64b Dan Williams 2022-01-19  126  =

47810cb0a1d64b Dan Williams 2022-01-19  127  	return cxlhdm;
47810cb0a1d64b Dan Williams 2022-01-19  128  }
47810cb0a1d64b Dan Williams 2022-01-19  129  EXPORT_SYMBOL_NS_GPL(devm_cxl_=
setup_hdm, CXL);
47810cb0a1d64b Dan Williams 2022-01-19  130  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8552907185437940952==--

