Content-Type: multipart/mixed; boundary="===============5383933908849164956=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rmk-arm:zii 56/87] drivers/net/phy/sfp.c:1991 sfp_print_module_info() warn: format string contains non-ascii character '\xc2'
Date: Fri, 05 Aug 2022 12:06:26 +0800
Message-ID: <202208051258.tAYMP2qp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5383933908849164956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Russell King <rmk+kernel@arm.linux.org.uk>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm zii
head:   315d00812d1f8ed8bbbce4e4fd8d32fc883900a0
commit: 4c6b663272249085c137885b311de64777d98ba2 [56/87] net: sfp: display =
SFP module information       [*not for mainline*]
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-m031-20220803 (https://download.01.org/0day-ci/arch=
ive/20220805/202208051258.tAYMP2qp-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/net/phy/sfp.c:1991 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xc2'
drivers/net/phy/sfp.c:1991 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xb5'

Old smatch warnings:
drivers/net/phy/sfp.c:477 sfp_soft_get_state() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1825 sfp_sm_mod_hpower() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1843 sfp_sm_mod_hpower() warn: passing zero to 'ERR_P=
TR'
drivers/net/phy/sfp.c:1909 sfp_cotsworks_fixup_check() warn: passing zero t=
o 'ERR_PTR'
drivers/net/phy/sfp.c:1992 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xc2'
drivers/net/phy/sfp.c:1992 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xb5'
drivers/net/phy/sfp.c:1995 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xc2'
drivers/net/phy/sfp.c:1995 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xb5'
drivers/net/phy/sfp.c:1998 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xc2'
drivers/net/phy/sfp.c:1998 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xb5'
drivers/net/phy/sfp.c:2001 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xc2'
drivers/net/phy/sfp.c:2001 sfp_print_module_info() warn: format string cont=
ains non-ascii character '\xb5'
drivers/net/phy/sfp.c:2046 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'
drivers/net/phy/sfp.c:2073 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'
drivers/net/phy/sfp.c:2122 sfp_sm_mod_probe() warn: passing zero to 'ERR_PT=
R'
drivers/net/phy/sfp.c:2727 sfp_probe() warn: passing a valid pointer to 'PT=
R_ERR'

vim +1991 drivers/net/phy/sfp.c

b18432c5a49c941 Chris Healy  2020-07-14  1917  =

4c6b66327224908 Russell King 2015-09-13  1918  static void sfp_print_module=
_info(struct sfp *sfp, const struct sfp_eeprom_id *id, bool cotsworks)
4c6b66327224908 Russell King 2015-09-13  1919  {
4c6b66327224908 Russell King 2015-09-13  1920  	unsigned int br_nom, br_min=
, br_max;
4c6b66327224908 Russell King 2015-09-13  1921  	char date[9];
4c6b66327224908 Russell King 2015-09-13  1922  	char options[80];
4c6b66327224908 Russell King 2015-09-13  1923  =

4c6b66327224908 Russell King 2015-09-13  1924  	/* Cotsworks also gets the =
date code wrong. */
4c6b66327224908 Russell King 2015-09-13  1925  	date[0] =3D id->ext.datecod=
e[4 - 2 * cotsworks];
4c6b66327224908 Russell King 2015-09-13  1926  	date[1] =3D id->ext.datecod=
e[5 - 2 * cotsworks];
4c6b66327224908 Russell King 2015-09-13  1927  	date[2] =3D '-';
4c6b66327224908 Russell King 2015-09-13  1928  	date[3] =3D id->ext.datecod=
e[2 + 2 * cotsworks];
4c6b66327224908 Russell King 2015-09-13  1929  	date[4] =3D id->ext.datecod=
e[3 + 2 * cotsworks];
4c6b66327224908 Russell King 2015-09-13  1930  	date[5] =3D '-';
4c6b66327224908 Russell King 2015-09-13  1931  	date[6] =3D id->ext.datecod=
e[0];
4c6b66327224908 Russell King 2015-09-13  1932  	date[7] =3D id->ext.datecod=
e[1];
4c6b66327224908 Russell King 2015-09-13  1933  	date[8] =3D '\0';
4c6b66327224908 Russell King 2015-09-13  1934  =

4c6b66327224908 Russell King 2015-09-13  1935  	if (id->base.br_nominal =3D=
=3D 0) {
4c6b66327224908 Russell King 2015-09-13  1936  		br_min =3D br_nom =3D br_m=
ax =3D 0;
4c6b66327224908 Russell King 2015-09-13  1937  	} else if (id->base.br_nomi=
nal =3D=3D 255) {
4c6b66327224908 Russell King 2015-09-13  1938  		br_nom =3D 250 * id->ext.b=
r_max;
4c6b66327224908 Russell King 2015-09-13  1939  		br_max =3D br_nom + br_nom=
 * id->ext.br_min / 100;
4c6b66327224908 Russell King 2015-09-13  1940  		br_min =3D br_nom - br_nom=
 * id->ext.br_min / 100;
4c6b66327224908 Russell King 2015-09-13  1941  	} else {
4c6b66327224908 Russell King 2015-09-13  1942  		br_nom =3D id->base.br_nom=
inal * 100;
4c6b66327224908 Russell King 2015-09-13  1943  		br_min =3D br_nom - id->ba=
se.br_nominal * id->ext.br_min;
4c6b66327224908 Russell King 2015-09-13  1944  		br_max =3D br_nom + id->ba=
se.br_nominal * id->ext.br_max;
4c6b66327224908 Russell King 2015-09-13  1945  	}
4c6b66327224908 Russell King 2015-09-13  1946  =

4c6b66327224908 Russell King 2015-09-13  1947  	dev_info(sfp->dev, "module =
%.*s %.*s rev %.*s sn %.*s dc %s\n",
4c6b66327224908 Russell King 2015-09-13  1948  		 (int)sizeof(id->base.vend=
or_name), id->base.vendor_name,
4c6b66327224908 Russell King 2015-09-13  1949  		 (int)sizeof(id->base.vend=
or_pn), id->base.vendor_pn,
4c6b66327224908 Russell King 2015-09-13  1950  		 (int)sizeof(id->base.vend=
or_rev), id->base.vendor_rev,
4c6b66327224908 Russell King 2015-09-13  1951  		 (int)sizeof(id->ext.vendo=
r_sn), id->ext.vendor_sn, date);
4c6b66327224908 Russell King 2015-09-13  1952  	dev_info(sfp->dev, "  %s co=
nnector, encoding %s, bitrate %u.%03u (%u.%03u-%u.%03u) Gbps\n",
4c6b66327224908 Russell King 2015-09-13  1953  		 sff_connector(id->base.co=
nnector),
4c6b66327224908 Russell King 2015-09-13  1954  		 sff_encoding(id->base.enc=
oding),
4c6b66327224908 Russell King 2015-09-13  1955  		 br_nom / 1000, br_nom % 1=
000,
4c6b66327224908 Russell King 2015-09-13  1956  		 br_min / 1000, br_min % 1=
000, br_max / 1000, br_max % 1000);
4c6b66327224908 Russell King 2015-09-13  1957  	dev_info(sfp->dev, "  1000B=
aseSX%c 1000BaseLX%c 1000BaseCX%c 1000BaseT%c 100BaseLX%c 100BaseFX%c BaseB=
X10%c BasePX%c\n",
4c6b66327224908 Russell King 2015-09-13  1958  		 id->base.e1000_base_sx ? =
'+' : '-',
4c6b66327224908 Russell King 2015-09-13  1959  		 id->base.e1000_base_lx ? =
'+' : '-',
4c6b66327224908 Russell King 2015-09-13  1960  		 id->base.e1000_base_cx ? =
'+' : '-',
4c6b66327224908 Russell King 2015-09-13  1961  		 id->base.e1000_base_t ? '=
+' : '-',
4c6b66327224908 Russell King 2015-09-13  1962  		 id->base.e100_base_lx ? '=
+' : '-',
4c6b66327224908 Russell King 2015-09-13  1963  		 id->base.e100_base_fx ? '=
+' : '-',
4c6b66327224908 Russell King 2015-09-13  1964  		 id->base.e_base_bx10 ? '+=
' : '-',
4c6b66327224908 Russell King 2015-09-13  1965  		 id->base.e_base_px ? '+' =
: '-');
4c6b66327224908 Russell King 2015-09-13  1966  	dev_info(sfp->dev, "  10GBa=
seSR%c 10GBaseLR%c 10GBaseLRM%c 10GBaseER%c\n",
4c6b66327224908 Russell King 2015-09-13  1967  		 id->base.e10g_base_sr ? '=
+' : '-',
4c6b66327224908 Russell King 2015-09-13  1968  		 id->base.e10g_base_lr ? '=
+' : '-',
4c6b66327224908 Russell King 2015-09-13  1969  		 id->base.e10g_base_lrm ? =
'+' : '-',
4c6b66327224908 Russell King 2015-09-13  1970  		 id->base.e10g_base_er ? '=
+' : '-');
4c6b66327224908 Russell King 2015-09-13  1971  =

4c6b66327224908 Russell King 2015-09-13  1972  	if (!id->base.sfp_ct_passiv=
e && !id->base.sfp_ct_active &&
4c6b66327224908 Russell King 2015-09-13  1973  	    !id->base.e1000_base_t)=
 {
4c6b66327224908 Russell King 2015-09-13  1974  		char len_9um[16], len_om[1=
6];
4c6b66327224908 Russell King 2015-09-13  1975  =

4c6b66327224908 Russell King 2015-09-13  1976  		dev_info(sfp->dev, "  Wave=
length %unm, fiber lengths:\n",
4c6b66327224908 Russell King 2015-09-13  1977  			 be16_to_cpup(&id->base.o=
ptical_wavelength));
4c6b66327224908 Russell King 2015-09-13  1978  =

4c6b66327224908 Russell King 2015-09-13  1979  		if (id->base.link_len[0] =
=3D=3D 255)
4c6b66327224908 Russell King 2015-09-13  1980  			strcpy(len_9um, ">254km");
4c6b66327224908 Russell King 2015-09-13  1981  		else if (id->base.link_len=
[1] && id->base.link_len[1] !=3D 255)
4c6b66327224908 Russell King 2015-09-13  1982  			sprintf(len_9um, "%um",
4c6b66327224908 Russell King 2015-09-13  1983  				id->base.link_len[1] * 1=
00);
4c6b66327224908 Russell King 2015-09-13  1984  		else if (id->base.link_len=
[0])
4c6b66327224908 Russell King 2015-09-13  1985  			sprintf(len_9um, "%ukm", =
id->base.link_len[0]);
4c6b66327224908 Russell King 2015-09-13  1986  		else if (id->base.link_len=
[1] =3D=3D 255)
4c6b66327224908 Russell King 2015-09-13  1987  			strcpy(len_9um, ">25.4km"=
);
4c6b66327224908 Russell King 2015-09-13  1988  		else
4c6b66327224908 Russell King 2015-09-13  1989  			strcpy(len_9um, "unsuppor=
ted");
4c6b66327224908 Russell King 2015-09-13  1990  =

4c6b66327224908 Russell King 2015-09-13 @1991  		dev_info(sfp->dev, "    9=
=C2=B5m SM    : %s\n", len_9um);
4c6b66327224908 Russell King 2015-09-13  1992  		dev_info(sfp->dev, " 62.5=
=C2=B5m MM OM1: %s\n",
4c6b66327224908 Russell King 2015-09-13  1993  			 sff_link_len(len_om, siz=
eof(len_om),
4c6b66327224908 Russell King 2015-09-13  1994  				      id->base.link_len[=
3], 10));
4c6b66327224908 Russell King 2015-09-13  1995  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM2: %s\n",
4c6b66327224908 Russell King 2015-09-13  1996  			 sff_link_len(len_om, siz=
eof(len_om),
4c6b66327224908 Russell King 2015-09-13  1997  				      id->base.link_len[=
2], 10));
4c6b66327224908 Russell King 2015-09-13  1998  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM3: %s\n",
4c6b66327224908 Russell King 2015-09-13  1999  			 sff_link_len(len_om, siz=
eof(len_om),
4c6b66327224908 Russell King 2015-09-13  2000  				      id->base.link_len[=
5], 10));
4c6b66327224908 Russell King 2015-09-13  2001  		dev_info(sfp->dev, "   50=
=C2=B5m MM OM4: %s\n",
4c6b66327224908 Russell King 2015-09-13  2002  			 sff_link_len(len_om, siz=
eof(len_om),
4c6b66327224908 Russell King 2015-09-13  2003  				      id->base.link_len[=
4], 10));
4c6b66327224908 Russell King 2015-09-13  2004  	} else {
4c6b66327224908 Russell King 2015-09-13  2005  		char len[16];
4c6b66327224908 Russell King 2015-09-13  2006  		dev_info(sfp->dev, "  Copp=
er length: %s\n",
4c6b66327224908 Russell King 2015-09-13  2007  			 sff_link_len(len, sizeof=
(len),
4c6b66327224908 Russell King 2015-09-13  2008  				      id->base.link_len[=
4], 1));
4c6b66327224908 Russell King 2015-09-13  2009  	}
4c6b66327224908 Russell King 2015-09-13  2010  =

4c6b66327224908 Russell King 2015-09-13  2011  	dev_info(sfp->dev, "  Optio=
ns: %s\n",
4c6b66327224908 Russell King 2015-09-13  2012  		 sff_bitfield(options, siz=
eof(options), sfp_options,
4c6b66327224908 Russell King 2015-09-13  2013  			      be16_to_cpu(id->ext=
.options)));
4c6b66327224908 Russell King 2015-09-13  2014  	dev_info(sfp->dev, "  Diagn=
ostics: %s\n",
4c6b66327224908 Russell King 2015-09-13  2015  		 sff_bitfield(options, siz=
eof(options), diagmon,
4c6b66327224908 Russell King 2015-09-13  2016  			      id->ext.diagmon));
4c6b66327224908 Russell King 2015-09-13  2017  	dev_info(sfp->dev, "  EnhOp=
ts: %s\n",
4c6b66327224908 Russell King 2015-09-13  2018  		 sff_bitfield(options, siz=
eof(options), sfp_enhopts,
4c6b66327224908 Russell King 2015-09-13  2019  			      id->ext.enhopts));
4c6b66327224908 Russell King 2015-09-13  2020  }
4c6b66327224908 Russell King 2015-09-13  2021  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5383933908849164956==--

