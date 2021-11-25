Content-Type: multipart/mixed; boundary="===============4028991060444758364=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 14/23] cxl: Introduce topology host registration
Date: Fri, 26 Nov 2021 05:53:06 +0800
Message-ID: <202111260523.BAvGTRJR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4028991060444758364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211120000250.1663391-15-ben.widawsky@intel.com>
References: <20211120000250.1663391-15-ben.widawsky@intel.com>
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
chive/20211126/202111260523.BAvGTRJR-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/cxl/acpi.c:399 cxl_acpi_probe() error: uninitialized symbol 'root_p=
ort'.

vim +/root_port +399 drivers/cxl/acpi.c

6b4661f8037e4f Ben Widawsky     2021-11-19  382  =

4812be97c015bd Dan Williams     2021-06-09  383  static int cxl_acpi_probe(=
struct platform_device *pdev)
4812be97c015bd Dan Williams     2021-06-09  384  {
3b94ce7b7bc1b4 Dan Williams     2021-06-09  385  	int rc;
4812be97c015bd Dan Williams     2021-06-09  386  	struct cxl_port *root_por=
t;
4812be97c015bd Dan Williams     2021-06-09  387  	struct device *host =3D &=
pdev->dev;
7d4b5ca2e2cb5d Dan Williams     2021-06-09  388  	struct acpi_device *adev =
=3D ACPI_COMPANION(host);
f4ce1f766f1ebf Dan Williams     2021-10-29  389  	struct cxl_cfmws_context =
ctx;
4812be97c015bd Dan Williams     2021-06-09  390  =

6b4661f8037e4f Ben Widawsky     2021-11-19  391  	rc =3D cxl_register_topol=
ogy_host(host);
6b4661f8037e4f Ben Widawsky     2021-11-19  392  	if (rc)
6b4661f8037e4f Ben Widawsky     2021-11-19  393  		return rc;
6b4661f8037e4f Ben Widawsky     2021-11-19  394  =

6b4661f8037e4f Ben Widawsky     2021-11-19  395  	rc =3D devm_add_action_or=
_reset(host, clear_topology_host, host);
6b4661f8037e4f Ben Widawsky     2021-11-19  396  	if (rc)
6b4661f8037e4f Ben Widawsky     2021-11-19  397  		return rc;
6b4661f8037e4f Ben Widawsky     2021-11-19  398  =

6b4661f8037e4f Ben Widawsky     2021-11-19 @399  	root_port =3D devm_cxl_ad=
d_port(host, CXL_RESOURCE_NONE, root_port);
4812be97c015bd Dan Williams     2021-06-09  400  	if (IS_ERR(root_port))
4812be97c015bd Dan Williams     2021-06-09  401  		return PTR_ERR(root_port=
);
4812be97c015bd Dan Williams     2021-06-09  402  	dev_dbg(host, "add: %s\n"=
, dev_name(&root_port->dev));
4812be97c015bd Dan Williams     2021-06-09  403  =

3b94ce7b7bc1b4 Dan Williams     2021-06-09  404  	rc =3D bus_for_each_dev(a=
dev->dev.bus, NULL, root_port,
7d4b5ca2e2cb5d Dan Williams     2021-06-09  405  			      add_host_bridge_d=
port);
f4ce1f766f1ebf Dan Williams     2021-10-29  406  	if (rc < 0)
f4ce1f766f1ebf Dan Williams     2021-10-29  407  		return rc;
3b94ce7b7bc1b4 Dan Williams     2021-06-09  408  =

f4ce1f766f1ebf Dan Williams     2021-10-29  409  	ctx =3D (struct cxl_cfmws=
_context) {
f4ce1f766f1ebf Dan Williams     2021-10-29  410  		.dev =3D host,
f4ce1f766f1ebf Dan Williams     2021-10-29  411  		.root_port =3D root_port,
f4ce1f766f1ebf Dan Williams     2021-10-29  412  	};
f4ce1f766f1ebf Dan Williams     2021-10-29  413  	acpi_table_parse_cedt(ACP=
I_CEDT_TYPE_CFMWS, cxl_parse_cfmws, &ctx);
3e23d17ce1980c Alison Schofield 2021-06-17  414  =

3b94ce7b7bc1b4 Dan Williams     2021-06-09  415  	/*
3b94ce7b7bc1b4 Dan Williams     2021-06-09  416  	 * Root level scanned wit=
h host-bridge as dports, now scan host-bridges
3b94ce7b7bc1b4 Dan Williams     2021-06-09  417  	 * for their role as CXL =
uports to their CXL-capable PCIe Root Ports.
3b94ce7b7bc1b4 Dan Williams     2021-06-09  418  	 */
8fdcb1704f61a8 Dan Williams     2021-06-15  419  	rc =3D bus_for_each_dev(a=
dev->dev.bus, NULL, root_port,
3b94ce7b7bc1b4 Dan Williams     2021-06-09  420  			      add_host_bridge_u=
port);
f4ce1f766f1ebf Dan Williams     2021-10-29  421  	if (rc < 0)
f4ce1f766f1ebf Dan Williams     2021-10-29  422  		return rc;
8fdcb1704f61a8 Dan Williams     2021-06-15  423  =

8fdcb1704f61a8 Dan Williams     2021-06-15  424  	if (IS_ENABLED(CONFIG_CXL=
_PMEM))
8fdcb1704f61a8 Dan Williams     2021-06-15  425  		rc =3D device_for_each_c=
hild(&root_port->dev, root_port,
8fdcb1704f61a8 Dan Williams     2021-06-15  426  					   add_root_nvdimm_br=
idge);
8fdcb1704f61a8 Dan Williams     2021-06-15  427  	if (rc < 0)
8fdcb1704f61a8 Dan Williams     2021-06-15  428  		return rc;
f4ce1f766f1ebf Dan Williams     2021-10-29  429  =

8fdcb1704f61a8 Dan Williams     2021-06-15  430  	return 0;
4812be97c015bd Dan Williams     2021-06-09  431  }
4812be97c015bd Dan Williams     2021-06-09  432  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============4028991060444758364==--

