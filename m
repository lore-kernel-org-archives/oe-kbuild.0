Content-Type: multipart/mixed; boundary="===============4672276714980289461=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 21/28] cxl/region: Enable the assignment of endpoint decoders to regions
Date: Sun, 17 Jul 2022 03:55:05 +0800
Message-ID: <202207170330.t0wEfL2u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4672276714980289461==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <165784336184.1758207.16403282029203949622.stgit@dwillia2-xf=
h.jf.intel.com>
References: <165784336184.1758207.16403282029203949622.stgit@dwillia2-xfh=
.jf.intel.com>
TO: Dan Williams <dan.j.williams@intel.com>

Hi Dan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on b060edfd8cdd52bc8648392500bf152a8dd6d4c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/CXL-PME=
M-Region-Provisioning/20220715-080748
base:   b060edfd8cdd52bc8648392500bf152a8dd6d4c5
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
717/202207170330.t0wEfL2u-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/hdm.c:342 cxl_dpa_free() error: uninitialized symbol 'rc'.
drivers/cxl/core/hdm.c:459 cxl_dpa_alloc() error: uninitialized symbol 'rc'.

vim +/rc +342 drivers/cxl/core/hdm.c

5ccc075e8e0da0 Dan Williams 2022-07-14  310  =

5ccc075e8e0da0 Dan Williams 2022-07-14  311  int cxl_dpa_free(struct cxl_en=
dpoint_decoder *cxled)
5ccc075e8e0da0 Dan Williams 2022-07-14  312  {
5ccc075e8e0da0 Dan Williams 2022-07-14  313  	struct cxl_port *port =3D cxl=
ed_to_port(cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  314  	struct device *dev =3D &cxled=
->cxld.dev;
5ccc075e8e0da0 Dan Williams 2022-07-14  315  	int rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  316  =

5ccc075e8e0da0 Dan Williams 2022-07-14  317  	down_write(&cxl_dpa_rwsem);
5ccc075e8e0da0 Dan Williams 2022-07-14  318  	if (!cxled->dpa_res) {
5ccc075e8e0da0 Dan Williams 2022-07-14  319  		rc =3D 0;
5ccc075e8e0da0 Dan Williams 2022-07-14  320  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  321  	}
e8f8f1fa762fad Dan Williams 2022-07-14  322  	if (cxled->cxld.region) {
e8f8f1fa762fad Dan Williams 2022-07-14  323  		dev_dbg(dev, "decoder assign=
ed to: %s\n",
e8f8f1fa762fad Dan Williams 2022-07-14  324  			dev_name(&cxled->cxld.regio=
n->dev));
e8f8f1fa762fad Dan Williams 2022-07-14  325  		goto out;
e8f8f1fa762fad Dan Williams 2022-07-14  326  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  327  	if (cxled->cxld.flags & CXL_D=
ECODER_F_ENABLE) {
5ccc075e8e0da0 Dan Williams 2022-07-14  328  		dev_dbg(dev, "decoder enable=
d\n");
5ccc075e8e0da0 Dan Williams 2022-07-14  329  		rc =3D -EBUSY;
5ccc075e8e0da0 Dan Williams 2022-07-14  330  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  331  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  332  	if (cxled->cxld.id !=3D port-=
>hdm_end) {
5ccc075e8e0da0 Dan Williams 2022-07-14  333  		dev_dbg(dev, "expected decod=
er%d.%d\n", port->id,
5ccc075e8e0da0 Dan Williams 2022-07-14  334  			port->hdm_end);
5ccc075e8e0da0 Dan Williams 2022-07-14  335  		rc =3D -EBUSY;
5ccc075e8e0da0 Dan Williams 2022-07-14  336  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  337  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  338  	devm_cxl_dpa_release(cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  339  	rc =3D 0;
5ccc075e8e0da0 Dan Williams 2022-07-14  340  out:
5ccc075e8e0da0 Dan Williams 2022-07-14  341  	up_write(&cxl_dpa_rwsem);
5ccc075e8e0da0 Dan Williams 2022-07-14 @342  	return rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  343  }
5ccc075e8e0da0 Dan Williams 2022-07-14  344  =

5ccc075e8e0da0 Dan Williams 2022-07-14  345  int cxl_dpa_set_mode(struct cx=
l_endpoint_decoder *cxled,
5ccc075e8e0da0 Dan Williams 2022-07-14  346  		     enum cxl_decoder_mode m=
ode)
5ccc075e8e0da0 Dan Williams 2022-07-14  347  {
5ccc075e8e0da0 Dan Williams 2022-07-14  348  	struct cxl_memdev *cxlmd =3D =
cxled_to_memdev(cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  349  	struct cxl_dev_state *cxlds =
=3D cxlmd->cxlds;
5ccc075e8e0da0 Dan Williams 2022-07-14  350  	struct device *dev =3D &cxled=
->cxld.dev;
5ccc075e8e0da0 Dan Williams 2022-07-14  351  	int rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  352  =

5ccc075e8e0da0 Dan Williams 2022-07-14  353  	switch (mode) {
5ccc075e8e0da0 Dan Williams 2022-07-14  354  	case CXL_DECODER_RAM:
5ccc075e8e0da0 Dan Williams 2022-07-14  355  	case CXL_DECODER_PMEM:
5ccc075e8e0da0 Dan Williams 2022-07-14  356  		break;
5ccc075e8e0da0 Dan Williams 2022-07-14  357  	default:
5ccc075e8e0da0 Dan Williams 2022-07-14  358  		dev_dbg(dev, "unsupported mo=
de: %d\n", mode);
5ccc075e8e0da0 Dan Williams 2022-07-14  359  		return -EINVAL;
5ccc075e8e0da0 Dan Williams 2022-07-14  360  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  361  =

5ccc075e8e0da0 Dan Williams 2022-07-14  362  	down_write(&cxl_dpa_rwsem);
5ccc075e8e0da0 Dan Williams 2022-07-14  363  	if (cxled->cxld.flags & CXL_D=
ECODER_F_ENABLE) {
5ccc075e8e0da0 Dan Williams 2022-07-14  364  		rc =3D -EBUSY;
5ccc075e8e0da0 Dan Williams 2022-07-14  365  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  366  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  367  =

5ccc075e8e0da0 Dan Williams 2022-07-14  368  	/*
5ccc075e8e0da0 Dan Williams 2022-07-14  369  	 * Only allow modes that are =
supported by the current partition
5ccc075e8e0da0 Dan Williams 2022-07-14  370  	 * configuration
5ccc075e8e0da0 Dan Williams 2022-07-14  371  	 */
5ccc075e8e0da0 Dan Williams 2022-07-14  372  	if (mode =3D=3D CXL_DECODER_P=
MEM && !resource_size(&cxlds->pmem_res)) {
5ccc075e8e0da0 Dan Williams 2022-07-14  373  		dev_dbg(dev, "no available p=
mem capacity\n");
5ccc075e8e0da0 Dan Williams 2022-07-14  374  		rc =3D -ENXIO;
5ccc075e8e0da0 Dan Williams 2022-07-14  375  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  376  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  377  	if (mode =3D=3D CXL_DECODER_R=
AM && !resource_size(&cxlds->ram_res)) {
5ccc075e8e0da0 Dan Williams 2022-07-14  378  		dev_dbg(dev, "no available r=
am capacity\n");
5ccc075e8e0da0 Dan Williams 2022-07-14  379  		rc =3D -ENXIO;
5ccc075e8e0da0 Dan Williams 2022-07-14  380  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  381  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  382  =

5ccc075e8e0da0 Dan Williams 2022-07-14  383  	cxled->mode =3D mode;
5ccc075e8e0da0 Dan Williams 2022-07-14  384  	rc =3D 0;
5ccc075e8e0da0 Dan Williams 2022-07-14  385  out:
5ccc075e8e0da0 Dan Williams 2022-07-14  386  	up_write(&cxl_dpa_rwsem);
5ccc075e8e0da0 Dan Williams 2022-07-14  387  =

5ccc075e8e0da0 Dan Williams 2022-07-14  388  	return rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  389  }
5ccc075e8e0da0 Dan Williams 2022-07-14  390  =

5ccc075e8e0da0 Dan Williams 2022-07-14  391  int cxl_dpa_alloc(struct cxl_e=
ndpoint_decoder *cxled, unsigned long long size)
5ccc075e8e0da0 Dan Williams 2022-07-14  392  {
5ccc075e8e0da0 Dan Williams 2022-07-14  393  	struct cxl_memdev *cxlmd =3D =
cxled_to_memdev(cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  394  	resource_size_t free_ram_star=
t, free_pmem_start;
5ccc075e8e0da0 Dan Williams 2022-07-14  395  	struct cxl_port *port =3D cxl=
ed_to_port(cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  396  	struct cxl_dev_state *cxlds =
=3D cxlmd->cxlds;
5ccc075e8e0da0 Dan Williams 2022-07-14  397  	struct device *dev =3D &cxled=
->cxld.dev;
5ccc075e8e0da0 Dan Williams 2022-07-14  398  	resource_size_t start, avail,=
 skip;
5ccc075e8e0da0 Dan Williams 2022-07-14  399  	struct resource *p, *last;
5ccc075e8e0da0 Dan Williams 2022-07-14  400  	int rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  401  =

5ccc075e8e0da0 Dan Williams 2022-07-14  402  	down_write(&cxl_dpa_rwsem);
e8f8f1fa762fad Dan Williams 2022-07-14  403  	if (cxled->cxld.region) {
e8f8f1fa762fad Dan Williams 2022-07-14  404  		dev_dbg(dev, "decoder attach=
ed to %s\n",
e8f8f1fa762fad Dan Williams 2022-07-14  405  			dev_name(&cxled->cxld.regio=
n->dev));
e8f8f1fa762fad Dan Williams 2022-07-14  406  		goto out;
e8f8f1fa762fad Dan Williams 2022-07-14  407  	}
e8f8f1fa762fad Dan Williams 2022-07-14  408  =

5ccc075e8e0da0 Dan Williams 2022-07-14  409  	if (cxled->cxld.flags & CXL_D=
ECODER_F_ENABLE) {
5ccc075e8e0da0 Dan Williams 2022-07-14  410  		dev_dbg(dev, "decoder enable=
d\n");
5ccc075e8e0da0 Dan Williams 2022-07-14  411  		rc =3D -EBUSY;
5ccc075e8e0da0 Dan Williams 2022-07-14  412  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  413  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  414  =

5ccc075e8e0da0 Dan Williams 2022-07-14  415  	for (p =3D cxlds->ram_res.chi=
ld, last =3D NULL; p; p =3D p->sibling)
5ccc075e8e0da0 Dan Williams 2022-07-14  416  		last =3D p;
5ccc075e8e0da0 Dan Williams 2022-07-14  417  	if (last)
5ccc075e8e0da0 Dan Williams 2022-07-14  418  		free_ram_start =3D last->end=
 + 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  419  	else
5ccc075e8e0da0 Dan Williams 2022-07-14  420  		free_ram_start =3D cxlds->ra=
m_res.start;
5ccc075e8e0da0 Dan Williams 2022-07-14  421  =

5ccc075e8e0da0 Dan Williams 2022-07-14  422  	for (p =3D cxlds->pmem_res.ch=
ild, last =3D NULL; p; p =3D p->sibling)
5ccc075e8e0da0 Dan Williams 2022-07-14  423  		last =3D p;
5ccc075e8e0da0 Dan Williams 2022-07-14  424  	if (last)
5ccc075e8e0da0 Dan Williams 2022-07-14  425  		free_pmem_start =3D last->en=
d + 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  426  	else
5ccc075e8e0da0 Dan Williams 2022-07-14  427  		free_pmem_start =3D cxlds->p=
mem_res.start;
5ccc075e8e0da0 Dan Williams 2022-07-14  428  =

5ccc075e8e0da0 Dan Williams 2022-07-14  429  	if (cxled->mode =3D=3D CXL_DE=
CODER_RAM) {
5ccc075e8e0da0 Dan Williams 2022-07-14  430  		start =3D free_ram_start;
5ccc075e8e0da0 Dan Williams 2022-07-14  431  		avail =3D cxlds->ram_res.end=
 - start + 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  432  		skip =3D 0;
5ccc075e8e0da0 Dan Williams 2022-07-14  433  	} else if (cxled->mode =3D=3D=
 CXL_DECODER_PMEM) {
5ccc075e8e0da0 Dan Williams 2022-07-14  434  		resource_size_t skip_start, =
skip_end;
5ccc075e8e0da0 Dan Williams 2022-07-14  435  =

5ccc075e8e0da0 Dan Williams 2022-07-14  436  		start =3D free_pmem_start;
5ccc075e8e0da0 Dan Williams 2022-07-14  437  		avail =3D cxlds->pmem_res.en=
d - start + 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  438  		skip_start =3D free_ram_star=
t;
5ccc075e8e0da0 Dan Williams 2022-07-14  439  		skip_end =3D start - 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  440  		skip =3D skip_end - skip_sta=
rt + 1;
5ccc075e8e0da0 Dan Williams 2022-07-14  441  	} else {
5ccc075e8e0da0 Dan Williams 2022-07-14  442  		dev_dbg(dev, "mode not set\n=
");
5ccc075e8e0da0 Dan Williams 2022-07-14  443  		rc =3D -EINVAL;
5ccc075e8e0da0 Dan Williams 2022-07-14  444  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  445  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  446  =

5ccc075e8e0da0 Dan Williams 2022-07-14  447  	if (size > avail) {
5ccc075e8e0da0 Dan Williams 2022-07-14  448  		dev_dbg(dev, "%pa exceeds av=
ailable %s capacity: %pa\n", &size,
5ccc075e8e0da0 Dan Williams 2022-07-14  449  			cxled->mode =3D=3D CXL_DECO=
DER_RAM ? "ram" : "pmem",
5ccc075e8e0da0 Dan Williams 2022-07-14  450  			&avail);
5ccc075e8e0da0 Dan Williams 2022-07-14  451  		rc =3D -ENOSPC;
5ccc075e8e0da0 Dan Williams 2022-07-14  452  		goto out;
5ccc075e8e0da0 Dan Williams 2022-07-14  453  	}
5ccc075e8e0da0 Dan Williams 2022-07-14  454  =

5ccc075e8e0da0 Dan Williams 2022-07-14  455  	rc =3D __cxl_dpa_reserve(cxle=
d, start, size, skip);
5ccc075e8e0da0 Dan Williams 2022-07-14  456  out:
5ccc075e8e0da0 Dan Williams 2022-07-14  457  	up_write(&cxl_dpa_rwsem);
5ccc075e8e0da0 Dan Williams 2022-07-14  458  =

5ccc075e8e0da0 Dan Williams 2022-07-14 @459  	if (rc)
5ccc075e8e0da0 Dan Williams 2022-07-14  460  		return rc;
5ccc075e8e0da0 Dan Williams 2022-07-14  461  =

5ccc075e8e0da0 Dan Williams 2022-07-14  462  	return devm_add_action_or_res=
et(&port->dev, cxl_dpa_release, cxled);
5ccc075e8e0da0 Dan Williams 2022-07-14  463  }
5ccc075e8e0da0 Dan Williams 2022-07-14  464  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4672276714980289461==--

