Content-Type: multipart/mixed; boundary="===============0134332578343031472=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ethernet: fman: add missing put_device() call in fman_port_probe()
Date: Wed, 08 Dec 2021 06:18:08 +0800
Message-ID: <202112080640.dqIrbaTP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0134332578343031472==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1638881746-3215-1-git-send-email-wangqing@vivo.com>
References: <1638881746-3215-1-git-send-email-wangqing@vivo.com>
TO: Qing Wang <wangqing@vivo.com>
TO: Madalin Bucur <madalin.bucur@nxp.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
TO: linux-kernel(a)vger.kernel.org
CC: Wang Qing <wangqing@vivo.com>

Hi Qing,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16=
-rc4 next-20211207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qing-Wang/ethernet-fman-ad=
d-missing-put_device-call-in-fman_port_probe/20211207-210146
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
1c5526968e270e4efccfa1da21d211a4915cdeda
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-s032-20211207 (https://download.01.org/0day-ci/archi=
ve/20211208/202112080640.dqIrbaTP-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/72dfcb1946c5b8a0eca2806c5=
74922ebbd990b49
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qing-Wang/ethernet-fman-add-missin=
g-put_device-call-in-fman_port_probe/20211207-210146
        git checkout 72dfcb1946c5b8a0eca2806c574922ebbd990b49
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rc SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/freescale/fman/fman_port.c:1903:1: sparse: sparse: =
unused label 'free_port'

vim +/free_port +1903 drivers/net/ethernet/freescale/fman/fman_port.c

880f874cf50568 Yangbo Lu         2018-06-25  1767  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1768  static int fman_port_pro=
be(struct platform_device *of_dev)
18a6c85fcc78dd Igal Liberman     2015-12-21  1769  {
18a6c85fcc78dd Igal Liberman     2015-12-21  1770  	struct fman_port *port;
18a6c85fcc78dd Igal Liberman     2015-12-21  1771  	struct fman *fman;
18a6c85fcc78dd Igal Liberman     2015-12-21  1772  	struct device_node *fm_=
node, *port_node;
0572054617f326 Florinel Iordache 2020-08-03  1773  	struct platform_device =
*fm_pdev;
18a6c85fcc78dd Igal Liberman     2015-12-21  1774  	struct resource res;
18a6c85fcc78dd Igal Liberman     2015-12-21  1775  	struct resource *dev_re=
s;
537a31658f8a01 Madalin Bucur     2016-05-16  1776  	u32 val;
18a6c85fcc78dd Igal Liberman     2015-12-21  1777  	int err =3D 0, lenp;
18a6c85fcc78dd Igal Liberman     2015-12-21  1778  	enum fman_port_type por=
t_type;
18a6c85fcc78dd Igal Liberman     2015-12-21  1779  	u16 port_speed;
18a6c85fcc78dd Igal Liberman     2015-12-21  1780  	u8 port_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1781  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1782  	port =3D kzalloc(sizeof=
(*port), GFP_KERNEL);
18a6c85fcc78dd Igal Liberman     2015-12-21  1783  	if (!port)
18a6c85fcc78dd Igal Liberman     2015-12-21  1784  		return -ENOMEM;
18a6c85fcc78dd Igal Liberman     2015-12-21  1785  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1786  	port->dev =3D &of_dev->=
dev;
18a6c85fcc78dd Igal Liberman     2015-12-21  1787  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1788  	port_node =3D of_node_g=
et(of_dev->dev.of_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1789  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1790  	/* Get the FM node */
18a6c85fcc78dd Igal Liberman     2015-12-21  1791  	fm_node =3D of_get_pare=
nt(port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1792  	if (!fm_node) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1793  		dev_err(port->dev, "%s=
: of_get_parent() failed\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1794  		err =3D -ENODEV;
72dfcb1946c5b8 Wang Qing         2021-12-07  1795  		goto return_of_node_pu=
t;
18a6c85fcc78dd Igal Liberman     2015-12-21  1796  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1797  =

0572054617f326 Florinel Iordache 2020-08-03  1798  	fm_pdev =3D of_find_dev=
ice_by_node(fm_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1799  	of_node_put(fm_node);
0572054617f326 Florinel Iordache 2020-08-03  1800  	if (!fm_pdev) {
0572054617f326 Florinel Iordache 2020-08-03  1801  		err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1802  		goto return_of_node_pu=
t;
0572054617f326 Florinel Iordache 2020-08-03  1803  	}
0572054617f326 Florinel Iordache 2020-08-03  1804  =

0572054617f326 Florinel Iordache 2020-08-03  1805  	fman =3D dev_get_drvdat=
a(&fm_pdev->dev);
18a6c85fcc78dd Igal Liberman     2015-12-21  1806  	if (!fman) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1807  		err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1808  		goto return_of_put_dev=
ice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1809  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1810  =

537a31658f8a01 Madalin Bucur     2016-05-16  1811  	err =3D of_property_rea=
d_u32(port_node, "cell-index", &val);
537a31658f8a01 Madalin Bucur     2016-05-16  1812  	if (err) {
f7ce91038d5278 Rob Herring       2017-07-18  1813  		dev_err(port->dev, "%s=
: reading cell-index for %pOF failed\n",
f7ce91038d5278 Rob Herring       2017-07-18  1814  			__func__, port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21  1815  		err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1816  		goto return_of_put_dev=
ice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1817  	}
537a31658f8a01 Madalin Bucur     2016-05-16  1818  	port_id =3D (u8)val;
18a6c85fcc78dd Igal Liberman     2015-12-21  1819  	port->dts_params.id =3D=
 port_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1820  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1821  	if (of_device_is_compat=
ible(port_node, "fsl,fman-v3-port-tx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1822  		port_type =3D FMAN_POR=
T_TYPE_TX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1823  		port_speed =3D 1000;
537a31658f8a01 Madalin Bucur     2016-05-16  1824  		if (of_find_property(p=
ort_node, "fsl,fman-10g-port", &lenp))
18a6c85fcc78dd Igal Liberman     2015-12-21  1825  			port_speed =3D 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1826  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1827  	} else if (of_device_is=
_compatible(port_node, "fsl,fman-v2-port-tx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1828  		if (port_id >=3D TX_10=
G_PORT_BASE)
18a6c85fcc78dd Igal Liberman     2015-12-21  1829  			port_speed =3D 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1830  		else
18a6c85fcc78dd Igal Liberman     2015-12-21  1831  			port_speed =3D 1000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1832  		port_type =3D FMAN_POR=
T_TYPE_TX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1833  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1834  	} else if (of_device_is=
_compatible(port_node, "fsl,fman-v3-port-rx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1835  		port_type =3D FMAN_POR=
T_TYPE_RX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1836  		port_speed =3D 1000;
537a31658f8a01 Madalin Bucur     2016-05-16  1837  		if (of_find_property(p=
ort_node, "fsl,fman-10g-port", &lenp))
18a6c85fcc78dd Igal Liberman     2015-12-21  1838  			port_speed =3D 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1839  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1840  	} else if (of_device_is=
_compatible(port_node, "fsl,fman-v2-port-rx")) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1841  		if (port_id >=3D RX_10=
G_PORT_BASE)
18a6c85fcc78dd Igal Liberman     2015-12-21  1842  			port_speed =3D 10000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1843  		else
18a6c85fcc78dd Igal Liberman     2015-12-21  1844  			port_speed =3D 1000;
18a6c85fcc78dd Igal Liberman     2015-12-21  1845  		port_type =3D FMAN_POR=
T_TYPE_RX;
18a6c85fcc78dd Igal Liberman     2015-12-21  1846  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1847  	}  else {
18a6c85fcc78dd Igal Liberman     2015-12-21  1848  		dev_err(port->dev, "%s=
: Illegal port type\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1849  		err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1850  		goto return_of_put_dev=
ice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1851  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1852  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1853  	port->dts_params.type =
=3D port_type;
18a6c85fcc78dd Igal Liberman     2015-12-21  1854  	port->dts_params.speed =
=3D port_speed;
18a6c85fcc78dd Igal Liberman     2015-12-21  1855  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1856  	if (port_type =3D=3D FM=
AN_PORT_TYPE_TX) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1857  		u32 qman_channel_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1858  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1859  		qman_channel_id =3D fm=
an_get_qman_channel_id(fman, port_id);
18a6c85fcc78dd Igal Liberman     2015-12-21  1860  		if (qman_channel_id =
=3D=3D 0) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1861  			dev_err(port->dev, "%=
s: incorrect qman-channel-id\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1862  				__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1863  			err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1864  			goto return_of_put_de=
vice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1865  		}
18a6c85fcc78dd Igal Liberman     2015-12-21  1866  		port->dts_params.qman_=
channel_id =3D qman_channel_id;
18a6c85fcc78dd Igal Liberman     2015-12-21  1867  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1868  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1869  	err =3D of_address_to_r=
esource(port_node, 0, &res);
18a6c85fcc78dd Igal Liberman     2015-12-21  1870  	if (err < 0) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1871  		dev_err(port->dev, "%s=
: of_address_to_resource() failed\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1872  			__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1873  		err =3D -ENOMEM;
72dfcb1946c5b8 Wang Qing         2021-12-07  1874  		goto return_of_put_dev=
ice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1875  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1876  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1877  	port->dts_params.fman =
=3D fman;
18a6c85fcc78dd Igal Liberman     2015-12-21  1878  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1879  	dev_res =3D __devm_requ=
est_region(port->dev, &res, res.start,
18a6c85fcc78dd Igal Liberman     2015-12-21  1880  					resource_size(&res)=
, "fman-port");
18a6c85fcc78dd Igal Liberman     2015-12-21  1881  	if (!dev_res) {
18a6c85fcc78dd Igal Liberman     2015-12-21  1882  		dev_err(port->dev, "%s=
: __devm_request_region() failed\n",
18a6c85fcc78dd Igal Liberman     2015-12-21  1883  			__func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1884  		err =3D -EINVAL;
72dfcb1946c5b8 Wang Qing         2021-12-07  1885  		goto return_of_put_dev=
ice;
18a6c85fcc78dd Igal Liberman     2015-12-21  1886  	}
18a6c85fcc78dd Igal Liberman     2015-12-21  1887  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1888  	port->dts_params.base_a=
ddr =3D devm_ioremap(port->dev, res.start,
18a6c85fcc78dd Igal Liberman     2015-12-21  1889  						  resource_size(&r=
es));
5df6f7fa47e030 Madalin Bucur     2016-03-22  1890  	if (!port->dts_params.b=
ase_addr)
18a6c85fcc78dd Igal Liberman     2015-12-21  1891  		dev_err(port->dev, "%s=
: devm_ioremap() failed\n", __func__);
18a6c85fcc78dd Igal Liberman     2015-12-21  1892  =

72dfcb1946c5b8 Wang Qing         2021-12-07  1893  	of_node_put(port_node);
72dfcb1946c5b8 Wang Qing         2021-12-07  1894  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1895  	dev_set_drvdata(&of_dev=
->dev, port);
18a6c85fcc78dd Igal Liberman     2015-12-21  1896  =

18a6c85fcc78dd Igal Liberman     2015-12-21  1897  	return 0;
18a6c85fcc78dd Igal Liberman     2015-12-21  1898  =

72dfcb1946c5b8 Wang Qing         2021-12-07  1899  return_of_put_device:
72dfcb1946c5b8 Wang Qing         2021-12-07  1900  	put_device(&fm_pdev->de=
v);
72dfcb1946c5b8 Wang Qing         2021-12-07  1901  return_of_node_put:
18a6c85fcc78dd Igal Liberman     2015-12-21  1902  	of_node_put(port_node);
18a6c85fcc78dd Igal Liberman     2015-12-21 @1903  free_port:
18a6c85fcc78dd Igal Liberman     2015-12-21  1904  	kfree(port);
18a6c85fcc78dd Igal Liberman     2015-12-21  1905  	return err;
18a6c85fcc78dd Igal Liberman     2015-12-21  1906  }
18a6c85fcc78dd Igal Liberman     2015-12-21  1907  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0134332578343031472==--

