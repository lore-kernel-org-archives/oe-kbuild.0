Content-Type: multipart/mixed; boundary="===============8827473298778251594=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 55/59] drivers/cxl/core/region.c:833 cxl_port_setup_targets() error: uninitialized symbol 'peig'.
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207242005.ac7gJm4h-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8827473298778251594==
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
head:   b282b26d11c50d48b336fedb5f74b2eca3f7b94c
commit: 60123aa889a00573086429b55cc7f94ab157fbb4 [55/59] cxl/region: Progra=
m target lists
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-m041-20220722 (https://download.01.org/0day-ci/arc=
hive/20220724/202207242005.ac7gJm4h-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:833 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:833 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:833 cxl_port_setup_targets() error: uninitialized=
 symbol 'eiw'.

Old smatch warnings:
drivers/cxl/core/region.c:290 alloc_hpa() error: uninitialized symbol 'res'.
drivers/cxl/core/region.c:837 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:838 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:1410 create_pmem_region_store() warn: unsigned 'r=
c' is never less than zero.

vim +/peig +833 drivers/cxl/core/region.c

60123aa889a005 Dan Williams 2022-06-06  764  =

60123aa889a005 Dan Williams 2022-06-06  765  static int cxl_port_setup_targ=
ets(struct cxl_port *port,
60123aa889a005 Dan Williams 2022-06-06  766  				  struct cxl_region *cxlr,
60123aa889a005 Dan Williams 2022-06-06  767  				  struct cxl_endpoint_deco=
der *cxled)
60123aa889a005 Dan Williams 2022-06-06  768  {
60123aa889a005 Dan Williams 2022-06-06  769  	struct cxl_root_decoder *cxlr=
d =3D to_cxl_root_decoder(cxlr->dev.parent);
60123aa889a005 Dan Williams 2022-06-06  770  	int parent_iw, parent_ig, ig,=
 iw, rc, inc =3D 0, pos =3D cxled->pos;
60123aa889a005 Dan Williams 2022-06-06  771  	struct cxl_port *parent_port =
=3D to_cxl_port(port->dev.parent);
60123aa889a005 Dan Williams 2022-06-06  772  	struct cxl_region_ref *cxl_rr=
 =3D cxl_rr_load(port, cxlr);
60123aa889a005 Dan Williams 2022-06-06  773  	struct cxl_memdev *cxlmd =3D =
cxled_to_memdev(cxled);
60123aa889a005 Dan Williams 2022-06-06  774  	struct cxl_ep *ep =3D cxl_ep_=
load(port, cxlmd);
60123aa889a005 Dan Williams 2022-06-06  775  	struct cxl_region_params *p =
=3D &cxlr->params;
60123aa889a005 Dan Williams 2022-06-06  776  	struct cxl_decoder *cxld =3D =
cxl_rr->decoder;
60123aa889a005 Dan Williams 2022-06-06  777  	struct cxl_switch_decoder *cx=
lsd;
60123aa889a005 Dan Williams 2022-06-06  778  	u16 eig, peig;
60123aa889a005 Dan Williams 2022-06-06  779  	u8 eiw, peiw;
60123aa889a005 Dan Williams 2022-06-06  780  =

60123aa889a005 Dan Williams 2022-06-06  781  	/*
60123aa889a005 Dan Williams 2022-06-06  782  	 * While root level decoders =
support x3, x6, x12, switch level
60123aa889a005 Dan Williams 2022-06-06  783  	 * decoders only support powe=
rs of 2 up to x16.
60123aa889a005 Dan Williams 2022-06-06  784  	 */
60123aa889a005 Dan Williams 2022-06-06  785  	if (!is_power_of_2(cxl_rr->nr=
_targets)) {
60123aa889a005 Dan Williams 2022-06-06  786  		dev_dbg(&cxlr->dev, "%s:%s: =
invalid target count %d\n",
60123aa889a005 Dan Williams 2022-06-06  787  			dev_name(port->uport), dev_=
name(&port->dev),
60123aa889a005 Dan Williams 2022-06-06  788  			cxl_rr->nr_targets);
60123aa889a005 Dan Williams 2022-06-06  789  		return -EINVAL;
60123aa889a005 Dan Williams 2022-06-06  790  	}
60123aa889a005 Dan Williams 2022-06-06  791  =

60123aa889a005 Dan Williams 2022-06-06  792  	cxlsd =3D to_cxl_switch_decod=
er(&cxld->dev);
60123aa889a005 Dan Williams 2022-06-06  793  	if (cxl_rr->nr_targets_set) {
60123aa889a005 Dan Williams 2022-06-06  794  		int i, distance;
60123aa889a005 Dan Williams 2022-06-06  795  =

60123aa889a005 Dan Williams 2022-06-06  796  		distance =3D p->nr_targets /=
 cxl_rr->nr_targets;
60123aa889a005 Dan Williams 2022-06-06  797  		for (i =3D 0; i < cxl_rr->nr=
_targets_set; i++)
60123aa889a005 Dan Williams 2022-06-06  798  			if (ep->dport =3D=3D cxlsd-=
>target[i]) {
60123aa889a005 Dan Williams 2022-06-06  799  				rc =3D check_last_peer(cxl=
ed, ep, cxl_rr,
60123aa889a005 Dan Williams 2022-06-06  800  						     distance);
60123aa889a005 Dan Williams 2022-06-06  801  				if (rc)
60123aa889a005 Dan Williams 2022-06-06  802  					return rc;
60123aa889a005 Dan Williams 2022-06-06  803  				goto out_target_set;
60123aa889a005 Dan Williams 2022-06-06  804  			}
60123aa889a005 Dan Williams 2022-06-06  805  		goto add_target;
60123aa889a005 Dan Williams 2022-06-06  806  	}
60123aa889a005 Dan Williams 2022-06-06  807  =

60123aa889a005 Dan Williams 2022-06-06  808  	if (is_cxl_root(parent_port))=
 {
60123aa889a005 Dan Williams 2022-06-06  809  		parent_ig =3D cxlrd->cxlsd.c=
xld.interleave_granularity;
60123aa889a005 Dan Williams 2022-06-06  810  		parent_iw =3D cxlrd->cxlsd.c=
xld.interleave_ways;
60123aa889a005 Dan Williams 2022-06-06  811  		/*
60123aa889a005 Dan Williams 2022-06-06  812  		 * For purposes of address b=
it routing, use power-of-2 math for
60123aa889a005 Dan Williams 2022-06-06  813  		 * switch ports.
60123aa889a005 Dan Williams 2022-06-06  814  		 */
60123aa889a005 Dan Williams 2022-06-06  815  		if (!is_power_of_2(parent_iw=
))
60123aa889a005 Dan Williams 2022-06-06  816  			parent_iw /=3D 3;
60123aa889a005 Dan Williams 2022-06-06  817  	} else {
60123aa889a005 Dan Williams 2022-06-06  818  		struct cxl_region_ref *paren=
t_rr;
60123aa889a005 Dan Williams 2022-06-06  819  		struct cxl_decoder *parent_c=
xld;
60123aa889a005 Dan Williams 2022-06-06  820  =

60123aa889a005 Dan Williams 2022-06-06  821  		parent_rr =3D cxl_rr_load(pa=
rent_port, cxlr);
60123aa889a005 Dan Williams 2022-06-06  822  		parent_cxld =3D parent_rr->d=
ecoder;
60123aa889a005 Dan Williams 2022-06-06  823  		parent_ig =3D parent_cxld->i=
nterleave_granularity;
60123aa889a005 Dan Williams 2022-06-06  824  		parent_iw =3D parent_cxld->i=
nterleave_ways;
60123aa889a005 Dan Williams 2022-06-06  825  	}
60123aa889a005 Dan Williams 2022-06-06  826  =

60123aa889a005 Dan Williams 2022-06-06  827  	granularity_to_cxl(parent_ig,=
 &peig);
60123aa889a005 Dan Williams 2022-06-06  828  	ways_to_cxl(parent_iw, &peiw);
60123aa889a005 Dan Williams 2022-06-06  829  =

60123aa889a005 Dan Williams 2022-06-06  830  	iw =3D cxl_rr->nr_targets;
60123aa889a005 Dan Williams 2022-06-06  831  	ways_to_cxl(iw, &eiw);
60123aa889a005 Dan Williams 2022-06-06  832  	if (cxl_rr->nr_targets > 1) {
60123aa889a005 Dan Williams 2022-06-06 @833  		u32 address_bit =3D max(peig=
 + peiw, eiw + peig);
60123aa889a005 Dan Williams 2022-06-06  834  =

60123aa889a005 Dan Williams 2022-06-06  835  		eig =3D address_bit - eiw + =
1;
60123aa889a005 Dan Williams 2022-06-06  836  	} else {
60123aa889a005 Dan Williams 2022-06-06  837  		eiw =3D peiw;
60123aa889a005 Dan Williams 2022-06-06  838  		eig =3D peig;
60123aa889a005 Dan Williams 2022-06-06  839  	}
60123aa889a005 Dan Williams 2022-06-06  840  =

60123aa889a005 Dan Williams 2022-06-06  841  	rc =3D cxl_to_granularity(eig=
, &ig);
60123aa889a005 Dan Williams 2022-06-06  842  	if (rc) {
60123aa889a005 Dan Williams 2022-06-06  843  		dev_dbg(&cxlr->dev, "%s:%s: =
invalid interleave: %d\n",
60123aa889a005 Dan Williams 2022-06-06  844  			dev_name(port->uport), dev_=
name(&port->dev),
60123aa889a005 Dan Williams 2022-06-06  845  			256 << eig);
60123aa889a005 Dan Williams 2022-06-06  846  		return rc;
60123aa889a005 Dan Williams 2022-06-06  847  	}
60123aa889a005 Dan Williams 2022-06-06  848  =

60123aa889a005 Dan Williams 2022-06-06  849  	cxld->interleave_ways =3D iw;
60123aa889a005 Dan Williams 2022-06-06  850  	cxld->interleave_granularity =
=3D ig;
60123aa889a005 Dan Williams 2022-06-06  851  	dev_dbg(&cxlr->dev, "%s:%s iw=
: %d ig: %d\n", dev_name(port->uport),
60123aa889a005 Dan Williams 2022-06-06  852  		dev_name(&port->dev), iw, ig=
);
60123aa889a005 Dan Williams 2022-06-06  853  add_target:
60123aa889a005 Dan Williams 2022-06-06  854  	if (cxl_rr->nr_targets_set =
=3D=3D cxl_rr->nr_targets) {
60123aa889a005 Dan Williams 2022-06-06  855  		dev_dbg(&cxlr->dev,
60123aa889a005 Dan Williams 2022-06-06  856  			"%s:%s: targets full trying=
 to add %s:%s at %d\n",
60123aa889a005 Dan Williams 2022-06-06  857  			dev_name(port->uport), dev_=
name(&port->dev),
60123aa889a005 Dan Williams 2022-06-06  858  			dev_name(&cxlmd->dev), dev_=
name(&cxled->cxld.dev), pos);
60123aa889a005 Dan Williams 2022-06-06  859  		return -ENXIO;
60123aa889a005 Dan Williams 2022-06-06  860  	}
60123aa889a005 Dan Williams 2022-06-06  861  	cxlsd->target[cxl_rr->nr_targ=
ets_set] =3D ep->dport;
60123aa889a005 Dan Williams 2022-06-06  862  	inc =3D 1;
60123aa889a005 Dan Williams 2022-06-06  863  out_target_set:
60123aa889a005 Dan Williams 2022-06-06  864  	cxl_rr->nr_targets_set +=3D i=
nc;
60123aa889a005 Dan Williams 2022-06-06  865  	dev_dbg(&cxlr->dev, "%s:%s ta=
rget[%d] =3D %s for %s:%s @ %d\n",
60123aa889a005 Dan Williams 2022-06-06  866  		dev_name(port->uport), dev_n=
ame(&port->dev),
60123aa889a005 Dan Williams 2022-06-06  867  		cxl_rr->nr_targets_set - 1, =
dev_name(ep->dport->dport),
60123aa889a005 Dan Williams 2022-06-06  868  		dev_name(&cxlmd->dev), dev_n=
ame(&cxled->cxld.dev), pos);
60123aa889a005 Dan Williams 2022-06-06  869  =

60123aa889a005 Dan Williams 2022-06-06  870  	return 0;
60123aa889a005 Dan Williams 2022-06-06  871  }
60123aa889a005 Dan Williams 2022-06-06  872  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8827473298778251594==--

