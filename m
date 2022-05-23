Content-Type: multipart/mixed; boundary="===============0591803502572235662=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/3] phy: handle optional regulator for PHY
Date: Mon, 23 May 2022 20:06:07 +0800
Message-ID: <202205231956.1Gkpf9qU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0591803502572235662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220523052807.4044800-3-clabbe@baylibre.com>
References: <20220523052807.4044800-3-clabbe@baylibre.com>
TO: Corentin Labbe <clabbe@baylibre.com>
TO: andrew(a)lunn.ch
TO: broonie(a)kernel.org
TO: calvin.johnson(a)oss.nxp.com
TO: davem(a)davemloft.net
TO: edumazet(a)google.com
TO: hkallweit1(a)gmail.com
TO: jernej.skrabec(a)gmail.com
TO: krzysztof.kozlowski+dt(a)linaro.org
TO: kuba(a)kernel.org
TO: lgirdwood(a)gmail.com
TO: linux(a)armlinux.org.uk
TO: pabeni(a)redhat.com
TO: robh+dt(a)kernel.org
TO: samuel(a)sholland.org
TO: wens(a)csie.org
CC: devicetree(a)vger.kernel.org
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-sunxi(a)lists.linux.dev
CC: netdev(a)vger.kernel.org
CC: Corentin Labbe <clabbe@baylibre.com>

Hi Corentin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on sunxi/sunxi/for-next linus/master v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Corentin-Labbe/arm64=
-add-ethernet-to-orange-pi-3/20220523-133344
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.g=
it for-next
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: s390-randconfig-m031-20220522 (https://download.01.org/0day-ci/arch=
ive/20220523/202205231956.1Gkpf9qU-lkp(a)intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/mdio/fwnode_mdio.c:134 fwnode_mdiobus_register_phy() error: uni=
nitialized symbol 'consumers'.

vim +/consumers +134 drivers/net/mdio/fwnode_mdio.c

bc1bee3b87ee48 Calvin Johnson 2021-06-11   85  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11   86  int fwnode_mdiobus_register_=
phy(struct mii_bus *bus,
bc1bee3b87ee48 Calvin Johnson 2021-06-11   87  				struct fwnode_handle *ch=
ild, u32 addr)
bc1bee3b87ee48 Calvin Johnson 2021-06-11   88  {
bc1bee3b87ee48 Calvin Johnson 2021-06-11   89  	struct mii_timestamper *mii=
_ts =3D NULL;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   90  	struct phy_device *phy;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   91  	bool is_c45 =3D false;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   92  	u32 phy_id;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   93  	int rc, reg_cnt =3D 0;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   94  	struct regulator_bulk_data =
*consumers;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   95  	struct device_node *nchild =
=3D NULL;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23   96  	u32 reg;
bc1bee3b87ee48 Calvin Johnson 2021-06-11   97  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11   98  	mii_ts =3D fwnode_find_mii_=
timestamper(child);
bc1bee3b87ee48 Calvin Johnson 2021-06-11   99  	if (IS_ERR(mii_ts))
bc1bee3b87ee48 Calvin Johnson 2021-06-11  100  		return PTR_ERR(mii_ts);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  101  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11  102  	rc =3D fwnode_property_matc=
h_string(child, "compatible",
bc1bee3b87ee48 Calvin Johnson 2021-06-11  103  					  "ethernet-phy-ieee802=
.3-c45");
bc1bee3b87ee48 Calvin Johnson 2021-06-11  104  	if (rc >=3D 0)
bc1bee3b87ee48 Calvin Johnson 2021-06-11  105  		is_c45 =3D true;
bc1bee3b87ee48 Calvin Johnson 2021-06-11  106  =

7ae2ab7d1efe80 Corentin Labbe 2022-05-23  107  	for_each_child_of_node(bus-=
>dev.of_node, nchild) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  108  		of_property_read_u32(nchil=
d, "reg", &reg);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  109  		if (reg !=3D addr)
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  110  			continue;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  111  		reg_cnt =3D regulator_bulk=
_get_all(&bus->dev, nchild, &consumers);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  112  		if (reg_cnt > 0) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  113  			rc =3D regulator_bulk_ena=
ble(reg_cnt, consumers);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  114  			if (rc)
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  115  				return rc;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  116  		}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  117  		if (reg_cnt < 0) {
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  118  			dev_err(&bus->dev, "Fail =
to regulator_bulk_get_all err=3D%d\n", reg_cnt);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  119  			return reg_cnt;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  120  		}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  121  	}
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  122  =

bc1bee3b87ee48 Calvin Johnson 2021-06-11  123  	if (is_c45 || fwnode_get_ph=
y_id(child, &phy_id))
bc1bee3b87ee48 Calvin Johnson 2021-06-11  124  		phy =3D get_phy_device(bus=
, addr, is_c45);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  125  	else
bc1bee3b87ee48 Calvin Johnson 2021-06-11  126  		phy =3D phy_device_create(=
bus, addr, phy_id, 0, NULL);
bc1bee3b87ee48 Calvin Johnson 2021-06-11  127  	if (IS_ERR(phy)) {
bc1bee3b87ee48 Calvin Johnson 2021-06-11  128  		unregister_mii_timestamper=
(mii_ts);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  129  		rc =3D PTR_ERR(phy);
7ae2ab7d1efe80 Corentin Labbe 2022-05-23  130  		goto error;
bc1bee3b87ee48 Calvin Johnson 2021-06-11  131  	}
bc1bee3b87ee48 Calvin Johnson 2021-06-11  132  =

7ae2ab7d1efe80 Corentin Labbe 2022-05-23  133  	phy->regulator_cnt =3D reg_=
cnt;
7ae2ab7d1efe80 Corentin Labbe 2022-05-23 @134  	phy->consumers =3D consumer=
s;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0591803502572235662==--

