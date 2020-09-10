Content-Type: multipart/mixed; boundary="===============1654310228283248572=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/drm_modes.c:1784:16: warning: Local variable len shadows outer variable
Date: Fri, 11 Sep 2020 07:46:37 +0800
Message-ID: <202009110725.LSFdJyn0%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1654310228283248572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7fe10096c1508c7f033d34d0741809f8eecc1ed4
commit: 7b1cce760afe38b40f0989cdf10b2190dccf9815 drm/modes: parse_cmdline: =
Allow specifying stand-alone options
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/drm_modes.c:1784:16: warning: Local variable len shadows=
 outer variable [shadowVar]
     unsigned int len =3D strlen(mode_option);
                  ^
   drivers/gpu/drm/drm_modes.c:1716:9: note: Shadowed declaration
    int i, len, ret;
           ^
   drivers/gpu/drm/drm_modes.c:1784:16: note: Shadow variable
     unsigned int len =3D strlen(mode_option);
                  ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D7b1cce760afe38b40f0989cdf10b2190dccf9815
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 7b1cce760afe38b40f0989cdf10b2190dccf9815
vim +1784 drivers/gpu/drm/drm_modes.c

1794d257fa7bab Chris Wilson   2011-04-17  1722  =

1794d257fa7bab Chris Wilson   2011-04-17  1723  	if (!mode_option) {
1794d257fa7bab Chris Wilson   2011-04-17  1724  		mode->specified =3D false;
1794d257fa7bab Chris Wilson   2011-04-17  1725  		return false;
1794d257fa7bab Chris Wilson   2011-04-17  1726  	}
1794d257fa7bab Chris Wilson   2011-04-17  1727  =

