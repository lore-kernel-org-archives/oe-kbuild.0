Content-Type: multipart/mixed; boundary="===============6120146797454412904=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/dsa/realtek/rtl8365mb.c:770:12: warning: dereference of NULL 'dp' [CWE-476]
Date: Sun, 19 Jun 2022 17:09:48 +0800
Message-ID: <202206191730.d3xC2PWx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6120146797454412904==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/n=
et/dsa/realtek/rtl8365mb.c:770:12: warning: dereference of NULL 'dp' [CWE-4=
76] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Angelo Daros de Luca <luizluca@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: aac94001067da183455d6d37959892744fa01d9d net: dsa: realtek: add new=
 mdio interface for drivers
date:   5 months ago
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220619/202206191730.d3xC2PWx-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Daac94001067da183455d6d37959892744fa01d9d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout aac94001067da183455d6d37959892744fa01d9d
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from drivers/net/dsa/realtek/realtek.h:14,
                    from drivers/net/dsa/realtek/rtl8365mb.c:102:
   In function 'rtl8365mb_stats_setup':
   include/net/dsa.h:483:34: warning: dereference of NULL '0' [CWE-476] [-W=
analyzer-null-dereference]
     483 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYPE_UNU=
SED;
         |                ~~~~~~~~~~~~~~~~~~^~~~~~
     'rtl8365mb_stats_setup': events 1-2
       |
       |drivers/net/dsa/realtek/rtl8365mb.c:1434:23:
       | 1434 |         for (i =3D 0; i < priv->num_ports; i++) {
       |      |                     ~~^~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (1) following 'true' branch...
       |......
       | 1437 |                 if (dsa_is_unused_port(priv->ds, i))
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) ...to here
       |
     'rtl8365mb_stats_setup': event 3
       |
       |include/net/dsa.h:483:34:
       |  483 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYP=
E_UNUSED;
       |      |                ~~~~~~~~~~~~~~~~~~^~~~~~
       |      |                                  |
       |      |                                  (3) dereference of NULL 'd=
sa_to_port(*priv.ds,  i)'
       |
   In function 'rtl8365mb_stats_teardown':
   include/net/dsa.h:483:34: warning: dereference of NULL '0' [CWE-476] [-W=
analyzer-null-dereference]
     483 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYPE_UNU=
