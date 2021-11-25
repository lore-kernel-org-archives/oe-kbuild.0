Content-Type: multipart/mixed; boundary="===============9064132402277043745=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 23/23] cxl/mem: Disable switch hierarchies for now
Date: Fri, 26 Nov 2021 07:55:31 +0800
Message-ID: <202111260754.Oy5s01Gl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9064132402277043745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211120000250.1663391-24-ben.widawsky@intel.com>
References: <20211120000250.1663391-24-ben.widawsky@intel.com>
TO: Ben Widawsky <ben.widawsky@intel.com>
TO: linux-cxl(a)vger.kernel.org
TO: linux-pci(a)vger.kernel.org
CC: Ben Widawsky <ben.widawsky@intel.com>
CC: Alison Schofield <alison.schofield@intel.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Ira Weiny <ira.weiny@intel.com>
CC: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: Vishal Verma <vishal.l.verma@intel.com>

Hi Ben,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 53989fad1286e652ea3655ae3367ba698da8d2ff]

url:    https://github.com/0day-ci/linux/commits/Ben-Widawsky/Add-drivers-f=
or-CXL-ports-and-mem-devices/20211120-080513
base:   53989fad1286e652ea3655ae3367ba698da8d2ff
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20211118 (https://download.01.org/0day-ci/ar=
chive/20211126/202111260754.Oy5s01Gl-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/mem.c:164 cxl_mem_probe() warn: ignoring unreachable code.

vim +164 drivers/cxl/mem.c

c1dc1914d16616 Ben Widawsky 2021-11-19  117  =

c1dc1914d16616 Ben Widawsky 2021-11-19  118  static int cxl_mem_probe(struc=
t device *dev)
c1dc1914d16616 Ben Widawsky 2021-11-19  119  {
c1dc1914d16616 Ben Widawsky 2021-11-19  120  	struct cxl_memdev *cxlmd =3D =
to_cxl_memdev(dev);
c1dc1914d16616 Ben Widawsky 2021-11-19  121  	struct cxl_port *hostbridge, =
*parent_port;
c1dc1914d16616 Ben Widawsky 2021-11-19  122  	struct walk_ctx ctx =3D { NUL=
L, false };
c1dc1914d16616 Ben Widawsky 2021-11-19  123  	struct cxl_dport *dport;
c1dc1914d16616 Ben Widawsky 2021-11-19  124  	int rc;
c1dc1914d16616 Ben Widawsky 2021-11-19  125  =

c1dc1914d16616 Ben Widawsky 2021-11-19  126  	rc =3D wait_for_media(cxlmd);
c1dc1914d16616 Ben Widawsky 2021-11-19  127  	if (rc) {
c1dc1914d16616 Ben Widawsky 2021-11-19  128  		dev_err(dev, "Media not acti=
ve (%d)\n", rc);
c1dc1914d16616 Ben Widawsky 2021-11-19  129  		return rc;
c1dc1914d16616 Ben Widawsky 2021-11-19  130  	}
c1dc1914d16616 Ben Widawsky 2021-11-19  131  =

c1dc1914d16616 Ben Widawsky 2021-11-19  132  	walk_to_root_port(dev, &ctx);
c1dc1914d16616 Ben Widawsky 2021-11-19  133  =

c1dc1914d16616 Ben Widawsky 2021-11-19  134  	/*
c1dc1914d16616 Ben Widawsky 2021-11-19  135  	 * Couldn't find a CXL capabl=
e root port. This may happen even with a
c1dc1914d16616 Ben Widawsky 2021-11-19  136  	 * CXL capable topology if cx=
l_acpi hasn't completed yet. A rescan will
c1dc1914d16616 Ben Widawsky 2021-11-19  137  	 * occur.
c1dc1914d16616 Ben Widawsky 2021-11-19  138  	 */
c1dc1914d16616 Ben Widawsky 2021-11-19  139  	if (!ctx.root_port)
c1dc1914d16616 Ben Widawsky 2021-11-19  140  		return -ENODEV;
c1dc1914d16616 Ben Widawsky 2021-11-19  141  =

c1dc1914d16616 Ben Widawsky 2021-11-19  142  	hostbridge =3D ctx.root_port-=
>port;
c1dc1914d16616 Ben Widawsky 2021-11-19  143  	device_lock(&hostbridge->dev);
c1dc1914d16616 Ben Widawsky 2021-11-19  144  =

c1dc1914d16616 Ben Widawsky 2021-11-19  145  	/* hostbridge has no port dri=
ver, the topology isn't enabled yet */
c1dc1914d16616 Ben Widawsky 2021-11-19  146  	if (!hostbridge->dev.driver) {
c1dc1914d16616 Ben Widawsky 2021-11-19  147  		device_unlock(&hostbridge->d=
ev);
c1dc1914d16616 Ben Widawsky 2021-11-19  148  		return -ENODEV;
c1dc1914d16616 Ben Widawsky 2021-11-19  149  	}
c1dc1914d16616 Ben Widawsky 2021-11-19  150  =

c1dc1914d16616 Ben Widawsky 2021-11-19  151  	/* No switch + found root por=
t means we're done */
c1dc1914d16616 Ben Widawsky 2021-11-19  152  	if (!ctx.has_switch) {
c1dc1914d16616 Ben Widawsky 2021-11-19  153  		parent_port =3D to_cxl_port(=
&hostbridge->dev);
c1dc1914d16616 Ben Widawsky 2021-11-19  154  		dport =3D ctx.root_port;
c1dc1914d16616 Ben Widawsky 2021-11-19  155  		goto out;
c1dc1914d16616 Ben Widawsky 2021-11-19  156  	}
c1dc1914d16616 Ben Widawsky 2021-11-19  157  =

3a5b49dc14175d Ben Widawsky 2021-11-19  158  	/* FIXME: Add true switch sup=
port */
3a5b49dc14175d Ben Widawsky 2021-11-19  159  	dev_err(dev, "Devices behind =
switches are currently unsupported\n");
3a5b49dc14175d Ben Widawsky 2021-11-19  160  	rc =3D -ENODEV;
3a5b49dc14175d Ben Widawsky 2021-11-19  161  	goto err_out;
3a5b49dc14175d Ben Widawsky 2021-11-19  162  =

c1dc1914d16616 Ben Widawsky 2021-11-19  163  	/* Walk down from the root po=
rt and add all switches */
c1dc1914d16616 Ben Widawsky 2021-11-19 @164  	cxl_scan_ports(ctx.root_port);
c1dc1914d16616 Ben Widawsky 2021-11-19  165  =

c1dc1914d16616 Ben Widawsky 2021-11-19  166  	/* If parent is a dport the e=
ndpoint is good to go. */
c1dc1914d16616 Ben Widawsky 2021-11-19  167  	parent_port =3D to_cxl_port(d=
ev->parent->parent);
c1dc1914d16616 Ben Widawsky 2021-11-19  168  	dport =3D cxl_find_dport_by_d=
ev(parent_port, dev->parent);
c1dc1914d16616 Ben Widawsky 2021-11-19  169  	if (!dport) {
c1dc1914d16616 Ben Widawsky 2021-11-19  170  		rc =3D -ENODEV;
c1dc1914d16616 Ben Widawsky 2021-11-19  171  		goto err_out;
c1dc1914d16616 Ben Widawsky 2021-11-19  172  	}
c1dc1914d16616 Ben Widawsky 2021-11-19  173  =

c1dc1914d16616 Ben Widawsky 2021-11-19  174  out:
c1dc1914d16616 Ben Widawsky 2021-11-19  175  	rc =3D create_endpoint(dev, p=
arent_port, dport);
c1dc1914d16616 Ben Widawsky 2021-11-19  176  	if (rc)
c1dc1914d16616 Ben Widawsky 2021-11-19  177  		goto err_out;
c1dc1914d16616 Ben Widawsky 2021-11-19  178  =

c1dc1914d16616 Ben Widawsky 2021-11-19  179  	cxlmd->root_port =3D ctx.root=
_port;
c1dc1914d16616 Ben Widawsky 2021-11-19  180  =

c1dc1914d16616 Ben Widawsky 2021-11-19  181  err_out:
c1dc1914d16616 Ben Widawsky 2021-11-19  182  	device_unlock(&hostbridge->de=
v);
c1dc1914d16616 Ben Widawsky 2021-11-19  183  	return rc;
c1dc1914d16616 Ben Widawsky 2021-11-19  184  }
c1dc1914d16616 Ben Widawsky 2021-11-19  185  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============9064132402277043745==--

