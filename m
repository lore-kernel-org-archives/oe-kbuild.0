Content-Type: multipart/mixed; boundary="===============6208274920170314868=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4027/13209] drivers/cxl/core/port.c:830:21-24: ERROR: port is NULL but dereferenced.
Date: Thu, 17 Mar 2022 15:41:47 +0800
Message-ID: <202203171545.Vf9oMQFV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6208274920170314868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Dan Williams <dan.j.williams@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   8a11187eb62b8b910d2c5484e1f5d160e8b11eb4
commit: 2703c16c75aea142c3079ec34ae2262c0557ef7f [4027/13209] cxl/core/port=
: Add switch port enumeration
:::::: branch date: 21 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c021-20220314 (https://download.01.org/0day-ci/arch=
ive/20220317/202203171545.Vf9oMQFV-lkp(a)intel.com/config)
compiler: gcc-9 (Ubuntu 9.4.0-1ubuntu1~20.04) 9.4.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/cxl/core/port.c:830:21-24: ERROR: port is NULL but dereferenced.

vim +830 drivers/cxl/core/port.c

2703c16c75aea1 Dan Williams 2022-02-04  813  =

2703c16c75aea1 Dan Williams 2022-02-04  814  static void cxl_detach_ep(void=
 *data)
2703c16c75aea1 Dan Williams 2022-02-04  815  {
2703c16c75aea1 Dan Williams 2022-02-04  816  	struct cxl_memdev *cxlmd =3D =
data;
2703c16c75aea1 Dan Williams 2022-02-04  817  	struct device *iter;
2703c16c75aea1 Dan Williams 2022-02-04  818  =

2703c16c75aea1 Dan Williams 2022-02-04  819  	for (iter =3D &cxlmd->dev; it=
er; iter =3D grandparent(iter)) {
2703c16c75aea1 Dan Williams 2022-02-04  820  		struct device *dport_dev =3D=
 grandparent(iter);
2703c16c75aea1 Dan Williams 2022-02-04  821  		struct cxl_port *port, *pare=
nt_port;
2703c16c75aea1 Dan Williams 2022-02-04  822  		LIST_HEAD(reap_dports);
2703c16c75aea1 Dan Williams 2022-02-04  823  		struct cxl_ep *ep;
2703c16c75aea1 Dan Williams 2022-02-04  824  =

2703c16c75aea1 Dan Williams 2022-02-04  825  		if (!dport_dev)
2703c16c75aea1 Dan Williams 2022-02-04  826  			break;
2703c16c75aea1 Dan Williams 2022-02-04  827  =

2703c16c75aea1 Dan Williams 2022-02-04  828  		port =3D find_cxl_port(dport=
_dev);
2703c16c75aea1 Dan Williams 2022-02-04  829  		if (!port || is_cxl_root(por=
t)) {
2703c16c75aea1 Dan Williams 2022-02-04 @830  			put_device(&port->dev);
2703c16c75aea1 Dan Williams 2022-02-04  831  			continue;
2703c16c75aea1 Dan Williams 2022-02-04  832  		}
2703c16c75aea1 Dan Williams 2022-02-04  833  =

2703c16c75aea1 Dan Williams 2022-02-04  834  		parent_port =3D to_cxl_port(=
port->dev.parent);
2703c16c75aea1 Dan Williams 2022-02-04  835  		cxl_device_lock(&parent_port=
->dev);
2703c16c75aea1 Dan Williams 2022-02-04  836  		if (!parent_port->dev.driver=
) {
2703c16c75aea1 Dan Williams 2022-02-04  837  			/*
2703c16c75aea1 Dan Williams 2022-02-04  838  			 * The bottom-up race to de=
lete the port lost to a
2703c16c75aea1 Dan Williams 2022-02-04  839  			 * top-down port disable, g=
ive up here, because the
2703c16c75aea1 Dan Williams 2022-02-04  840  			 * parent_port ->remove() w=
ill have cleaned up all
2703c16c75aea1 Dan Williams 2022-02-04  841  			 * descendants.
2703c16c75aea1 Dan Williams 2022-02-04  842  			 */
2703c16c75aea1 Dan Williams 2022-02-04  843  			cxl_device_unlock(&parent_p=
ort->dev);
2703c16c75aea1 Dan Williams 2022-02-04  844  			put_device(&port->dev);
2703c16c75aea1 Dan Williams 2022-02-04  845  			continue;
2703c16c75aea1 Dan Williams 2022-02-04  846  		}
2703c16c75aea1 Dan Williams 2022-02-04  847  =

2703c16c75aea1 Dan Williams 2022-02-04  848  		cxl_device_lock(&port->dev);
2703c16c75aea1 Dan Williams 2022-02-04  849  		ep =3D find_ep(port, &cxlmd-=
>dev);
2703c16c75aea1 Dan Williams 2022-02-04  850  		dev_dbg(&cxlmd->dev, "discon=
nect %s from %s\n",
2703c16c75aea1 Dan Williams 2022-02-04  851  			ep ? dev_name(ep->ep) : "",=
 dev_name(&port->dev));
2703c16c75aea1 Dan Williams 2022-02-04  852  		cxl_ep_release(ep);
2703c16c75aea1 Dan Williams 2022-02-04  853  		if (ep && !port->dead && lis=
t_empty(&port->endpoints) &&
2703c16c75aea1 Dan Williams 2022-02-04  854  		    !is_cxl_root(parent_port=
)) {
2703c16c75aea1 Dan Williams 2022-02-04  855  			/*
2703c16c75aea1 Dan Williams 2022-02-04  856  			 * This was the last ep att=
ached to a dynamically
2703c16c75aea1 Dan Williams 2022-02-04  857  			 * enumerated port. Block n=
ew cxl_add_ep() and garbage
2703c16c75aea1 Dan Williams 2022-02-04  858  			 * collect the port.
2703c16c75aea1 Dan Williams 2022-02-04  859  			 */
2703c16c75aea1 Dan Williams 2022-02-04  860  			port->dead =3D true;
2703c16c75aea1 Dan Williams 2022-02-04  861  			list_splice_init(&port->dpo=
rts, &reap_dports);
2703c16c75aea1 Dan Williams 2022-02-04  862  		}
2703c16c75aea1 Dan Williams 2022-02-04  863  		cxl_device_unlock(&port->dev=
);
2703c16c75aea1 Dan Williams 2022-02-04  864  =

2703c16c75aea1 Dan Williams 2022-02-04  865  		if (!list_empty(&reap_dports=
)) {
2703c16c75aea1 Dan Williams 2022-02-04  866  			dev_dbg(&cxlmd->dev, "delet=
e %s\n",
2703c16c75aea1 Dan Williams 2022-02-04  867  				dev_name(&port->dev));
2703c16c75aea1 Dan Williams 2022-02-04  868  			delete_switch_port(port, &r=
eap_dports);
2703c16c75aea1 Dan Williams 2022-02-04  869  		}
2703c16c75aea1 Dan Williams 2022-02-04  870  		put_device(&port->dev);
2703c16c75aea1 Dan Williams 2022-02-04  871  		cxl_device_unlock(&parent_po=
rt->dev);
2703c16c75aea1 Dan Williams 2022-02-04  872  	}
2703c16c75aea1 Dan Williams 2022-02-04  873  }
2703c16c75aea1 Dan Williams 2022-02-04  874  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6208274920170314868==--

