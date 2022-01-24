Content-Type: multipart/mixed; boundary="===============8647334621380115876=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 30/54] drivers/cxl/core/port.c:527 decoder_populate_targets() warn: inconsistent returns '&cxld->target_lock.lock'.
Date: Tue, 25 Jan 2022 00:13:33 +0800
Message-ID: <202201250055.R82EBqL1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8647334621380115876==
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
head:   d0687472d5b56e2018b833723082c2717e96c074
commit: a5d24e660f35f16cfe30031dcbd7356f7a002398 [30/54] cxl/core/port: Use=
 dedicated lock for decoder target list
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-m031-20220120 (https://download.01.org/0day-ci/arch=
ive/20220125/202201250055.R82EBqL1-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/core/port.c:527 decoder_populate_targets() warn: inconsistent r=
eturns '&cxld->target_lock.lock'.

vim +527 drivers/cxl/core/port.c

7d4b5ca2e2cb5d drivers/cxl/core.c      Dan Williams 2021-06-09  497  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  498  static=
 int decoder_populate_targets(struct cxl_decoder *cxld,
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  499  				  =
  struct cxl_port *port, int *target_map)
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  500  {
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  501  	int r=
c =3D 0, i;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  502  =

a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  503  	if (!=
target_map)
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  504  		retu=
rn 0;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  505  =

42c377a63d21df drivers/cxl/core/port.c Dan Williams 2022-01-05  506  	cxl_d=
evice_lock(&port->dev);
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  507  	if (l=
ist_empty(&port->dports)) {
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  508  		rc =
=3D -EINVAL;
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  509  		goto=
 out_unlock;
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  510  	}
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  511  =

a5d24e660f35f1 drivers/cxl/core/port.c Dan Williams 2022-01-21  512  	write=
_seqlock(&cxld->target_lock);
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  513  	for (=
i =3D 0; i < cxld->nr_targets; i++) {
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  514  		stru=
ct cxl_dport *dport =3D find_dport(port, target_map[i]);
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  515  =

a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  516  		if (=
!dport) {
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  517  			rc =
=3D -ENXIO;
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  518  			got=
o out_unlock;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  519  		}
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  520  		cxld=
->target[i] =3D dport;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  521  	}
a5d24e660f35f1 drivers/cxl/core/port.c Dan Williams 2022-01-21  522  	write=
_sequnlock(&cxld->target_lock);
48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  523  =

48667f676189ec drivers/cxl/core/bus.c  Dan Williams 2021-09-21  524  out_un=
lock:
42c377a63d21df drivers/cxl/core/port.c Dan Williams 2022-01-05  525  	cxl_d=
evice_unlock(&port->dev);
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  526  =

a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08 @527  	retur=
n rc;
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  528  }
a5c25802168993 drivers/cxl/core/bus.c  Dan Williams 2021-09-08  529  =


:::::: The code at line 527 was first introduced by commit
:::::: a5c25802168993c67a03a6e04142761dfb4a3bf5 cxl/bus: Populate the targe=
t list at decoder create

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8647334621380115876==--

