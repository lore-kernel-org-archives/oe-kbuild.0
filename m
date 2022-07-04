Content-Type: multipart/mixed; boundary="===============4664303902718302010=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 46/51] drivers/cxl/core/region.c:807 cxl_port_setup_targets() error: uninitialized symbol 'peig'.
Date: Tue, 05 Jul 2022 05:20:50 +0800
Message-ID: <202207050524.7pnW87FK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4664303902718302010==
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
TO: Dan Williams <dan.j.williams@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git preview
head:   1985cf58850562e4b960e19d46f0d8f19d6c7cbd
commit: 6736e0edd378fb84365af650a50859e95ea1a29a [46/51] cxl/region: Progra=
m target lists
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021-20220704 (https://download.01.org/0day-ci/arch=
ive/20220705/202207050524.7pnW87FK-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:807 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:807 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:807 cxl_port_setup_targets() error: uninitialized=
 symbol 'eiw'.

Old smatch warnings:
drivers/cxl/core/region.c:281 alloc_hpa() error: uninitialized symbol 'res'.
drivers/cxl/core/region.c:811 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:812 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:1388 create_pmem_region_store() warn: unsigned 'r=
c' is never less than zero.

vim +/peig +807 drivers/cxl/core/region.c

6736e0edd378fb8 Dan Williams 2022-06-06  738  =

6736e0edd378fb8 Dan Williams 2022-06-06  739  static int cxl_port_setup_tar=
gets(struct cxl_port *port,
6736e0edd378fb8 Dan Williams 2022-06-06  740  				  struct cxl_region *cxlr,
6736e0edd378fb8 Dan Williams 2022-06-06  741  				  struct cxl_endpoint_dec=
oder *cxled)
6736e0edd378fb8 Dan Williams 2022-06-06  742  {
6736e0edd378fb8 Dan Williams 2022-06-06  743  	struct cxl_root_decoder *cxl=
rd =3D to_cxl_root_decoder(cxlr->dev.parent);
6736e0edd378fb8 Dan Williams 2022-06-06  744  	int parent_iw, parent_ig, ig=
, iw, rc, inc =3D 0, pos =3D cxled->pos;
6736e0edd378fb8 Dan Williams 2022-06-06  745  	struct cxl_port *parent_port=
 =3D to_cxl_port(port->dev.parent);
6736e0edd378fb8 Dan Williams 2022-06-06  746  	struct cxl_region_ref *cxl_r=
r =3D cxl_rr_load(port, cxlr);
6736e0edd378fb8 Dan Williams 2022-06-06  747  	struct cxl_memdev *cxlmd =3D=
 cxled_to_memdev(cxled);
6736e0edd378fb8 Dan Williams 2022-06-06  748  	struct cxl_ep *ep =3D cxl_ep=
_load(port, cxlmd);
6736e0edd378fb8 Dan Williams 2022-06-06  749  	struct cxl_region_params *p =
=3D &cxlr->params;
6736e0edd378fb8 Dan Williams 2022-06-06  750  	struct cxl_decoder *cxld =3D=
 cxl_rr->decoder;
6736e0edd378fb8 Dan Williams 2022-06-06  751  	struct cxl_switch_decoder *c=
xlsd;
6736e0edd378fb8 Dan Williams 2022-06-06  752  	u16 eig, peig;
6736e0edd378fb8 Dan Williams 2022-06-06  753  	u8 eiw, peiw;
6736e0edd378fb8 Dan Williams 2022-06-06  754  =

6736e0edd378fb8 Dan Williams 2022-06-06  755  	/*
6736e0edd378fb8 Dan Williams 2022-06-06  756  	 * While root level decoders=
 support x3, x6, x12, switch level
6736e0edd378fb8 Dan Williams 2022-06-06  757  	 * decoders only support pow=
ers of 2 up to x16.
6736e0edd378fb8 Dan Williams 2022-06-06  758  	 */
6736e0edd378fb8 Dan Williams 2022-06-06  759  	if (!is_power_of_2(cxl_rr->n=
r_targets)) {
6736e0edd378fb8 Dan Williams 2022-06-06  760  		dev_dbg(&cxlr->dev, "%s:%s:=
 invalid target count %d\n",
6736e0edd378fb8 Dan Williams 2022-06-06  761  			dev_name(port->uport), dev=
_name(&port->dev),
6736e0edd378fb8 Dan Williams 2022-06-06  762  			cxl_rr->nr_targets);
6736e0edd378fb8 Dan Williams 2022-06-06  763  		return -EINVAL;
6736e0edd378fb8 Dan Williams 2022-06-06  764  	}
6736e0edd378fb8 Dan Williams 2022-06-06  765  =

6736e0edd378fb8 Dan Williams 2022-06-06  766  	cxlsd =3D to_cxl_switch_deco=
der(&cxld->dev);
6736e0edd378fb8 Dan Williams 2022-06-06  767  	if (cxl_rr->nr_targets_set) {
6736e0edd378fb8 Dan Williams 2022-06-06  768  		int i, distance;
6736e0edd378fb8 Dan Williams 2022-06-06  769  =

6736e0edd378fb8 Dan Williams 2022-06-06  770  		distance =3D p->nr_targets =
/ cxl_rr->nr_targets;
6736e0edd378fb8 Dan Williams 2022-06-06  771  		for (i =3D 0; i < cxl_rr->n=
r_targets_set; i++)
6736e0edd378fb8 Dan Williams 2022-06-06  772  			if (ep->dport =3D=3D cxlsd=
->target[i]) {
6736e0edd378fb8 Dan Williams 2022-06-06  773  				rc =3D check_last_peer(cx=
led, ep, cxl_rr,
6736e0edd378fb8 Dan Williams 2022-06-06  774  						     distance);
6736e0edd378fb8 Dan Williams 2022-06-06  775  				if (rc)
6736e0edd378fb8 Dan Williams 2022-06-06  776  					return rc;
6736e0edd378fb8 Dan Williams 2022-06-06  777  				goto out_target_set;
6736e0edd378fb8 Dan Williams 2022-06-06  778  			}
6736e0edd378fb8 Dan Williams 2022-06-06  779  		goto add_target;
6736e0edd378fb8 Dan Williams 2022-06-06  780  	}
6736e0edd378fb8 Dan Williams 2022-06-06  781  =

6736e0edd378fb8 Dan Williams 2022-06-06  782  	if (is_cxl_root(parent_port)=
) {
6736e0edd378fb8 Dan Williams 2022-06-06  783  		parent_ig =3D cxlrd->cxlsd.=
cxld.interleave_granularity;
6736e0edd378fb8 Dan Williams 2022-06-06  784  		parent_iw =3D cxlrd->cxlsd.=
cxld.interleave_ways;
6736e0edd378fb8 Dan Williams 2022-06-06  785  		/*
6736e0edd378fb8 Dan Williams 2022-06-06  786  		 * For purposes of address =
bit routing, use power-of-2 math for
6736e0edd378fb8 Dan Williams 2022-06-06  787  		 * switch ports.
6736e0edd378fb8 Dan Williams 2022-06-06  788  		 */
6736e0edd378fb8 Dan Williams 2022-06-06  789  		if (!is_power_of_2(parent_i=
w))
6736e0edd378fb8 Dan Williams 2022-06-06  790  			parent_iw /=3D 3;
6736e0edd378fb8 Dan Williams 2022-06-06  791  	} else {
6736e0edd378fb8 Dan Williams 2022-06-06  792  		struct cxl_region_ref *pare=
nt_rr;
6736e0edd378fb8 Dan Williams 2022-06-06  793  		struct cxl_decoder *parent_=
cxld;
6736e0edd378fb8 Dan Williams 2022-06-06  794  =

6736e0edd378fb8 Dan Williams 2022-06-06  795  		parent_rr =3D cxl_rr_load(p=
arent_port, cxlr);
6736e0edd378fb8 Dan Williams 2022-06-06  796  		parent_cxld =3D parent_rr->=
decoder;
6736e0edd378fb8 Dan Williams 2022-06-06  797  		parent_ig =3D parent_cxld->=
interleave_granularity;
6736e0edd378fb8 Dan Williams 2022-06-06  798  		parent_iw =3D parent_cxld->=
interleave_ways;
6736e0edd378fb8 Dan Williams 2022-06-06  799  	}
6736e0edd378fb8 Dan Williams 2022-06-06  800  =

6736e0edd378fb8 Dan Williams 2022-06-06  801  	granularity_to_cxl(parent_ig=
, &peig);
6736e0edd378fb8 Dan Williams 2022-06-06  802  	ways_to_cxl(parent_iw, &peiw=
);
6736e0edd378fb8 Dan Williams 2022-06-06  803  =

6736e0edd378fb8 Dan Williams 2022-06-06  804  	iw =3D cxl_rr->nr_targets;
6736e0edd378fb8 Dan Williams 2022-06-06  805  	ways_to_cxl(iw, &eiw);
6736e0edd378fb8 Dan Williams 2022-06-06  806  	if (cxl_rr->nr_targets > 1) {
6736e0edd378fb8 Dan Williams 2022-06-06 @807  		u32 address_bit =3D max(pei=
g + peiw, eiw + peig);
6736e0edd378fb8 Dan Williams 2022-06-06  808  =

6736e0edd378fb8 Dan Williams 2022-06-06  809  		eig =3D address_bit - eiw +=
 1;
6736e0edd378fb8 Dan Williams 2022-06-06  810  	} else {
6736e0edd378fb8 Dan Williams 2022-06-06  811  		eiw =3D peiw;
6736e0edd378fb8 Dan Williams 2022-06-06  812  		eig =3D peig;
6736e0edd378fb8 Dan Williams 2022-06-06  813  	}
6736e0edd378fb8 Dan Williams 2022-06-06  814  =

6736e0edd378fb8 Dan Williams 2022-06-06  815  	rc =3D cxl_to_granularity(ei=
g, &ig);
6736e0edd378fb8 Dan Williams 2022-06-06  816  	if (rc) {
6736e0edd378fb8 Dan Williams 2022-06-06  817  		dev_dbg(&cxlr->dev, "%s:%s:=
 invalid interleave: %d\n",
6736e0edd378fb8 Dan Williams 2022-06-06  818  			dev_name(port->uport), dev=
_name(&port->dev),
6736e0edd378fb8 Dan Williams 2022-06-06  819  			256 << eig);
6736e0edd378fb8 Dan Williams 2022-06-06  820  		return rc;
6736e0edd378fb8 Dan Williams 2022-06-06  821  	}
6736e0edd378fb8 Dan Williams 2022-06-06  822  =

6736e0edd378fb8 Dan Williams 2022-06-06  823  	cxld->interleave_ways =3D iw;
6736e0edd378fb8 Dan Williams 2022-06-06  824  	cxld->interleave_granularity=
 =3D ig;
6736e0edd378fb8 Dan Williams 2022-06-06  825  	dev_dbg(&cxlr->dev, "%s:%s i=
w: %d ig: %d\n", dev_name(port->uport),
6736e0edd378fb8 Dan Williams 2022-06-06  826  		dev_name(&port->dev), iw, i=
g);
6736e0edd378fb8 Dan Williams 2022-06-06  827  add_target:
6736e0edd378fb8 Dan Williams 2022-06-06  828  	if (cxl_rr->nr_targets_set =
=3D=3D cxl_rr->nr_targets) {
6736e0edd378fb8 Dan Williams 2022-06-06  829  		dev_dbg(&cxlr->dev,
6736e0edd378fb8 Dan Williams 2022-06-06  830  			"%s:%s: targets full tryin=
g to add %s:%s at %d\n",
6736e0edd378fb8 Dan Williams 2022-06-06  831  			dev_name(port->uport), dev=
_name(&port->dev),
6736e0edd378fb8 Dan Williams 2022-06-06  832  			dev_name(&cxlmd->dev), dev=
_name(&cxled->cxld.dev), pos);
6736e0edd378fb8 Dan Williams 2022-06-06  833  		return -ENXIO;
6736e0edd378fb8 Dan Williams 2022-06-06  834  	}
6736e0edd378fb8 Dan Williams 2022-06-06  835  	cxlsd->target[cxl_rr->nr_tar=
gets_set] =3D ep->dport;
6736e0edd378fb8 Dan Williams 2022-06-06  836  	inc =3D 1;
6736e0edd378fb8 Dan Williams 2022-06-06  837  out_target_set:
6736e0edd378fb8 Dan Williams 2022-06-06  838  	cxl_rr->nr_targets_set +=3D =
inc;
6736e0edd378fb8 Dan Williams 2022-06-06  839  	dev_dbg(&cxlr->dev, "%s:%s t=
arget[%d] =3D %s for %s:%s @ %d\n",
6736e0edd378fb8 Dan Williams 2022-06-06  840  		dev_name(port->uport), dev_=
name(&port->dev),
6736e0edd378fb8 Dan Williams 2022-06-06  841  		cxl_rr->nr_targets_set - 1,=
 dev_name(ep->dport->dport),
6736e0edd378fb8 Dan Williams 2022-06-06  842  		dev_name(&cxlmd->dev), dev_=
name(&cxled->cxld.dev), pos);
6736e0edd378fb8 Dan Williams 2022-06-06  843  =

6736e0edd378fb8 Dan Williams 2022-06-06  844  	return 0;
6736e0edd378fb8 Dan Williams 2022-06-06  845  }
6736e0edd378fb8 Dan Williams 2022-06-06  846  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4664303902718302010==--

