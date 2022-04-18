Content-Type: multipart/mixed; boundary="===============6917506416332946687=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/firmware/cirrus/cs_dsp.c:1636 cs_dsp_create_regions() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 18 Apr 2022 17:42:43 +0800
Message-ID: <202204181713.5Brwvvk9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6917506416332946687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: David Rhodes <drhodes@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: bae9e13fc55cbc5ae25409385b2f1ba9187082d0 ASoC: cs35l41: DSP Support
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-m021-20220418 (https://download.01.org/0day-ci/arch=
ive/20220418/202204181713.5Brwvvk9-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/firmware/cirrus/cs_dsp.c:1636 cs_dsp_create_regions() warn: passing=
 a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1671 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1772 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/firmware/cirrus/cs_dsp.c:1676 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1699 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1720 cs_dsp_adsp1_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1777 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1782 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1807 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1828 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'
drivers/firmware/cirrus/cs_dsp.c:1849 cs_dsp_adsp2_setup_algs() warn: passi=
ng a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +1636 drivers/firmware/cirrus/cs_dsp.c

f6bc909e7673c3 Simon Trimmer 2021-09-13  1626  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1627  static int cs_dsp_create_reg=
ions(struct cs_dsp *dsp, __be32 id, int nregions,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1628  				 const int *type, __be32=
 *base)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1629  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1630  	struct cs_dsp_alg_region *a=
lg_region;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1631  	int i;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1632  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1633  	for (i =3D 0; i < nregions;=
 i++) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1634  		alg_region =3D cs_dsp_crea=
te_region(dsp, type[i], id, base[i]);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1635  		if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13 @1636  			return PTR_ERR(alg_region=
);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1637  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1638  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1639  	return 0;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1640  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1641  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1642  static int cs_dsp_adsp1_setu=
p_algs(struct cs_dsp *dsp)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1643  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1644  	struct wmfw_adsp1_id_hdr ad=
sp1_id;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1645  	struct wmfw_adsp1_alg_hdr *=
adsp1_alg;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1646  	struct cs_dsp_alg_region *a=
lg_region;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1647  	const struct cs_dsp_region =
*mem;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1648  	unsigned int pos, len;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1649  	size_t n_algs;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1650  	int i, ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1651  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1652  	mem =3D cs_dsp_find_region(=
dsp, WMFW_ADSP1_DM);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1653  	if (WARN_ON(!mem))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1654  		return -EINVAL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1655  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1656  	ret =3D regmap_raw_read(dsp=
->regmap, mem->base, &adsp1_id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1657  			      sizeof(adsp1_id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1658  	if (ret !=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1659  		cs_dsp_err(dsp, "Failed to=
 read algorithm info: %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1660  			   ret);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1661  		return ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1662  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1663  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1664  	n_algs =3D be32_to_cpu(adsp=
1_id.n_algs);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1665  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1666  	cs_dsp_parse_wmfw_id_header=
(dsp, &adsp1_id.fw, n_algs);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1667  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1668  	alg_region =3D cs_dsp_creat=
e_region(dsp, WMFW_ADSP1_ZM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1669  					  adsp1_id.fw.id, adsp1=
_id.zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1670  	if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13 @1671  		return PTR_ERR(alg_region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1672  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1673  	alg_region =3D cs_dsp_creat=
e_region(dsp, WMFW_ADSP1_DM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1674  					  adsp1_id.fw.id, adsp1=
_id.dm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1675  	if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1676  		return PTR_ERR(alg_region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1677  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1678  	/* Calculate offset and len=
gth in DSP words */
f6bc909e7673c3 Simon Trimmer 2021-09-13  1679  	pos =3D sizeof(adsp1_id) / =
sizeof(u32);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1680  	len =3D (sizeof(*adsp1_alg)=
 * n_algs) / sizeof(u32);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1681  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1682  	adsp1_alg =3D cs_dsp_read_a=
lgs(dsp, n_algs, mem, pos, len);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1683  	if (IS_ERR(adsp1_alg))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1684  		return PTR_ERR(adsp1_alg);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1685  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1686  	for (i =3D 0; i < n_algs; i=
++) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1687  		cs_dsp_info(dsp, "%d: ID %=
x v%d.%d.%d DM@%x ZM@%x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1688  			    i, be32_to_cpu(adsp1_=
alg[i].alg.id),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1689  			    (be32_to_cpu(adsp1_al=
g[i].alg.ver) & 0xff0000) >> 16,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1690  			    (be32_to_cpu(adsp1_al=
g[i].alg.ver) & 0xff00) >> 8,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1691  			    be32_to_cpu(adsp1_alg=
[i].alg.ver) & 0xff,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1692  			    be32_to_cpu(adsp1_alg=
[i].dm),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1693  			    be32_to_cpu(adsp1_alg=
[i].zm));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1694  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1695  		alg_region =3D cs_dsp_crea=
te_region(dsp, WMFW_ADSP1_DM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1696  						  adsp1_alg[i].alg.id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1697  						  adsp1_alg[i].dm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1698  		if (IS_ERR(alg_region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1699  			ret =3D PTR_ERR(alg_regio=
n);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1700  			goto out;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1701  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1702  		if (dsp->fw_ver =3D=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1703  			if (i + 1 < n_algs) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1704  				len =3D be32_to_cpu(adsp=
1_alg[i + 1].dm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1705  				len -=3D be32_to_cpu(ads=
p1_alg[i].dm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1706  				len *=3D 4;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1707  				cs_dsp_create_control(ds=
p, alg_region, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1708  						      len, NULL, 0, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1709  						      WMFW_CTL_TYPE_BY=
TES);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1710  			} else {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1711  				cs_dsp_warn(dsp, "Missin=
g length info for region DM with ID %x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1712  					    be32_to_cpu(adsp1_a=
lg[i].alg.id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1713  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1714  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1715  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1716  		alg_region =3D cs_dsp_crea=
te_region(dsp, WMFW_ADSP1_ZM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1717  						  adsp1_alg[i].alg.id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1718  						  adsp1_alg[i].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1719  		if (IS_ERR(alg_region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1720  			ret =3D PTR_ERR(alg_regio=
n);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1721  			goto out;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1722  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1723  		if (dsp->fw_ver =3D=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1724  			if (i + 1 < n_algs) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1725  				len =3D be32_to_cpu(adsp=
1_alg[i + 1].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1726  				len -=3D be32_to_cpu(ads=
p1_alg[i].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1727  				len *=3D 4;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1728  				cs_dsp_create_control(ds=
p, alg_region, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1729  						      len, NULL, 0, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1730  						      WMFW_CTL_TYPE_BY=
TES);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1731  			} else {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1732  				cs_dsp_warn(dsp, "Missin=
g length info for region ZM with ID %x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1733  					    be32_to_cpu(adsp1_a=
lg[i].alg.id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1734  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1735  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1736  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1737  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1738  out:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1739  	kfree(adsp1_alg);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1740  	return ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1741  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1742  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1743  static int cs_dsp_adsp2_setu=
p_algs(struct cs_dsp *dsp)
f6bc909e7673c3 Simon Trimmer 2021-09-13  1744  {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1745  	struct wmfw_adsp2_id_hdr ad=
sp2_id;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1746  	struct wmfw_adsp2_alg_hdr *=
adsp2_alg;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1747  	struct cs_dsp_alg_region *a=
lg_region;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1748  	const struct cs_dsp_region =
*mem;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1749  	unsigned int pos, len;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1750  	size_t n_algs;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1751  	int i, ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1752  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1753  	mem =3D cs_dsp_find_region(=
dsp, WMFW_ADSP2_XM);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1754  	if (WARN_ON(!mem))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1755  		return -EINVAL;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1756  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1757  	ret =3D regmap_raw_read(dsp=
->regmap, mem->base, &adsp2_id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1758  			      sizeof(adsp2_id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1759  	if (ret !=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1760  		cs_dsp_err(dsp, "Failed to=
 read algorithm info: %d\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1761  			   ret);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1762  		return ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1763  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1764  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1765  	n_algs =3D be32_to_cpu(adsp=
2_id.n_algs);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1766  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1767  	cs_dsp_parse_wmfw_id_header=
(dsp, &adsp2_id.fw, n_algs);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1768  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1769  	alg_region =3D cs_dsp_creat=
e_region(dsp, WMFW_ADSP2_XM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1770  					  adsp2_id.fw.id, adsp2=
_id.xm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1771  	if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13 @1772  		return PTR_ERR(alg_region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1773  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1774  	alg_region =3D cs_dsp_creat=
e_region(dsp, WMFW_ADSP2_YM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1775  					  adsp2_id.fw.id, adsp2=
_id.ym);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1776  	if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1777  		return PTR_ERR(alg_region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1778  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1779  	alg_region =3D cs_dsp_creat=
e_region(dsp, WMFW_ADSP2_ZM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1780  					  adsp2_id.fw.id, adsp2=
_id.zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1781  	if (IS_ERR(alg_region))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1782  		return PTR_ERR(alg_region);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1783  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1784  	/* Calculate offset and len=
gth in DSP words */
f6bc909e7673c3 Simon Trimmer 2021-09-13  1785  	pos =3D sizeof(adsp2_id) / =
sizeof(u32);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1786  	len =3D (sizeof(*adsp2_alg)=
 * n_algs) / sizeof(u32);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1787  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1788  	adsp2_alg =3D cs_dsp_read_a=
lgs(dsp, n_algs, mem, pos, len);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1789  	if (IS_ERR(adsp2_alg))
f6bc909e7673c3 Simon Trimmer 2021-09-13  1790  		return PTR_ERR(adsp2_alg);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1791  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1792  	for (i =3D 0; i < n_algs; i=
++) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1793  		cs_dsp_info(dsp,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1794  			    "%d: ID %x v%d.%d.%d =
XM@%x YM@%x ZM@%x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1795  			    i, be32_to_cpu(adsp2_=
alg[i].alg.id),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1796  			    (be32_to_cpu(adsp2_al=
g[i].alg.ver) & 0xff0000) >> 16,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1797  			    (be32_to_cpu(adsp2_al=
g[i].alg.ver) & 0xff00) >> 8,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1798  			    be32_to_cpu(adsp2_alg=
[i].alg.ver) & 0xff,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1799  			    be32_to_cpu(adsp2_alg=
[i].xm),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1800  			    be32_to_cpu(adsp2_alg=
[i].ym),
f6bc909e7673c3 Simon Trimmer 2021-09-13  1801  			    be32_to_cpu(adsp2_alg=
[i].zm));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1802  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1803  		alg_region =3D cs_dsp_crea=
te_region(dsp, WMFW_ADSP2_XM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1804  						  adsp2_alg[i].alg.id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1805  						  adsp2_alg[i].xm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1806  		if (IS_ERR(alg_region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1807  			ret =3D PTR_ERR(alg_regio=
n);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1808  			goto out;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1809  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1810  		if (dsp->fw_ver =3D=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1811  			if (i + 1 < n_algs) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1812  				len =3D be32_to_cpu(adsp=
2_alg[i + 1].xm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1813  				len -=3D be32_to_cpu(ads=
p2_alg[i].xm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1814  				len *=3D 4;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1815  				cs_dsp_create_control(ds=
p, alg_region, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1816  						      len, NULL, 0, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1817  						      WMFW_CTL_TYPE_BY=
TES);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1818  			} else {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1819  				cs_dsp_warn(dsp, "Missin=
g length info for region XM with ID %x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1820  					    be32_to_cpu(adsp2_a=
lg[i].alg.id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1821  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1822  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1823  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1824  		alg_region =3D cs_dsp_crea=
te_region(dsp, WMFW_ADSP2_YM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1825  						  adsp2_alg[i].alg.id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1826  						  adsp2_alg[i].ym);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1827  		if (IS_ERR(alg_region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1828  			ret =3D PTR_ERR(alg_regio=
n);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1829  			goto out;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1830  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1831  		if (dsp->fw_ver =3D=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1832  			if (i + 1 < n_algs) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1833  				len =3D be32_to_cpu(adsp=
2_alg[i + 1].ym);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1834  				len -=3D be32_to_cpu(ads=
p2_alg[i].ym);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1835  				len *=3D 4;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1836  				cs_dsp_create_control(ds=
p, alg_region, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1837  						      len, NULL, 0, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1838  						      WMFW_CTL_TYPE_BY=
TES);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1839  			} else {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1840  				cs_dsp_warn(dsp, "Missin=
g length info for region YM with ID %x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1841  					    be32_to_cpu(adsp2_a=
lg[i].alg.id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1842  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1843  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1844  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1845  		alg_region =3D cs_dsp_crea=
te_region(dsp, WMFW_ADSP2_ZM,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1846  						  adsp2_alg[i].alg.id,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1847  						  adsp2_alg[i].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1848  		if (IS_ERR(alg_region)) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1849  			ret =3D PTR_ERR(alg_regio=
n);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1850  			goto out;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1851  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1852  		if (dsp->fw_ver =3D=3D 0) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1853  			if (i + 1 < n_algs) {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1854  				len =3D be32_to_cpu(adsp=
2_alg[i + 1].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1855  				len -=3D be32_to_cpu(ads=
p2_alg[i].zm);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1856  				len *=3D 4;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1857  				cs_dsp_create_control(ds=
p, alg_region, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1858  						      len, NULL, 0, 0,
f6bc909e7673c3 Simon Trimmer 2021-09-13  1859  						      WMFW_CTL_TYPE_BY=
TES);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1860  			} else {
f6bc909e7673c3 Simon Trimmer 2021-09-13  1861  				cs_dsp_warn(dsp, "Missin=
g length info for region ZM with ID %x\n",
f6bc909e7673c3 Simon Trimmer 2021-09-13  1862  					    be32_to_cpu(adsp2_a=
lg[i].alg.id));
f6bc909e7673c3 Simon Trimmer 2021-09-13  1863  			}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1864  		}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1865  	}
f6bc909e7673c3 Simon Trimmer 2021-09-13  1866  =

f6bc909e7673c3 Simon Trimmer 2021-09-13  1867  out:
f6bc909e7673c3 Simon Trimmer 2021-09-13  1868  	kfree(adsp2_alg);
f6bc909e7673c3 Simon Trimmer 2021-09-13  1869  	return ret;
f6bc909e7673c3 Simon Trimmer 2021-09-13  1870  }
f6bc909e7673c3 Simon Trimmer 2021-09-13  1871  =


:::::: The code@line 1636 was first introduced by commit
:::::: f6bc909e7673c30abcbdb329e7d0aa2e83c103d7 firmware: cs_dsp: add drive=
r to support firmware loading on Cirrus Logic DSPs

:::::: TO: Simon Trimmer <simont@opensource.cirrus.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6917506416332946687==--

