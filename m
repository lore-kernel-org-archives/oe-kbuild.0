Content-Type: multipart/mixed; boundary="===============6916514934403204467=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [cxl:preview 32/60] drivers/cxl/core/port.c:809:21-24: ERROR: port is NULL but dereferenced.
Date: Wed, 09 Feb 2022 21:06:01 +0800
Message-ID: <202202092047.jxSbSnOH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6916514934403204467==
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
head:   41c2d219a2c8e14de644f4e953e0c57402c3e884
commit: 1bb1c2110c968b3fdca7b37afbd0594d8e82715e [32/60] cxl/core/port: Add=
 switch port enumeration
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20209/202202092047.jxSbSnOH-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/core/port.c:809:21-24: ERROR: port is NULL but dereferenced.

vim +809 drivers/cxl/core/port.c

1bb1c2110c968b3 Dan Williams 2022-01-21  792  =

1bb1c2110c968b3 Dan Williams 2022-01-21  793  static void cxl_remove_ep(voi=
d *data)
1bb1c2110c968b3 Dan Williams 2022-01-21  794  {
1bb1c2110c968b3 Dan Williams 2022-01-21  795  	struct cxl_memdev *cxlmd =3D=
 data;
1bb1c2110c968b3 Dan Williams 2022-01-21  796  	struct device *iter;
1bb1c2110c968b3 Dan Williams 2022-01-21  797  =

1bb1c2110c968b3 Dan Williams 2022-01-21  798  	for (iter =3D &cxlmd->dev; i=
ter; iter =3D grandparent(iter)) {
1bb1c2110c968b3 Dan Williams 2022-01-21  799  		struct device *dport_dev =
=3D grandparent(iter);
1bb1c2110c968b3 Dan Williams 2022-01-21  800  		struct cxl_port *port, *par=
ent_port;
1bb1c2110c968b3 Dan Williams 2022-01-21  801  		LIST_HEAD(reap_dports);
1bb1c2110c968b3 Dan Williams 2022-01-21  802  		struct cxl_ep *ep;
1bb1c2110c968b3 Dan Williams 2022-01-21  803  =

1bb1c2110c968b3 Dan Williams 2022-01-21  804  		if (!dport_dev)
1bb1c2110c968b3 Dan Williams 2022-01-21  805  			break;
1bb1c2110c968b3 Dan Williams 2022-01-21  806  =

1bb1c2110c968b3 Dan Williams 2022-01-21  807  		port =3D find_cxl_port(dpor=
t_dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  808  		if (!port || is_cxl_root(po=
rt)) {
1bb1c2110c968b3 Dan Williams 2022-01-21 @809  			put_device(&port->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  810  			continue;
1bb1c2110c968b3 Dan Williams 2022-01-21  811  		}
1bb1c2110c968b3 Dan Williams 2022-01-21  812  =

1bb1c2110c968b3 Dan Williams 2022-01-21  813  		parent_port =3D to_cxl_port=
(port->dev.parent);
1bb1c2110c968b3 Dan Williams 2022-01-21  814  		cxl_device_lock(&parent_por=
t->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  815  		if (!parent_port->dev.drive=
r) {
1bb1c2110c968b3 Dan Williams 2022-01-21  816  			cxl_device_unlock(&parent_=
port->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  817  			put_device(&port->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  818  			continue;
1bb1c2110c968b3 Dan Williams 2022-01-21  819  		}
1bb1c2110c968b3 Dan Williams 2022-01-21  820  =

1bb1c2110c968b3 Dan Williams 2022-01-21  821  		cxl_device_lock(&port->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  822  		ep =3D find_ep(port, &cxlmd=
->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  823  		dev_dbg(&cxlmd->dev, "disco=
nnect %s from %s\n",
1bb1c2110c968b3 Dan Williams 2022-01-21  824  			ep ? dev_name(ep->ep) : ""=
, dev_name(&port->dev));
1bb1c2110c968b3 Dan Williams 2022-01-21  825  		cxl_ep_release(ep);
1bb1c2110c968b3 Dan Williams 2022-01-21  826  		if (ep && !port->dead && li=
st_empty(&port->endpoints) &&
1bb1c2110c968b3 Dan Williams 2022-01-21  827  		    !is_cxl_root(parent_por=
t)) {
1bb1c2110c968b3 Dan Williams 2022-01-21  828  			/*
1bb1c2110c968b3 Dan Williams 2022-01-21  829  			 * This was the last ep at=
tached to a dynamically
1bb1c2110c968b3 Dan Williams 2022-01-21  830  			 * enumerated port. Block =
new cxl_add_ep() and garbage
1bb1c2110c968b3 Dan Williams 2022-01-21  831  			 * collect the port.
1bb1c2110c968b3 Dan Williams 2022-01-21  832  			 */
1bb1c2110c968b3 Dan Williams 2022-01-21  833  			port->dead =3D true;
1bb1c2110c968b3 Dan Williams 2022-01-21  834  			list_splice_init(&port->dp=
orts, &reap_dports);
1bb1c2110c968b3 Dan Williams 2022-01-21  835  		}
1bb1c2110c968b3 Dan Williams 2022-01-21  836  		cxl_device_unlock(&port->de=
v);
1bb1c2110c968b3 Dan Williams 2022-01-21  837  =

1bb1c2110c968b3 Dan Williams 2022-01-21  838  		if (!list_empty(&reap_dport=
s))
1bb1c2110c968b3 Dan Williams 2022-01-21  839  			delete_switch_port(cxlmd, =
port, &reap_dports);
1bb1c2110c968b3 Dan Williams 2022-01-21  840  		put_device(&port->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  841  		cxl_device_unlock(&parent_p=
ort->dev);
1bb1c2110c968b3 Dan Williams 2022-01-21  842  	}
1bb1c2110c968b3 Dan Williams 2022-01-21  843  }
1bb1c2110c968b3 Dan Williams 2022-01-21  844  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6916514934403204467==--