1794d257fa7bab Chris Wilson   2011-04-17  1728  	name =3D mode_option;
04fee895ef98ff Rolf Eike Beer 2011-06-15  1729  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1730  	/* Try to locate the bpp a=
nd refresh specifiers, if any */
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1731  	bpp_ptr =3D strchr(name, '=
-');
6a2d163756545a Hans de Goede  2019-11-18  1732  	if (bpp_ptr)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1733  		bpp_off =3D bpp_ptr - nam=
e;
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1734  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1735  	refresh_ptr =3D strchr(nam=
e, '@');
7b1cce760afe38 Hans de Goede  2019-11-18  1736  	if (refresh_ptr)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1737  		refresh_off =3D refresh_p=
tr - name;
04fee895ef98ff Rolf Eike Beer 2011-06-15  1738  =

1bf4e09227c345 Maxime Ripard  2019-06-19  1739  	/* Locate the start of nam=
ed options */
1bf4e09227c345 Maxime Ripard  2019-06-19  1740  	options_ptr =3D strchr(nam=
e, ',');
1bf4e09227c345 Maxime Ripard  2019-06-19  1741  	if (options_ptr)
1bf4e09227c345 Maxime Ripard  2019-06-19  1742  		options_off =3D options_p=
tr - name;
1bf4e09227c345 Maxime Ripard  2019-06-19  1743  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1744  	/* Locate the end of the n=
ame / resolution, and parse it */
1bf4e09227c345 Maxime Ripard  2019-06-19  1745  	if (bpp_ptr) {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1746  		mode_end =3D bpp_off;
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1747  	} else if (refresh_ptr) {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1748  		mode_end =3D refresh_off;
1bf4e09227c345 Maxime Ripard  2019-06-19  1749  	} else if (options_ptr) {
1bf4e09227c345 Maxime Ripard  2019-06-19  1750  		mode_end =3D options_off;
cfb0881b8f621b Hans de Goede  2019-11-18  1751  		parse_extras =3D true;
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1752  	} else {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1753  		mode_end =3D strlen(name);
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1754  		parse_extras =3D true;
04fee895ef98ff Rolf Eike Beer 2011-06-15  1755  	}
04fee895ef98ff Rolf Eike Beer 2011-06-15  1756  =

7b1cce760afe38 Hans de Goede  2019-11-18  1757  	/* First check for a named=
 mode */
7b1cce760afe38 Hans de Goede  2019-11-18  1758  	for (i =3D 0; i < ARRAY_SI=
ZE(drm_named_modes_whitelist); i++) {
7b1cce760afe38 Hans de Goede  2019-11-18  1759  		ret =3D str_has_prefix(na=
me, drm_named_modes_whitelist[i]);
7b1cce760afe38 Hans de Goede  2019-11-18  1760  		if (ret =3D=3D mode_end) {
7b1cce760afe38 Hans de Goede  2019-11-18  1761  			if (refresh_ptr)
7b1cce760afe38 Hans de Goede  2019-11-18  1762  				return false; /* named =
+ refresh is invalid */
3764137906a5ac Maxime Ripard  2019-08-27  1763  =

7b1cce760afe38 Hans de Goede  2019-11-18  1764  			strcpy(mode->name, drm_n=
amed_modes_whitelist[i]);
7b1cce760afe38 Hans de Goede  2019-11-18  1765  			mode->specified =3D true;
7b1cce760afe38 Hans de Goede  2019-11-18  1766  			break;
7b1cce760afe38 Hans de Goede  2019-11-18  1767  		}
7b1cce760afe38 Hans de Goede  2019-11-18  1768  	}
3764137906a5ac Maxime Ripard  2019-08-27  1769  =

7b1cce760afe38 Hans de Goede  2019-11-18  1770  	/* No named mode? Check fo=
r a normal mode argument, e.g. 1024x768 */
7b1cce760afe38 Hans de Goede  2019-11-18  1771  	if (!mode->specified && is=
digit(name[0])) {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1772  		ret =3D drm_mode_parse_cm=
dline_res_mode(name, mode_end,
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1773  						      parse_extras,
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1774  						      connector,
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1775  						      mode);
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1776  		if (ret)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1777  			return false;
7b1cce760afe38 Hans de Goede  2019-11-18  1778  =

1794d257fa7bab Chris Wilson   2011-04-17  1779  		mode->specified =3D true;
7b1cce760afe38 Hans de Goede  2019-11-18  1780  	}
7b1cce760afe38 Hans de Goede  2019-11-18  1781  =

7b1cce760afe38 Hans de Goede  2019-11-18  1782  	/* No mode? Check for free=
standing extras and/or options */
7b1cce760afe38 Hans de Goede  2019-11-18  1783  	if (!mode->specified) {
7b1cce760afe38 Hans de Goede  2019-11-18 @1784  		unsigned int len =3D strl=
en(mode_option);
7b1cce760afe38 Hans de Goede  2019-11-18  1785  =

7b1cce760afe38 Hans de Goede  2019-11-18  1786  		if (bpp_ptr || refresh_pt=
r)
7b1cce760afe38 Hans de Goede  2019-11-18  1787  			return false; /* syntax =
error */
7b1cce760afe38 Hans de Goede  2019-11-18  1788  =

7b1cce760afe38 Hans de Goede  2019-11-18  1789  		if (len =3D=3D 1 || (len =
>=3D 2 && mode_option[1] =3D=3D ','))
7b1cce760afe38 Hans de Goede  2019-11-18  1790  			extra_ptr =3D mode_optio=
n;
7b1cce760afe38 Hans de Goede  2019-11-18  1791  		else
7b1cce760afe38 Hans de Goede  2019-11-18  1792  			options_ptr =3D mode_opt=
ion - 1;
7b1cce760afe38 Hans de Goede  2019-11-18  1793  =

7b1cce760afe38 Hans de Goede  2019-11-18  1794  		freestanding =3D true;
7b1cce760afe38 Hans de Goede  2019-11-18  1795  	}
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1796  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1797  	if (bpp_ptr) {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1798  		ret =3D drm_mode_parse_cm=
dline_bpp(bpp_ptr, &bpp_end_ptr, mode);
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1799  		if (ret)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1800  			return false;
6a2d163756545a Hans de Goede  2019-11-18  1801  =

6a2d163756545a Hans de Goede  2019-11-18  1802  		mode->bpp_specified =3D t=
rue;
1794d257fa7bab Chris Wilson   2011-04-17  1803  	}
1794d257fa7bab Chris Wilson   2011-04-17  1804  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1805  	if (refresh_ptr) {
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1806  		ret =3D drm_mode_parse_cm=
dline_refresh(refresh_ptr,
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1807  						     &refresh_end_ptr=
, mode);
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1808  		if (ret)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1809  			return false;
6a2d163756545a Hans de Goede  2019-11-18  1810  =

6a2d163756545a Hans de Goede  2019-11-18  1811  		mode->refresh_specified =
=3D true;
1794d257fa7bab Chris Wilson   2011-04-17  1812  	}
1794d257fa7bab Chris Wilson   2011-04-17  1813  =

e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1814  	/*
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1815  	 * Locate the end of the b=
pp / refresh, and parse the extras
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1816  	 * if relevant
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1817  	 */
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1818  	if (bpp_ptr && refresh_ptr)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1819  		extra_ptr =3D max(bpp_end=
_ptr, refresh_end_ptr);
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1820  	else if (bpp_ptr)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1821  		extra_ptr =3D bpp_end_ptr;
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1822  	else if (refresh_ptr)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1823  		extra_ptr =3D refresh_end=
_ptr;
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1824  =

c2ed3e94190181 Hans de Goede  2019-11-18  1825  	if (extra_ptr) {
c2ed3e94190181 Hans de Goede  2019-11-18  1826  		if (options_ptr)
c2ed3e94190181 Hans de Goede  2019-11-18  1827  			len =3D options_ptr - ex=
tra_ptr;
c2ed3e94190181 Hans de Goede  2019-11-18  1828  		else
c2ed3e94190181 Hans de Goede  2019-11-18  1829  			len =3D strlen(extra_ptr=
);
3aeeb13d899627 Maxime Ripard  2019-06-19  1830  =

7b1cce760afe38 Hans de Goede  2019-11-18  1831  		ret =3D drm_mode_parse_cm=
dline_extra(extra_ptr, len, freestanding,
3aeeb13d899627 Maxime Ripard  2019-06-19  1832  						   connector, mode);
3aeeb13d899627 Maxime Ripard  2019-06-19  1833  		if (ret)
3aeeb13d899627 Maxime Ripard  2019-06-19  1834  			return false;
1bf4e09227c345 Maxime Ripard  2019-06-19  1835  	}
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1836  =

1bf4e09227c345 Maxime Ripard  2019-06-19  1837  	if (options_ptr) {
739b200c2edcaa Hans de Goede  2019-11-18  1838  		ret =3D drm_mode_parse_cm=
dline_options(options_ptr + 1,
7b1cce760afe38 Hans de Goede  2019-11-18  1839  						     freestanding,
1bf4e09227c345 Maxime Ripard  2019-06-19  1840  						     connector, mode);
1bf4e09227c345 Maxime Ripard  2019-06-19  1841  		if (ret)
e08ab74bd4c7a5 Maxime Ripard  2019-06-19  1842  			return false;
1794d257fa7bab Chris Wilson   2011-04-17  1843  	}
1794d257fa7bab Chris Wilson   2011-04-17  1844  =

1794d257fa7bab Chris Wilson   2011-04-17  1845  	return true;
1794d257fa7bab Chris Wilson   2011-04-17  1846  }
1794d257fa7bab Chris Wilson   2011-04-17  1847  EXPORT_SYMBOL(drm_mode_pars=
e_command_line_for_connector);
1794d257fa7bab Chris Wilson   2011-04-17  1848  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1654310228283248572==--

