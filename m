Content-Type: multipart/mixed; boundary="===============8060615562442636229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 48/67] drivers/cxl/core/pci.c:302 __cxl_hdm_decode_init() warn: ignoring unreachable code.
Date: Fri, 13 May 2022 01:59:52 +0800
Message-ID: <202205130114.DpEOzjJn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8060615562442636229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Alison Schofield <alison.schofield@intel.com>
CC: Vishal Verma <vishal.l.verma@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: linux-kernel(a)vger.kernel.org
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   9c642abd8b31d895f34186bd72b7360083b58492
commit: 2263e9ed65887cc7c6e977f372596199d2c9f4af [48/67] cxl/port: Enable H=
DM Capability after validating DVSEC Ranges
:::::: branch date: 12 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-m001-20220509 (https://download.01.org/0day-ci/ar=
chive/20220513/202205130114.DpEOzjJn-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/pci.c:302 __cxl_hdm_decode_init() warn: ignoring unreachab=
le code.

vim +302 drivers/cxl/core/pci.c

2263e9ed65887c Dan Williams 2022-05-10  269  =

18e7a07f5d584d Dan Williams 2022-05-01  270  static bool __cxl_hdm_decode_i=
nit(struct cxl_dev_state *cxlds,
9382da4f1fd2c2 Dan Williams 2022-05-09  271  				  struct cxl_hdm *cxlhdm,
18e7a07f5d584d Dan Williams 2022-05-01  272  				  struct cxl_endpoint_dvse=
c_info *info)
18e7a07f5d584d Dan Williams 2022-05-01  273  {
9382da4f1fd2c2 Dan Williams 2022-05-09  274  	void __iomem *hdm =3D cxlhdm-=
>regs.hdm_decoder;
2263e9ed65887c Dan Williams 2022-05-10  275  	struct cxl_port *port =3D cxl=
hdm->port;
2263e9ed65887c Dan Williams 2022-05-10  276  	struct device *dev =3D cxlds-=
>dev;
2263e9ed65887c Dan Williams 2022-05-10  277  	struct cxl_port *root;
18e7a07f5d584d Dan Williams 2022-05-01  278  	u32 global_ctrl;
2263e9ed65887c Dan Williams 2022-05-10  279  	int i, rc;
18e7a07f5d584d Dan Williams 2022-05-01  280  =

9382da4f1fd2c2 Dan Williams 2022-05-09  281  	global_ctrl =3D readl(hdm + C=
XL_HDM_DECODER_CTRL_OFFSET);
18e7a07f5d584d Dan Williams 2022-05-01  282  =

2263e9ed65887c Dan Williams 2022-05-10  283  	/*
2263e9ed65887c Dan Williams 2022-05-10  284  	 * If the HDM Decoder Capabil=
ity is already enabled then assume
2263e9ed65887c Dan Williams 2022-05-10  285  	 * that some other agent like=
 platform firmware set it up.
2263e9ed65887c Dan Williams 2022-05-10  286  	 */
2263e9ed65887c Dan Williams 2022-05-10  287  	if (global_ctrl & CXL_HDM_DEC=
ODER_ENABLE) {
2263e9ed65887c Dan Williams 2022-05-10  288  		rc =3D devm_cxl_enable_mem(&=
port->dev, cxlds);
2263e9ed65887c Dan Williams 2022-05-10  289  		if (rc)
9382da4f1fd2c2 Dan Williams 2022-05-09  290  			return false;
2263e9ed65887c Dan Williams 2022-05-10  291  		return true;
2263e9ed65887c Dan Williams 2022-05-10  292  	}
2263e9ed65887c Dan Williams 2022-05-10  293  =

2263e9ed65887c Dan Williams 2022-05-10  294  	root =3D to_cxl_port(port->de=
v.parent);
2263e9ed65887c Dan Williams 2022-05-10  295  	while (!is_cxl_root(root) && =
is_cxl_port(root->dev.parent))
2263e9ed65887c Dan Williams 2022-05-10  296  		root =3D to_cxl_port(root->d=
ev.parent);
2263e9ed65887c Dan Williams 2022-05-10  297  	if (!is_cxl_root(root)) {
2263e9ed65887c Dan Williams 2022-05-10  298  		dev_err(dev, "Failed to acqu=
ire root port for HDM enable\n");
2263e9ed65887c Dan Williams 2022-05-10  299  		return false;
2263e9ed65887c Dan Williams 2022-05-10  300  	}
2263e9ed65887c Dan Williams 2022-05-10  301  =

2263e9ed65887c Dan Williams 2022-05-10 @302  	for (i =3D 0; i < info->range=
s; i++) {
2263e9ed65887c Dan Williams 2022-05-10  303  		struct device *cxld_dev;
2263e9ed65887c Dan Williams 2022-05-10  304  =

2263e9ed65887c Dan Williams 2022-05-10  305  		if (!info->mem_enabled)
2263e9ed65887c Dan Williams 2022-05-10  306  			break;
2263e9ed65887c Dan Williams 2022-05-10  307  =

2263e9ed65887c Dan Williams 2022-05-10  308  		cxld_dev =3D device_find_chi=
ld(&root->dev, &info->dvsec_range[i],
2263e9ed65887c Dan Williams 2022-05-10  309  					     dvsec_range_allowed);
2263e9ed65887c Dan Williams 2022-05-10  310  		if (!cxld_dev) {
2263e9ed65887c Dan Williams 2022-05-10  311  			dev_dbg(dev, "Range%d disal=
lowed by platform\n", i);
2263e9ed65887c Dan Williams 2022-05-10  312  			cxl_set_mem_enable(cxlds, 0=
);
2263e9ed65887c Dan Williams 2022-05-10  313  			info->mem_enabled =3D 0;
2263e9ed65887c Dan Williams 2022-05-10  314  			break;
2263e9ed65887c Dan Williams 2022-05-10  315  		}
2263e9ed65887c Dan Williams 2022-05-10  316  		put_device(cxld_dev);
2263e9ed65887c Dan Williams 2022-05-10  317  		break;
2263e9ed65887c Dan Williams 2022-05-10  318  	}
2263e9ed65887c Dan Williams 2022-05-10  319  	put_device(&root->dev);
18e7a07f5d584d Dan Williams 2022-05-01  320  =

87aafd75cc537f Dan Williams 2022-04-30  321  	/*
2263e9ed65887c Dan Williams 2022-05-10  322  	 * At least one DVSEC range i=
s enabled and allowed, skip HDM
2263e9ed65887c Dan Williams 2022-05-10  323  	 * Decoder Capability Enable
87aafd75cc537f Dan Williams 2022-04-30  324  	 */
2263e9ed65887c Dan Williams 2022-05-10  325  	if (info->mem_enabled)
2263e9ed65887c Dan Williams 2022-05-10  326  		return false;
2263e9ed65887c Dan Williams 2022-05-10  327  =

2263e9ed65887c Dan Williams 2022-05-10  328  	rc =3D devm_cxl_enable_hdm(&p=
ort->dev, cxlhdm);
2263e9ed65887c Dan Williams 2022-05-10  329  	if (rc)
2263e9ed65887c Dan Williams 2022-05-10  330  		return false;
2263e9ed65887c Dan Williams 2022-05-10  331  =

2263e9ed65887c Dan Williams 2022-05-10  332  	rc =3D devm_cxl_enable_mem(&p=
ort->dev, cxlds);
2263e9ed65887c Dan Williams 2022-05-10  333  	if (rc)
2263e9ed65887c Dan Williams 2022-05-10  334  		return false;
18e7a07f5d584d Dan Williams 2022-05-01  335  =

9382da4f1fd2c2 Dan Williams 2022-05-09  336  	return true;
18e7a07f5d584d Dan Williams 2022-05-01  337  }
18e7a07f5d584d Dan Williams 2022-05-01  338  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8060615562442636229==--

