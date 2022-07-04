Content-Type: multipart/mixed; boundary="===============5970760615736816404=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 47/51] drivers/cxl/core/region.c:192 cxl_region_decode_commit() error: uninitialized symbol 'rc'.
Date: Tue, 05 Jul 2022 07:23:22 +0800
Message-ID: <202207050730.3wxXhWGw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5970760615736816404==
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
commit: 9ca045c484e85341c26fe26881e528f7624bdaea [47/51] cxl/hdm: Commit de=
coder state to hardware
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: i386-randconfig-m021-20220704 (https://download.01.org/0day-ci/arch=
ive/20220705/202207050730.3wxXhWGw-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:192 cxl_region_decode_commit() error: uninitializ=
ed symbol 'rc'.

Old smatch warnings:
drivers/cxl/core/region.c:201 cxl_region_decode_commit() error: uninitializ=
ed symbol 'rc'.
drivers/cxl/core/region.c:443 alloc_hpa() error: uninitialized symbol 'res'.
drivers/cxl/core/region.c:964 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:964 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:964 cxl_port_setup_targets() error: uninitialized=
 symbol 'eiw'.
drivers/cxl/core/region.c:968 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:969 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:1557 create_pmem_region_store() warn: unsigned 'r=
c' is never less than zero.

vim +/rc +192 drivers/cxl/core/region.c

9ca045c484e853 Dan Williams 2022-06-08  155  =

9ca045c484e853 Dan Williams 2022-06-08  156  static int cxl_region_decode_c=
ommit(struct cxl_region *cxlr)
9ca045c484e853 Dan Williams 2022-06-08  157  {
9ca045c484e853 Dan Williams 2022-06-08  158  	struct cxl_region_params *p =
=3D &cxlr->params;
9ca045c484e853 Dan Williams 2022-06-08  159  	int i, rc;
9ca045c484e853 Dan Williams 2022-06-08  160  =

9ca045c484e853 Dan Williams 2022-06-08  161  	for (i =3D 0; i < p->nr_targe=
ts; i++) {
9ca045c484e853 Dan Williams 2022-06-08  162  		struct cxl_endpoint_decoder =
*cxled =3D p->targets[i];
9ca045c484e853 Dan Williams 2022-06-08  163  		struct cxl_memdev *cxlmd =3D=
 cxled_to_memdev(cxled);
9ca045c484e853 Dan Williams 2022-06-08  164  		struct cxl_region_ref *cxl_r=
r;
9ca045c484e853 Dan Williams 2022-06-08  165  		struct cxl_decoder *cxld;
9ca045c484e853 Dan Williams 2022-06-08  166  		struct cxl_port *iter;
9ca045c484e853 Dan Williams 2022-06-08  167  		struct cxl_ep *ep;
9ca045c484e853 Dan Williams 2022-06-08  168  =

9ca045c484e853 Dan Williams 2022-06-08  169  		/* commit bottom up */
9ca045c484e853 Dan Williams 2022-06-08  170  		for (iter =3D cxled_to_port(=
cxled); !is_cxl_root(iter);
9ca045c484e853 Dan Williams 2022-06-08  171  		     iter =3D to_cxl_port(it=
er->dev.parent)) {
9ca045c484e853 Dan Williams 2022-06-08  172  			cxl_rr =3D cxl_rr_load(iter=
, cxlr);
9ca045c484e853 Dan Williams 2022-06-08  173  			cxld =3D cxl_rr->decoder;
9ca045c484e853 Dan Williams 2022-06-08  174  			rc =3D cxld->commit(cxld);
9ca045c484e853 Dan Williams 2022-06-08  175  			if (rc)
9ca045c484e853 Dan Williams 2022-06-08  176  				break;
9ca045c484e853 Dan Williams 2022-06-08  177  		}
9ca045c484e853 Dan Williams 2022-06-08  178  =

9ca045c484e853 Dan Williams 2022-06-08  179  		if (is_cxl_root(iter))
9ca045c484e853 Dan Williams 2022-06-08  180  			continue;
9ca045c484e853 Dan Williams 2022-06-08  181  =

9ca045c484e853 Dan Williams 2022-06-08  182  		/* teardown top down */
9ca045c484e853 Dan Williams 2022-06-08  183  		for (ep =3D cxl_ep_load(iter=
, cxlmd); ep && iter;
9ca045c484e853 Dan Williams 2022-06-08  184  		     iter =3D ep->next, ep =
=3D cxl_ep_load(iter, cxlmd)) {
9ca045c484e853 Dan Williams 2022-06-08  185  			cxl_rr =3D cxl_rr_load(iter=
, cxlr);
9ca045c484e853 Dan Williams 2022-06-08  186  			cxld =3D cxl_rr->decoder;
9ca045c484e853 Dan Williams 2022-06-08  187  			cxld->reset(cxld);
9ca045c484e853 Dan Williams 2022-06-08  188  		}
9ca045c484e853 Dan Williams 2022-06-08  189  =

9ca045c484e853 Dan Williams 2022-06-08  190  		cxled->cxld.reset(&cxled->cx=
ld);
9ca045c484e853 Dan Williams 2022-06-08  191  		if (i =3D=3D 0)
9ca045c484e853 Dan Williams 2022-06-08 @192  			return rc;
9ca045c484e853 Dan Williams 2022-06-08  193  		break;
9ca045c484e853 Dan Williams 2022-06-08  194  	}
9ca045c484e853 Dan Williams 2022-06-08  195  =

9ca045c484e853 Dan Williams 2022-06-08  196  	if (i >=3D p->nr_targets)
9ca045c484e853 Dan Williams 2022-06-08  197  		return 0;
9ca045c484e853 Dan Williams 2022-06-08  198  =

9ca045c484e853 Dan Williams 2022-06-08  199  	/* undo the targets that were=
 successfully committed */
9ca045c484e853 Dan Williams 2022-06-08  200  	cxl_region_decode_reset(cxlr,=
 i);
9ca045c484e853 Dan Williams 2022-06-08  201  	return rc;
9ca045c484e853 Dan Williams 2022-06-08  202  }
9ca045c484e853 Dan Williams 2022-06-08  203  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5970760615736816404==--

