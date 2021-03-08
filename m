Content-Type: multipart/mixed; boundary="===============2230862083814059191=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/memory/omap-gpmc.c:1927:30: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour
Date: Mon, 08 Mar 2021 11:28:30 +0800
Message-ID: <202103081124.qEzrrZAJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2230862083814059191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)01.org
CC: linux-kernel(a)vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   144c79ef33536b4ecb4951e07dbc1f2b7fa99d32
commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile tes=
ting for most of the drivers
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
compiler: powerpc64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/memory/omap-gpmc.c:1927:30: warning: Shifting signed 32-bit valu=
e by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     config1 |=3D p->burst_wrap ? GPMC_CONFIG1_WRAPBURST_SUPP : 0;
                                ^

vim +1927 drivers/memory/omap-gpmc.c

246da26d37311c arch/arm/mach-omap2/gpmc.c Afzal Mohammed 2012-08-02  1851  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1852  =
/**
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1853  =
 * gpmc_cs_program_settings - programs non-timing related settings
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1854  =
 * @cs:		GPMC chip-select to program
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1855  =
 * @p:		pointer to GPMC settings structure
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1856  =
 *
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1857  =
 * Programs non-timing related settings for a GPMC chip-select, such as
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1858  =
 * bus-width, burst configuration, etc. Function should be called once
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1859  =
 * for each chip-select that is being used and must be called before
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1860  =
 * calling gpmc_cs_set_timings() as timing parameters in the CONFIG1
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1861  =
 * register will be initialised to zero by this function. Returns 0 on
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1862  =
 * success and appropriate negative error code on failure.
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1863  =
 */
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1864  =
int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1865  {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1866  =
	u32 config1;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1867  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1868  =
	if ((!p->device_width) || (p->device_width > GPMC_DEVWIDTH_16BIT)) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1869  =
		pr_err("%s: invalid width %d!", __func__, p->device_width);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1870  =
		return -EINVAL;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1871  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1872  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1873  =
	/* Address-data multiplexing not supported for NAND devices */
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1874  =
	if (p->device_nand && p->mux_add_data) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1875  =
		pr_err("%s: invalid configuration!\n", __func__);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1876  =
		return -EINVAL;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1877  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1878  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1879  =
	if ((p->mux_add_data > GPMC_MUX_AD) ||
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1880  =
	    ((p->mux_add_data =3D=3D GPMC_MUX_AAD) &&
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1881  =
	     !(gpmc_capability & GPMC_HAS_MUX_AAD))) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1882  =
		pr_err("%s: invalid multiplex configuration!\n", __func__);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1883  =
		return -EINVAL;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1884  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1885  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1886  =
	/* Page/burst mode supports lengths of 4, 8 and 16 bytes */
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1887  =
	if (p->burst_read || p->burst_write) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1888  =
		switch (p->burst_len) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1889  =
		case GPMC_BURST_4:
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1890  =
		case GPMC_BURST_8:
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1891  =
		case GPMC_BURST_16:
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1892  =
			break;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1893  =
		default:
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1894  =
			pr_err("%s: invalid page/burst-length (%d)\n",
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1895  =
			       __func__, p->burst_len);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1896  =
			return -EINVAL;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1897  =
		}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1898  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1899  =

2b54057c9b2638 arch/arm/mach-omap2/gpmc.c Roger Quadros  2014-09-02  1900  =
	if (p->wait_pin > gpmc_nr_waitpins) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1901  =
		pr_err("%s: invalid wait-pin (%d)\n", __func__, p->wait_pin);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1902  =
		return -EINVAL;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1903  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1904  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1905  =
	config1 =3D GPMC_CONFIG1_DEVICESIZE((p->device_width - 1));
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1906  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1907  =
	if (p->sync_read)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1908  =
		config1 |=3D GPMC_CONFIG1_READTYPE_SYNC;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1909  =
	if (p->sync_write)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1910  =
		config1 |=3D GPMC_CONFIG1_WRITETYPE_SYNC;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1911  =
	if (p->wait_on_read)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1912  =
		config1 |=3D GPMC_CONFIG1_WAIT_READ_MON;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1913  =
	if (p->wait_on_write)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1914  =
		config1 |=3D GPMC_CONFIG1_WAIT_WRITE_MON;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1915  =
	if (p->wait_on_read || p->wait_on_write)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1916  =
		config1 |=3D GPMC_CONFIG1_WAIT_PIN_SEL(p->wait_pin);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1917  =
	if (p->device_nand)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1918  =
		config1	|=3D GPMC_CONFIG1_DEVICETYPE(GPMC_DEVICETYPE_NAND);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1919  =
	if (p->mux_add_data)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1920  =
		config1	|=3D GPMC_CONFIG1_MUXTYPE(p->mux_add_data);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1921  =
	if (p->burst_read)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1922  =
		config1 |=3D GPMC_CONFIG1_READMULTIPLE_SUPP;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1923  =
	if (p->burst_write)
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1924  =
		config1 |=3D GPMC_CONFIG1_WRITEMULTIPLE_SUPP;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1925  =
	if (p->burst_read || p->burst_write) {
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1926  =
		config1 |=3D GPMC_CONFIG1_PAGE_LEN(p->burst_len >> 3);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21 @1927  =
		config1 |=3D p->burst_wrap ? GPMC_CONFIG1_WRAPBURST_SUPP : 0;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1928  =
	}
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1929  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1930  =
	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, config1);
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1931  =

aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1932  =
	return 0;
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1933  }
aa8d4767da2a2a arch/arm/mach-omap2/gpmc.c Jon Hunter     2013-02-21  1934  =


:::::: The code at line 1927 was first introduced by commit
:::::: aa8d4767da2a2a29a628dc0dadb59a010f0ec18e ARM: OMAP2+: Add function f=
or configuring GPMC settings

:::::: TO: Jon Hunter <jon-hunter@ti.com>
:::::: CC: Jon Hunter <jon-hunter@ti.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2230862083814059191==--

