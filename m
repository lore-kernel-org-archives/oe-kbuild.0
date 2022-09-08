Content-Type: multipart/mixed; boundary="===============5156090406290021775=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [net-next v7 2/3] net: ethernet: adi: Add ADIN1110 support
Date: Thu, 08 Sep 2022 22:03:22 +0800
Message-ID: <202209082103.3DrECzYZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5156090406290021775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906082203.19572-3-andrei.tachici@stud.acs.upb.ro>
References: <20220906082203.19572-3-andrei.tachici@stud.acs.upb.ro>
TO: andrei.tachici(a)stud.acs.upb.ro
TO: linux-kernel(a)vger.kernel.org
CC: andrew(a)lunn.ch
CC: hkallweit1(a)gmail.com
CC: linux(a)armlinux.org.uk
CC: davem(a)davemloft.net
CC: edumazet(a)google.com
CC: kuba(a)kernel.org
CC: pabeni(a)redhat.com
CC: netdev(a)vger.kernel.org
CC: vegard.nossum(a)oracle.com
CC: joel(a)jms.id.au
CC: l.stelmach(a)samsung.com
CC: robh+dt(a)kernel.org
CC: krzysztof.kozlowski+dt(a)linaro.org
CC: devicetree(a)vger.kernel.org

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/andrei-tachici-stud-=
acs-upb-ro/net-ethernet-adi-Add-ADIN1110-support/20220906-162644
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
d5edc797ef0341ae2c8d4afaad9363edbf487a3a
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m041-20220907 (https://download.01.org/0day-ci/=
archive/20220908/202209082103.3DrECzYZ-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/adi/adin1110.c:1214 adin1110_port_set_blocking_state()=
 warn: inconsistent returns '&priv->lock'.

vim +1214 drivers/net/ethernet/adi/adin1110.c

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1184  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1185  static int adin1110_por=
t_set_blocking_state(struct adin1110_port_priv *port_priv)
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1186  {
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1187  	u8 mac[ETH_ALEN] =3D {=
0x01, 0x80, 0xC2, 0x00, 0x00, 0x00};
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1188  	struct adin1110_priv *=
priv =3D port_priv->priv;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1189  	u8 mask[ETH_ALEN];
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1190  	u32 port_rules;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1191  	int mac_slot;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1192  	int ret;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1193  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1194  	port_priv->state =3D B=
R_STATE_BLOCKING;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1195  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1196  	mutex_lock(&priv->lock=
);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1197  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1198  	mac_slot =3D (!port_pr=
iv->nr) ?  ADIN_MAC_P1_ADDR_SLOT : ADIN_MAC_P2_ADDR_SLOT;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1199  	ret =3D adin1110_clear=
_mac_address(priv, mac_slot);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1200  	if (ret < 0)
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1201  		goto out;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1202  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1203  	ret =3D adin1110_hw_fo=
rwarding(priv, false);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1204  	if (ret < 0)
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1205  		return ret;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1206  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1207  	/* Allow only BPDUs to=
 be passed to the CPU */
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1208  	memset(mask, 0xFF, ETH=
_ALEN);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1209  	port_rules =3D adin111=
0_port_rules(port_priv, true, false);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1210  	ret =3D adin1110_write=
_mac_address(port_priv, mac_slot, mac, mask, port_rules);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1211  out:
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1212  	mutex_unlock(&priv->lo=
ck);
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1213  =

5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06 @1214  	return ret;
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1215  }
5c0e7bfee3f1b2f Alexandru Tachici 2022-09-06  1216  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5156090406290021775==--

