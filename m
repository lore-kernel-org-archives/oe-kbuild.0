Content-Type: multipart/mixed; boundary="===============8640405182601379458=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 56/59] drivers/cxl/core/region.c:196 cxl_region_decode_commit() error: uninitialized symbol 'rc'.
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207242107.EP8EqaLr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8640405182601379458==
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
commit: 011dfa10ad42130a9620e4088c4c570066c46893 [56/59] cxl/hdm: Commit de=
coder state to hardware
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-m041-20220722 (https://download.01.org/0day-ci/arc=
hive/20220724/202207242107.EP8EqaLr-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/cxl/core/region.c:196 cxl_region_decode_commit() error: uninitializ=
ed symbol 'rc'.

Old smatch warnings:
drivers/cxl/core/region.c:205 cxl_region_decode_commit() error: uninitializ=
ed symbol 'rc'.
drivers/cxl/core/region.c:457 alloc_hpa() error: uninitialized symbol 'res'.
drivers/cxl/core/region.c:995 cxl_port_setup_targets() error: uninitialized=
 symbol 'peig'.
drivers/cxl/core/region.c:995 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:995 cxl_port_setup_targets() error: uninitialized=
 symbol 'eiw'.
drivers/cxl/core/region.c:999 cxl_port_setup_targets() error: uninitialized=
 symbol 'peiw'.
drivers/cxl/core/region.c:1000 cxl_port_setup_targets() error: uninitialize=
d symbol 'peig'.
drivers/cxl/core/region.c:1584 create_pmem_region_store() warn: unsigned 'r=
c' is never less than zero.

vim +/rc +196 drivers/cxl/core/region.c

011dfa10ad4213 Dan Williams 2022-06-08  158  =

011dfa10ad4213 Dan Williams 2022-06-08  159  static int cxl_region_decode_c=
ommit(struct cxl_region *cxlr)
011dfa10ad4213 Dan Williams 2022-06-08  160  {
011dfa10ad4213 Dan Williams 2022-06-08  161  	struct cxl_region_params *p =
=3D &cxlr->params;
011dfa10ad4213 Dan Williams 2022-06-08  162  	int i, rc;
011dfa10ad4213 Dan Williams 2022-06-08  163  =

011dfa10ad4213 Dan Williams 2022-06-08  164  	for (i =3D 0; i < p->nr_targe=
ts; i++) {
011dfa10ad4213 Dan Williams 2022-06-08  165  		struct cxl_endpoint_decoder =
*cxled =3D p->targets[i];
011dfa10ad4213 Dan Williams 2022-06-08  166  		struct cxl_memdev *cxlmd =3D=
 cxled_to_memdev(cxled);
011dfa10ad4213 Dan Williams 2022-06-08  167  		struct cxl_region_ref *cxl_r=
r;
011dfa10ad4213 Dan Williams 2022-06-08  168  		struct cxl_decoder *cxld;
011dfa10ad4213 Dan Williams 2022-06-08  169  		struct cxl_port *iter;
011dfa10ad4213 Dan Williams 2022-06-08  170  		struct cxl_ep *ep;
011dfa10ad4213 Dan Williams 2022-06-08  171  =

011dfa10ad4213 Dan Williams 2022-06-08  172  		/* commit bottom up */
011dfa10ad4213 Dan Williams 2022-06-08  173  		for (iter =3D cxled_to_port(=
cxled); !is_cxl_root(iter);
011dfa10ad4213 Dan Williams 2022-06-08  174  		     iter =3D to_cxl_port(it=
er->dev.parent)) {
011dfa10ad4213 Dan Williams 2022-06-08  175  			cxl_rr =3D cxl_rr_load(iter=
, cxlr);
011dfa10ad4213 Dan Williams 2022-06-08  176  			cxld =3D cxl_rr->decoder;
011dfa10ad4213 Dan Williams 2022-06-08  177  			rc =3D cxld->commit(cxld);
011dfa10ad4213 Dan Williams 2022-06-08  178  			if (rc)
011dfa10ad4213 Dan Williams 2022-06-08  179  				break;
011dfa10ad4213 Dan Williams 2022-06-08  180  		}
011dfa10ad4213 Dan Williams 2022-06-08  181  =

011dfa10ad4213 Dan Williams 2022-06-08  182  		/* success, all decoders up =
to the root are programmed */
011dfa10ad4213 Dan Williams 2022-06-08  183  		if (is_cxl_root(iter))
011dfa10ad4213 Dan Williams 2022-06-08  184  			continue;
011dfa10ad4213 Dan Williams 2022-06-08  185  =

011dfa10ad4213 Dan Williams 2022-06-08  186  		/* programming @iter failed,=
 teardown */
011dfa10ad4213 Dan Williams 2022-06-08  187  		for (ep =3D cxl_ep_load(iter=
, cxlmd); ep && iter;
011dfa10ad4213 Dan Williams 2022-06-08  188  		     iter =3D ep->next, ep =
=3D cxl_ep_load(iter, cxlmd)) {
011dfa10ad4213 Dan Williams 2022-06-08  189  			cxl_rr =3D cxl_rr_load(iter=
, cxlr);
011dfa10ad4213 Dan Williams 2022-06-08  190  			cxld =3D cxl_rr->decoder;
011dfa10ad4213 Dan Williams 2022-06-08  191  			cxld->reset(cxld);
011dfa10ad4213 Dan Williams 2022-06-08  192  		}
011dfa10ad4213 Dan Williams 2022-06-08  193  =

011dfa10ad4213 Dan Williams 2022-06-08  194  		cxled->cxld.reset(&cxled->cx=
ld);
011dfa10ad4213 Dan Williams 2022-06-08  195  		if (i =3D=3D 0)
011dfa10ad4213 Dan Williams 2022-06-08 @196  			return rc;
011dfa10ad4213 Dan Williams 2022-06-08  197  		break;
011dfa10ad4213 Dan Williams 2022-06-08  198  	}
011dfa10ad4213 Dan Williams 2022-06-08  199  =

011dfa10ad4213 Dan Williams 2022-06-08  200  	if (i >=3D p->nr_targets)
011dfa10ad4213 Dan Williams 2022-06-08  201  		return 0;
011dfa10ad4213 Dan Williams 2022-06-08  202  =

011dfa10ad4213 Dan Williams 2022-06-08  203  	/* undo the targets that were=
 successfully committed */
011dfa10ad4213 Dan Williams 2022-06-08  204  	cxl_region_decode_reset(cxlr,=
 i);
011dfa10ad4213 Dan Williams 2022-06-08  205  	return rc;
011dfa10ad4213 Dan Williams 2022-06-08  206  }
011dfa10ad4213 Dan Williams 2022-06-08  207  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8640405182601379458==--

