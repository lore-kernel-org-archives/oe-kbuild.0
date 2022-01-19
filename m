Content-Type: multipart/mixed; boundary="===============5416493966495699525=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rmk-arm:zii 131/170] drivers/net/phy/sfp.c:1966 sfp_print_module_info() warn: format string contains non-ascii character 'xc2'
Date: Thu, 20 Jan 2022 06:35:48 +0800
Message-ID: <202201200629.EZyBBFRj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5416493966495699525==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Russell King <rmk+kernel@arm.linux.org.uk>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   c5355f4cb01839224fbbaa63901c2c2253507548
commit: fec419608c5118e37e2263c3140cc3c5e1990ef1 [131/170] net: sfp: displa=
y SFP module information       [*not for mainline*]
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-m021-20220117 (https://download.01.org/0day-ci/arch=
ive/20220120/202201200629.EZyBBFRj-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
show-warning-context "warning-lines" files

vim +/xc2 +1966 drivers/net/phy/sfp.c

b18432c5a49c94 Chris Healy  2020-07-14  1892  =

fec419608c5118 Russell King 2015-09-13  1893  static void sfp_print_module_=
info(struct sfp *sfp, const struct sfp_eeprom_id *id, bool cotsworks)
fec419608c5118 Russell King 2015-09-13  1894  {
fec419608c5118 Russell King 2015-09-13  1895  	unsigned int br_nom, br_min,=
 br_max;
fec419608c5118 Russell King 2015-09-13  1896  	char date[9];
fec419608c5118 Russell King 2015-09-13  1897  	char options[80];
fec419608c5118 Russell King 2015-09-13  1898  =

fec419608c5118 Russell King 2015-09-13  1899  	/* Cotsworks also gets the d=
ate code wrong. */
fec419608c5118 Russell King 2015-09-13  1900  	date[0] =3D id->ext.datecode=
[4 - 2 * cotsworks];
fec419608c5118 Russell King 2015-09-13  1901  	date[1] =3D id->ext.datecode=
[5 - 2 * cotsworks];
fec419608c5118 Russell King 2015-09-13  1902  	date[2] =3D '-';
fec419608c5118 Russell King 2015-09-13  1903  	date[3] =3D id->ext.datecode=
[2 + 2 * cotsworks];
fec419608c5118 Russell King 2015-09-13  1904  	date[4] =3D id->ext.datecode=
[3 + 2 * cotsworks];
fec419608c5118 Russell King 2015-09-13  1905  	date[5] =3D '-';
fec419608c5118 Russell King 2015-09-13  1906  	date[6] =3D id->ext.datecode=
[0];
fec419608c5118 Russell King 2015-09-13  1907  	date[7] =3D id->ext.datecode=
[1];
fec419608c5118 Russell King 2015-09-13  1908  	date[8] =3D '\0';
fec419608c5118 Russell King 2015-09-13  1909  =

fec419608c5118 Russell King 2015-09-13  1910  	if (id->base.br_nominal =3D=
=3D 0) {
fec419608c5118 Russell King 2015-09-13  1911  		br_min =3D br_nom =3D br_ma=
x =3D 0;
fec419608c5118 Russell King 2015-09-13  1912  	} else if (id->base.br_nomin=
al =3D=3D 255) {
fec419608c5118 Russell King 2015-09-13  1913  		br_nom =3D 250 * id->ext.br=
_max;
fec419608c5118 Russell King 2015-09-13  1914  		br_max =3D br_nom + br_nom =
* id->ext.br_min / 100;
fec419608c5118 Russell King 2015-09-13  1915  		br_min =3D br_nom - br_nom =
* id->ext.br_min / 100;
fec419608c5118 Russell King 2015-09-13  1916  	} else {
fec419608c5118 Russell King 2015-09-13  1917  		br_nom =3D id->base.br_nomi=
nal * 100;
fec419608c5118 Russell King 2015-09-13  1918  		br_min =3D br_nom - id->bas=
e.br_nominal * id->ext.br_min;
fec419608c5118 Russell King 2015-09-13  1919  		br_max =3D br_nom + id->bas=
e.br_nominal * id->ext.br_max;
fec419608c5118 Russell King 2015-09-13  1920  	}
fec419608c5118 Russell King 2015-09-13  1921  =

fec419608c5118 Russell King 2015-09-13  1922  	dev_info(sfp->dev, "module %=
.*s %.*s rev %.*s sn %.*s dc %s\n",
fec419608c5118 Russell King 2015-09-13  1923  		 (int)sizeof(id->base.vendo=
r_name), id->base.vendor_name,
fec419608c5118 Russell King 2015-09-13  1924  		 (int)sizeof(id->base.vendo=
r_pn), id->base.vendor_pn,
fec419608c5118 Russell King 2015-09-13  1925  		 (int)sizeof(id->base.vendo=
r_rev), id->base.vendor_rev,
fec419608c5118 Russell King 2015-09-13  1926  		 (int)sizeof(id->ext.vendor=
_sn), id->ext.vendor_sn, date);
fec419608c5118 Russell King 2015-09-13  1927  	dev_info(sfp->dev, "  %s con=
nector, encoding %s, bitrate %u.%03u (%u.%03u-%u.%03u) Gbps\n",
fec419608c5118 Russell King 2015-09-13  1928  		 sff_connector(id->base.con=
nector),
fec419608c5118 Russell King 2015-09-13  1929  		 sff_encoding(id->base.enco=
ding),
fec419608c5118 Russell King 2015-09-13  1930  		 br_nom / 1000, br_nom % 10=
00,
fec419608c5118 Russell King 2015-09-13  1931  		 br_min / 1000, br_min % 10=
00, br_max / 1000, br_max % 1000);
fec419608c5118 Russell King 2015-09-13  1932  	dev_info(sfp->dev, "  1000Ba=
seSX%c 1000BaseLX%c 1000BaseCX%c 1000BaseT%c 100BaseLX%c 100BaseFX%c BaseBX=
10%c BasePX%c\n",
fec419608c5118 Russell King 2015-09-13  1933  		 id->base.e1000_base_sx ? '=
+' : '-',
fec419608c5118 Russell King 2015-09-13  1934  		 id->base.e1000_base_lx ? '=
+' : '-',
fec419608c5118 Russell King 2015-09-13  1935  		 id->base.e1000_base_cx ? '=
+' : '-',
fec419608c5118 Russell King 2015-09-13  1936  		 id->base.e1000_base_t ? '+=
' : '-',
fec419608c5118 Russell King 2015-09-13  1937  		 id->base.e100_base_lx ? '+=
' : '-',
fec419608c5118 Russell King 2015-09-13  1938  		 id->base.e100_base_fx ? '+=
' : '-',
fec419608c5118 Russell King 2015-09-13  1939  		 id->base.e_base_bx10 ? '+'=
 : '-',
fec419608c5118 Russell King 2015-09-13  1940  		 id->base.e_base_px ? '+' :=
 '-');
fec419608c5118 Russell King 2015-09-13  1941  	dev_info(sfp->dev, "  10GBas=
eSR%c 10GBaseLR%c 10GBaseLRM%c 10GBaseER%c\n",
fec419608c5118 Russell King 2015-09-13  1942  		 id->base.e10g_base_sr ? '+=
' : '-',
fec419608c5118 Russell King 2015-09-13  1943  		 id->base.e10g_base_lr ? '+=
' : '-',
fec419608c5118 Russell King 2015-09-13  1944  		 id->base.e10g_base_lrm ? '=
+' : '-',
fec419608c5118 Russell King 2015-09-13  1945  		 id->base.e10g_base_er ? '+=
' : '-');
fec419608c5118 Russell King 2015-09-13  1946  =

fec419608c5118 Russell King 2015-09-13  1947  	if (!id->base.sfp_ct_passive=
 && !id->base.sfp_ct_active &&
fec419608c5118 Russell King 2015-09-13  1948  	    !id->base.e1000_base_t) {
fec419608c5118 Russell King 2015-09-13  1949  		char len_9um[16], len_om[16=
];
fec419608c5118 Russell King 2015-09-13  1950  =

fec419608c5118 Russell King 2015-09-13  1951  		dev_info(sfp->dev, "  Wavel=
ength %unm, fiber lengths:\n",
fec419608c5118 Russell King 2015-09-13  1952  			 be16_to_cpup(&id->base.op=
tical_wavelength));
fec419608c5118 Russell King 2015-09-13  1953  =

fec419608c5118 Russell King 2015-09-13  1954  		if (id->base.link_len[0] =
=3D=3D 255)
fec419608c5118 Russell King 2015-09-13  1955  			strcpy(len_9um, ">254km");
fec419608c5118 Russell King 2015-09-13  1956  		else if (id->base.link_len[=
1] && id->base.link_len[1] !=3D 255)
fec419608c5118 Russell King 2015-09-13  1957  			sprintf(len_9um, "%um",
fec419608c5118 Russell King 2015-09-13  1958  				id->base.link_len[1] * 10=
0);
fec419608c5118 Russell King 2015-09-13  1959  		else if (id->base.link_len[=
0])
fec419608c5118 Russell King 2015-09-13  1960  			sprintf(len_9um, "%ukm", i=
d->base.link_len[0]);
fec419608c5118 Russell King 2015-09-13  1961  		else if (id->base.link_len[=
1] =3D=3D 255)
fec419608c5118 Russell King 2015-09-13  1962  			strcpy(len_9um, ">25.4km");
fec419608c5118 Russell King 2015-09-13  1963  		else
fec419608c5118 Russell King 2015-09-13  1964  			strcpy(len_9um, "unsupport=
ed");
fec419608c5118 Russell King 2015-09-13  1965  =

fec419608c5118 Russell King 2015-09-13 @1966  		dev_info(sfp->dev, "    9=
=C2=B5m SM    : %s\n", len_9um);
fec419608c5118 Russell King 2015-09-13  1967  		dev_info(sfp->dev, " 62.5=
=C2=B5m MM OM1: %s\n",
fec419608c5118 Russell King 2015-09-13  1968  			 sff_link_len(len_om, size=
of(len_om),
fec419608c5118 Russell King 2015-09-13  1969  				      id->base.link_len[3=
], 10));
fec419608c5118 Russell King 2015-09-13  1970  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM2: %s\n",
fec419608c5118 Russell King 2015-09-13  1971  			 sff_link_len(len_om, size=
of(len_om),
fec419608c5118 Russell King 2015-09-13  1972  				      id->base.link_len[2=
], 10));
fec419608c5118 Russell King 2015-09-13  1973  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM3: %s\n",
fec419608c5118 Russell King 2015-09-13  1974  			 sff_link_len(len_om, size=
of(len_om),
fec419608c5118 Russell King 2015-09-13  1975  				      id->base.link_len[5=
], 10));
fec419608c5118 Russell King 2015-09-13  1976  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM4: %s\n",
fec419608c5118 Russell King 2015-09-13  1977  			 sff_link_len(len_om, size=
of(len_om),
fec419608c5118 Russell King 2015-09-13  1978  				      id->base.link_len[4=
], 10));
fec419608c5118 Russell King 2015-09-13  1979  	} else {
fec419608c5118 Russell King 2015-09-13  1980  		char len[16];
fec419608c5118 Russell King 2015-09-13  1981  		dev_info(sfp->dev, "  Coppe=
r length: %s\n",
fec419608c5118 Russell King 2015-09-13  1982  			 sff_link_len(len, sizeof(=
len),
fec419608c5118 Russell King 2015-09-13  1983  				      id->base.link_len[4=
], 1));
fec419608c5118 Russell King 2015-09-13  1984  	}
fec419608c5118 Russell King 2015-09-13  1985  =

fec419608c5118 Russell King 2015-09-13  1986  	dev_info(sfp->dev, "  Option=
s: %s\n",
fec419608c5118 Russell King 2015-09-13  1987  		 sff_bitfield(options, size=
of(options), sfp_options,
fec419608c5118 Russell King 2015-09-13  1988  			      be16_to_cpu(id->ext.=
options)));
fec419608c5118 Russell King 2015-09-13  1989  	dev_info(sfp->dev, "  Diagno=
stics: %s\n",
fec419608c5118 Russell King 2015-09-13  1990  		 sff_bitfield(options, size=
of(options), diagmon,
fec419608c5118 Russell King 2015-09-13  1991  			      id->ext.diagmon));
fec419608c5118 Russell King 2015-09-13  1992  	dev_info(sfp->dev, "  EnhOpt=
s: %s\n",
fec419608c5118 Russell King 2015-09-13  1993  		 sff_bitfield(options, size=
of(options), sfp_enhopts,
fec419608c5118 Russell King 2015-09-13  1994  			      id->ext.enhopts));
fec419608c5118 Russell King 2015-09-13  1995  }
fec419608c5118 Russell King 2015-09-13  1996  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5416493966495699525==--

