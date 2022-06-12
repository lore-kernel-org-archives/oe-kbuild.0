Content-Type: multipart/mixed; boundary="===============9010005505716151551=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [pdx86-platform-drivers-x86:review-hans 11/13] sound/soc/codecs/da7213.c:1842:30: warning: dereference of NULL '*(struct da7213_priv *)MEM[(const struct device *)_63].driver_data.pdata' [CWE-476]
Date: Sun, 12 Jun 2022 16:52:36 +0800
Message-ID: <202206121656.pX56Ucv1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============9010005505716151551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 sound/soc/codecs/da7213.c:1842:30: warning: dereference of NULL '*(struct =
da7213_priv *)MEM[(const struct device *)_63].driver_data.pdata' [CWE-476] =
[-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: linux-kernel(a)vger.kernel.org
TO: Hans de Goede <hdegoede@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-driv=
ers-x86.git review-hans
head:   8c99ffaa7c4b0b81e7bf18933d530dddc9ff0f85
commit: 7e74b733f6d3905bdba30bcdb0084118b02c5803 [11/13] platform/x86: Drop=
 the PMC_ATOM Kconfig option
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
612/202206121656.pX56Ucv1-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-x86.git/commit/?id=3D7e74b733f6d3905bdba30bcdb0084118b02c5803
        git remote add pdx86-platform-drivers-x86 https://git.kernel.org/pu=
b/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
        git fetch --no-tags pdx86-platform-drivers-x86 review-hans
        git checkout 7e74b733f6d3905bdba30bcdb0084118b02c5803
        # save the config file
         ARCH=3Di386 KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   sound/soc/codecs/da7213.c: In function 'da7213_probe':
>> sound/soc/codecs/da7213.c:1842:30: warning: dereference of NULL '*(struc=
t da7213_priv *)MEM[(const struct device *)_63].driver_data.pdata' [CWE-476=
] [-Wanalyzer-null-dereference]
    1842 |                 switch (pdata->micbias1_lvl) {
         |                         ~~~~~^~~~~~~~~~~~~~
     'da7213_probe': events 1-4
       |
       | 1766 | static int da7213_probe(struct snd_soc_component *component)
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'da7213_probe'
       |......
       | 1833 |         if (!da7213->pdata)
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       | 1834 |                 da7213->pdata =3D da7213_fw_to_pdata(compon=
ent);
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                                 |
       |      |                                 (3) ...to here
       |      |                                 (4) calling 'da7213_fw_to_p=
data' from 'da7213_probe'
       |
       +--> 'da7213_fw_to_pdata': events 5-6
              |
              | 1726 |         *da7213_fw_to_pdata(struct snd_soc_component=
 *component)
              |      |          ^~~~~~~~~~~~~~~~~~
              |      |          |
              |      |          (5) entry to 'da7213_fw_to_pdata'
              |......
              | 1734 |         if (!pdata)
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch...
              |
            'da7213_fw_to_pdata': event 7
              |
              |cc1:
              | (7): ...to here
              |
       <------+
       |
     'da7213_probe': events 8-13
       |
       | 1834 |                 da7213->pdata =3D da7213_fw_to_pdata(compon=
ent);
       |      |                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                               | |
       |      |                               | (8) returning to 'da7213_pr=
obe' from 'da7213_fw_to_pdata'
       |      |                               (9) '<unknown>' is NULL
       |      |                               (10) '<unknown>' is NULL
       |......
       | 1837 |         if (da7213->pdata) {
       |      |            ~                     =

       |      |            |
       |      |            (11) following 'true' branch...
       |......
       | 1842 |                 switch (pdata->micbias1_lvl) {
       |      |                         ~~~~~~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (12) ...to here
       |      |                              (13) dereference of NULL '*(st=
ruct da7213_priv *)MEM[(const struct device *)_63].driver_data.pdata'
       |

vim +1842 sound/soc/codecs/da7213.c

e90996a3ea224f Adam Thomson      2015-10-07  1765  =

2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1766  static int da7213_probe(=
struct snd_soc_component *component)
ef5c2eba241259 Adam Thomson      2013-02-14  1767  {
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1768  	struct da7213_priv *da7=
213 =3D snd_soc_component_get_drvdata(component);
ef5c2eba241259 Adam Thomson      2013-02-14  1769  =

b2a378816d0f67 Sebastian Reichel 2020-05-11  1770  	pm_runtime_get_sync(com=
ponent->dev);
b2a378816d0f67 Sebastian Reichel 2020-05-11  1771  =

ef5c2eba241259 Adam Thomson      2013-02-14  1772  	/* Default to using ALC=
 auto offset calibration mode. */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1773  	snd_soc_component_updat=
e_bits(component, DA7213_ALC_CTRL1,
ef5c2eba241259 Adam Thomson      2013-02-14  1774  			    DA7213_ALC_CALIB_=
MODE_MAN, 0);
ef5c2eba241259 Adam Thomson      2013-02-14  1775  	da7213->alc_calib_auto =
=3D true;
ef5c2eba241259 Adam Thomson      2013-02-14  1776  =

7e28fd469624fc Adam Thomson      2016-05-10  1777  	/* Default PC counter t=
o free-running */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1778  	snd_soc_component_updat=
e_bits(component, DA7213_PC_COUNT, DA7213_PC_FREERUN_MASK,
7e28fd469624fc Adam Thomson      2016-05-10  1779  			    DA7213_PC_FREERUN=
_MASK);
7e28fd469624fc Adam Thomson      2016-05-10  1780  =

ef5c2eba241259 Adam Thomson      2013-02-14  1781  	/* Enable all Gain Ramp=
s */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1782  	snd_soc_component_updat=
e_bits(component, DA7213_AUX_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1783  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1784  	snd_soc_component_updat=
e_bits(component, DA7213_AUX_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1785  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1786  	snd_soc_component_updat=
e_bits(component, DA7213_MIXIN_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1787  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1788  	snd_soc_component_updat=
e_bits(component, DA7213_MIXIN_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1789  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1790  	snd_soc_component_updat=
e_bits(component, DA7213_ADC_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1791  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1792  	snd_soc_component_updat=
e_bits(component, DA7213_ADC_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1793  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1794  	snd_soc_component_updat=
e_bits(component, DA7213_DAC_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1795  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1796  	snd_soc_component_updat=
e_bits(component, DA7213_DAC_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1797  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1798  	snd_soc_component_updat=
e_bits(component, DA7213_HP_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1799  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1800  	snd_soc_component_updat=
e_bits(component, DA7213_HP_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1801  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1802  	snd_soc_component_updat=
e_bits(component, DA7213_LINE_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1803  			    DA7213_GAIN_RAMP_=
EN, DA7213_GAIN_RAMP_EN);
ef5c2eba241259 Adam Thomson      2013-02-14  1804  =

ef5c2eba241259 Adam Thomson      2013-02-14  1805  	/*
ef5c2eba241259 Adam Thomson      2013-02-14  1806  	 * There are two separa=
te control bits for input and output mixers as
ef5c2eba241259 Adam Thomson      2013-02-14  1807  	 * well as headphone an=
d line outs.
ef5c2eba241259 Adam Thomson      2013-02-14  1808  	 * One to enable corres=
ponding amplifier and other to enable its
ef5c2eba241259 Adam Thomson      2013-02-14  1809  	 * output. As amplifier=
 bits are related to power control, they are
ef5c2eba241259 Adam Thomson      2013-02-14  1810  	 * being managed by DAP=
M while other (non power related) bits are
ef5c2eba241259 Adam Thomson      2013-02-14  1811  	 * enabled here
ef5c2eba241259 Adam Thomson      2013-02-14  1812  	 */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1813  	snd_soc_component_updat=
e_bits(component, DA7213_MIXIN_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1814  			    DA7213_MIXIN_MIX_=
EN, DA7213_MIXIN_MIX_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1815  	snd_soc_component_updat=
e_bits(component, DA7213_MIXIN_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1816  			    DA7213_MIXIN_MIX_=
EN, DA7213_MIXIN_MIX_EN);
ef5c2eba241259 Adam Thomson      2013-02-14  1817  =

2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1818  	snd_soc_component_updat=
e_bits(component, DA7213_MIXOUT_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1819  			    DA7213_MIXOUT_MIX=
_EN, DA7213_MIXOUT_MIX_EN);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1820  	snd_soc_component_updat=
e_bits(component, DA7213_MIXOUT_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1821  			    DA7213_MIXOUT_MIX=
_EN, DA7213_MIXOUT_MIX_EN);
ef5c2eba241259 Adam Thomson      2013-02-14  1822  =

2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1823  	snd_soc_component_updat=
e_bits(component, DA7213_HP_L_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1824  			    DA7213_HP_AMP_OE,=
 DA7213_HP_AMP_OE);
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1825  	snd_soc_component_updat=
e_bits(component, DA7213_HP_R_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1826  			    DA7213_HP_AMP_OE,=
 DA7213_HP_AMP_OE);
ef5c2eba241259 Adam Thomson      2013-02-14  1827  =

2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1828  	snd_soc_component_updat=
e_bits(component, DA7213_LINE_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1829  			    DA7213_LINE_AMP_O=
E, DA7213_LINE_AMP_OE);
ef5c2eba241259 Adam Thomson      2013-02-14  1830  =

e90996a3ea224f Adam Thomson      2015-10-07  1831  	/* Handle DT/Platform d=
ata */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1832  	da7213->pdata =3D dev_g=
et_platdata(component->dev);
0e54153b668571 Adam Thomson      2017-05-19  1833  	if (!da7213->pdata)
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1834  		da7213->pdata =3D da72=
13_fw_to_pdata(component);
e90996a3ea224f Adam Thomson      2015-10-07  1835  =

ef5c2eba241259 Adam Thomson      2013-02-14  1836  	/* Set platform data va=
lues */
ef5c2eba241259 Adam Thomson      2013-02-14  1837  	if (da7213->pdata) {
e90996a3ea224f Adam Thomson      2015-10-07  1838  		struct da7213_platform=
_data *pdata =3D da7213->pdata;
ef5c2eba241259 Adam Thomson      2013-02-14  1839  		u8 micbias_lvl =3D 0, =
dmic_cfg =3D 0;
ef5c2eba241259 Adam Thomson      2013-02-14  1840  =

ef5c2eba241259 Adam Thomson      2013-02-14  1841  		/* Set Mic Bias voltag=
es */
ef5c2eba241259 Adam Thomson      2013-02-14 @1842  		switch (pdata->micbias=
1_lvl) {
ef5c2eba241259 Adam Thomson      2013-02-14  1843  		case DA7213_MICBIAS_1_=
6V:
ef5c2eba241259 Adam Thomson      2013-02-14  1844  		case DA7213_MICBIAS_2_=
2V:
ef5c2eba241259 Adam Thomson      2013-02-14  1845  		case DA7213_MICBIAS_2_=
5V:
ef5c2eba241259 Adam Thomson      2013-02-14  1846  		case DA7213_MICBIAS_3_=
0V:
ef5c2eba241259 Adam Thomson      2013-02-14  1847  			micbias_lvl |=3D (pda=
ta->micbias1_lvl <<
ef5c2eba241259 Adam Thomson      2013-02-14  1848  					DA7213_MICBIAS1_LEV=
EL_SHIFT);
ef5c2eba241259 Adam Thomson      2013-02-14  1849  			break;
ef5c2eba241259 Adam Thomson      2013-02-14  1850  		}
ef5c2eba241259 Adam Thomson      2013-02-14  1851  		switch (pdata->micbias=
2_lvl) {
ef5c2eba241259 Adam Thomson      2013-02-14  1852  		case DA7213_MICBIAS_1_=
6V:
ef5c2eba241259 Adam Thomson      2013-02-14  1853  		case DA7213_MICBIAS_2_=
2V:
ef5c2eba241259 Adam Thomson      2013-02-14  1854  		case DA7213_MICBIAS_2_=
5V:
ef5c2eba241259 Adam Thomson      2013-02-14  1855  		case DA7213_MICBIAS_3_=
0V:
ef5c2eba241259 Adam Thomson      2013-02-14  1856  			micbias_lvl |=3D (pda=
ta->micbias2_lvl <<
ef5c2eba241259 Adam Thomson      2013-02-14  1857  					 DA7213_MICBIAS2_LE=
VEL_SHIFT);
ef5c2eba241259 Adam Thomson      2013-02-14  1858  			break;
ef5c2eba241259 Adam Thomson      2013-02-14  1859  		}
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1860  		snd_soc_component_upda=
te_bits(component, DA7213_MICBIAS_CTRL,
ef5c2eba241259 Adam Thomson      2013-02-14  1861  				    DA7213_MICBIAS1_=
LEVEL_MASK |
ef5c2eba241259 Adam Thomson      2013-02-14  1862  				    DA7213_MICBIAS2_=
LEVEL_MASK, micbias_lvl);
ef5c2eba241259 Adam Thomson      2013-02-14  1863  =

ef5c2eba241259 Adam Thomson      2013-02-14  1864  		/* Set DMIC configurat=
ion */
ef5c2eba241259 Adam Thomson      2013-02-14  1865  		switch (pdata->dmic_da=
ta_sel) {
ef5c2eba241259 Adam Thomson      2013-02-14  1866  		case DA7213_DMIC_DATA_=
LFALL_RRISE:
ef5c2eba241259 Adam Thomson      2013-02-14  1867  		case DA7213_DMIC_DATA_=
LRISE_RFALL:
ef5c2eba241259 Adam Thomson      2013-02-14  1868  			dmic_cfg |=3D (pdata-=
>dmic_data_sel <<
ef5c2eba241259 Adam Thomson      2013-02-14  1869  				     DA7213_DMIC_DAT=
A_SEL_SHIFT);
ef5c2eba241259 Adam Thomson      2013-02-14  1870  			break;
ef5c2eba241259 Adam Thomson      2013-02-14  1871  		}
61559af111e417 Axel Lin          2013-05-09  1872  		switch (pdata->dmic_sa=
mplephase) {
ef5c2eba241259 Adam Thomson      2013-02-14  1873  		case DA7213_DMIC_SAMPL=
E_ON_CLKEDGE:
ef5c2eba241259 Adam Thomson      2013-02-14  1874  		case DA7213_DMIC_SAMPL=
E_BETWEEN_CLKEDGE:
61559af111e417 Axel Lin          2013-05-09  1875  			dmic_cfg |=3D (pdata-=
>dmic_samplephase <<
ef5c2eba241259 Adam Thomson      2013-02-14  1876  				     DA7213_DMIC_SAM=
PLEPHASE_SHIFT);
ef5c2eba241259 Adam Thomson      2013-02-14  1877  			break;
ef5c2eba241259 Adam Thomson      2013-02-14  1878  		}
61559af111e417 Axel Lin          2013-05-09  1879  		switch (pdata->dmic_cl=
k_rate) {
ef5c2eba241259 Adam Thomson      2013-02-14  1880  		case DA7213_DMIC_CLK_3=
_0MHZ:
ef5c2eba241259 Adam Thomson      2013-02-14  1881  		case DA7213_DMIC_CLK_1=
_5MHZ:
61559af111e417 Axel Lin          2013-05-09  1882  			dmic_cfg |=3D (pdata-=
>dmic_clk_rate <<
ef5c2eba241259 Adam Thomson      2013-02-14  1883  				     DA7213_DMIC_CLK=
_RATE_SHIFT);
ef5c2eba241259 Adam Thomson      2013-02-14  1884  			break;
ef5c2eba241259 Adam Thomson      2013-02-14  1885  		}
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1886  		snd_soc_component_upda=
te_bits(component, DA7213_MIC_CONFIG,
ef5c2eba241259 Adam Thomson      2013-02-14  1887  				    DA7213_DMIC_DATA=
_SEL_MASK |
ef5c2eba241259 Adam Thomson      2013-02-14  1888  				    DA7213_DMIC_SAMP=
LEPHASE_MASK |
ef5c2eba241259 Adam Thomson      2013-02-14  1889  				    DA7213_DMIC_CLK_=
RATE_MASK, dmic_cfg);
6e7c4443186994 Adam Thomson      2015-10-07  1890  	}
ef5c2eba241259 Adam Thomson      2013-02-14  1891  =

b2a378816d0f67 Sebastian Reichel 2020-05-11  1892  	pm_runtime_put_sync(com=
ponent->dev);
b2a378816d0f67 Sebastian Reichel 2020-05-11  1893  =

6e7c4443186994 Adam Thomson      2015-10-07  1894  	/* Check if MCLK provid=
ed */
2918d9ccc46a40 Kuninori Morimoto 2018-01-29  1895  	da7213->mclk =3D devm_c=
lk_get(component->dev, "mclk");
6e7c4443186994 Adam Thomson      2015-10-07  1896  	if (IS_ERR(da7213->mclk=
)) {
6e7c4443186994 Adam Thomson      2015-10-07  1897  		if (PTR_ERR(da7213->mc=
lk) !=3D -ENOENT)
6e7c4443186994 Adam Thomson      2015-10-07  1898  			return PTR_ERR(da7213=
->mclk);
6e7c4443186994 Adam Thomson      2015-10-07  1899  		else
6e7c4443186994 Adam Thomson      2015-10-07  1900  			da7213->mclk =3D NULL;
5146b6a92c1194 Sebastian Reichel 2020-06-26  1901  	} else {
5146b6a92c1194 Sebastian Reichel 2020-06-26  1902  		/* Do automatic PLL ha=
ndling assuming fixed clock until
5146b6a92c1194 Sebastian Reichel 2020-06-26  1903  		 * set_pll() has been =
called. This makes the codec usable
5146b6a92c1194 Sebastian Reichel 2020-06-26  1904  		 * with the simple-aud=
io-card driver. */
5146b6a92c1194 Sebastian Reichel 2020-06-26  1905  		da7213->fixed_clk_auto=
_pll =3D true;
ef5c2eba241259 Adam Thomson      2013-02-14  1906  	}
e90996a3ea224f Adam Thomson      2015-10-07  1907  =

ef5c2eba241259 Adam Thomson      2013-02-14  1908  	return 0;
ef5c2eba241259 Adam Thomson      2013-02-14  1909  }
ef5c2eba241259 Adam Thomson      2013-02-14  1910  =


:::::: The code at line 1842 was first introduced by commit
:::::: ef5c2eba2412596f1a022c11caf74428bffd9abe ASoC: codecs: Add da7213 co=
dec

:::::: TO: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
:::::: CC: Mark Brown <broonie@opensource.wolfsonmicro.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============9010005505716151551==--