SED;
         |                ~~~~~~~~~~~~~~~~~~^~~~~~
     'rtl8365mb_stats_teardown': events 1-2
       |
       |drivers/net/dsa/realtek/rtl8365mb.c:1455:23:
       | 1455 |         for (i =3D 0; i < priv->num_ports; i++) {
       |      |                     ~~^~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (1) following 'true' branch...
       |......
       | 1458 |                 if (dsa_is_unused_port(priv->ds, i))
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (2) ...to here
       |
     'rtl8365mb_stats_teardown': event 3
       |
       |include/net/dsa.h:483:34:
       |  483 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYP=
E_UNUSED;
       |      |                ~~~~~~~~~~~~~~~~~~^~~~~~
       |      |                                  |
       |      |                                  (3) dereference of NULL 'd=
sa_to_port(*priv.ds,  i)'
       |
   In function 'rtl8365mb_phy_mode_supported':
   include/net/dsa.h:498:34: warning: dereference of NULL '0' [CWE-476] [-W=
analyzer-null-dereference]
     498 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYPE_USE=
R;
         |                ~~~~~~~~~~~~~~~~~~^~~~~~
     'rtl8365mb_phy_mode_supported': event 1
       |
       |  498 |         return dsa_to_port(ds, p)->type =3D=3D DSA_PORT_TYP=
E_USER;
       |      |                ~~~~~~~~~~~~~~~~~~^~~~~~
       |      |                                  |
       |      |                                  (1) dereference of NULL 'd=
sa_to_port(ds,  port)'
       |
   In function 'rtl8365mb_ext_config_rgmii':
>> drivers/net/dsa/realtek/rtl8365mb.c:770:12: warning: dereference of NULL=
 'dp' [CWE-476] [-Wanalyzer-null-dereference]
     770 |         dn =3D dp->dn;
         |         ~~~^~~~~~~~
     'rtl8365mb_ext_config_rgmii': events 1-3
       |
       |  762 |         if (port =3D=3D priv->cpu_port) {
       |      |            ^
       |      |            |
       |      |            (1) following 'true' branch...
       |......
       |  769 |         dp =3D dsa_to_port(priv->ds, port);
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |              |
       |      |              (2) ...to here
       |  770 |         dn =3D dp->dn;
       |      |         ~~~~~~~~~~~
       |      |            |
       |      |            (3) dereference of NULL 'dp'
       |

vim +/dp +770 drivers/net/dsa/realtek/rtl8365mb.c

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  750  =

f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  751  static int rtl8365mb_ext_config_rgmii(struct realtek_pri=
v *priv, int port,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  752  				      phy_interface_t interface)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  753  {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  754  	struct device_node *dn;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  755  	struct dsa_port *dp;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  756  	int tx_delay =3D 0;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  757  	int rx_delay =3D 0;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  758  	int ext_port;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  759  	u32 val;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  760  	int ret;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  761  =

f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  762  	if (port =3D=3D priv->cpu_port) {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  763  		ext_port =3D 1;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  764  	} else {
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  765  		dev_err(priv->dev, "only one EXT port is currently sup=
ported\n");
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  766  		return -EINVAL;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  767  	}
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  768  =

f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  769  	dp =3D dsa_to_port(priv->ds, port);
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18 @770  	dn =3D dp->dn;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  771  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  772  	/* Set the RGMII TX/RX delay
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  773  	 *
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  774  	 * The Realtek vendor driver indicates the followi=
ng possible
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  775  	 * configuration settings:
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  776  	 *
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  777  	 *   TX delay:
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  778  	 *     0 =3D no delay, 1 =3D 2 ns delay
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  779  	 *   RX delay:
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  780  	 *     0 =3D no delay, 7 =3D maximum delay
ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  781  	 *     Each step is approximately 0.3 ns, so the m=
aximum delay is about
ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  782  	 *     2.1 ns.
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  783  	 *
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  784  	 * The vendor driver also states that this must be=
 configured *before*
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  785  	 * forcing the external interface into a particula=
r mode, which is done
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  786  	 * in the rtl8365mb_phylink_mac_link_{up,down} fun=
ctions.
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  787  	 *
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  788  	 * Only configure an RGMII TX (resp. RX) delay if =
the
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  789  	 * tx-internal-delay-ps (resp. rx-internal-delay-p=
s) OF property is
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  790  	 * specified. We ignore the detail of the RGMII in=
terface mode
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  791  	 * (RGMII_{RXID, TXID, etc.}), as this is consider=
ed to be a PHY-only
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  792  	 * property.
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  793  	 */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  794  	if (!of_property_read_u32(dn, "tx-internal-delay-p=
s", &val)) {
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  795  		val =3D val / 1000; /* convert to ns */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  796  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  797  		if (val =3D=3D 0 || val =3D=3D 2)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  798  			tx_delay =3D val / 2;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  799  		else
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  800  			dev_warn(priv->dev,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  801  				 "EXT port TX delay must be 0 or 2 ns\n");
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  802  	}
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  803  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  804  	if (!of_property_read_u32(dn, "rx-internal-delay-p=
s", &val)) {
ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  805  		val =3D DIV_ROUND_CLOSEST(val, 300); /* convert t=
o 0.3 ns step */
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  806  =

ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  807  		if (val <=3D 7)
ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  808  			rx_delay =3D val;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  809  		else
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  810  			dev_warn(priv->dev,
ef136837aaf6f3 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-11-29  811  				 "EXT port RX delay must be 0 to 2.1 ns\n");
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  812  	}
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  813  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  814  	ret =3D regmap_update_bits(
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  815  		priv->map, RTL8365MB_EXT_RGMXF_REG(ext_port),
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  816  		RTL8365MB_EXT_RGMXF_TXDELAY_MASK |
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  817  			RTL8365MB_EXT_RGMXF_RXDELAY_MASK,
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  818  		FIELD_PREP(RTL8365MB_EXT_RGMXF_TXDELAY_MASK, tx_d=
elay) |
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  819  			FIELD_PREP(RTL8365MB_EXT_RGMXF_RXDELAY_MASK, rx_=
delay));
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  820  	if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  821  		return ret;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  822  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  823  	ret =3D regmap_update_bits(
f5f119077b1cd6 drivers/net/dsa/realtek/rtl8365mb.c Luiz Angelo Daros de Luc=
a 2022-01-28  824  		priv->map, RTL8365MB_DIGITAL_INTERFACE_SELECT_REG(ext_=
port),
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  825  		RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_MASK(ext_=
port),
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  826  		RTL8365MB_EXT_PORT_MODE_RGMII
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  827  			<< RTL8365MB_DIGITAL_INTERFACE_SELECT_MODE_OFFSE=
T(
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  828  				   ext_port));
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  829  	if (ret)
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  830  		return ret;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  831  =

4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  832  	return 0;
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  833  }
4af2950c50c863 drivers/net/dsa/rtl8365mb.c         Alvin =C5=A0ipraga      =
       2021-10-18  834  =


:::::: The code@line 770 was first introduced by commit
:::::: 4af2950c50c8634ed2865cf81e607034f78b84aa net: dsa: realtek-smi: add =
rtl8365mb subdriver for RTL8365MB-VC

:::::: TO: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6120146797454412904==--

