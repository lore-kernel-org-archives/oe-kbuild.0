Content-Type: multipart/mixed; boundary="===============7964952803057940287=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/intel/dmar.c:2051:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Mon, 15 Jun 2020 07:44:36 +0800
Message-ID: <202006150719.xkoao4AQ%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7964952803057940287==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Jerry Snitselaar <jsnitsel@redhat.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   96144c58abe7ff767e754b5b80995f7b8846d49b
commit: 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178 iommu/vt-d: Move Intel IOM=
MU driver into subdirectory
date:   4 days ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iommu/intel/dmar.c:2051:6: warning: Variable 'ret' is reassigned=
 a value before the old one has been used. [redundantAssignment]
    ret =3D dmar_walk_remapping_entries(start, obj->buffer.length, &callbac=
k);
        ^
   drivers/iommu/intel/dmar.c:2029:0: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    int ret =3D -ENODEV;
   ^
   drivers/iommu/intel/dmar.c:2051:6: note: Variable 'ret' is reassigned a =
value before the old one has been used.
    ret =3D dmar_walk_remapping_entries(start, obj->buffer.length, &callbac=
k);
        ^
>> drivers/iommu/intel/dmar.c:1543:45: warning: Uninitialized variable: sts=
 [uninitvar]
    IOMMU_WAIT_OP(iommu, DMAR_GSTS_REG, readl, (sts & DMA_GSTS_QIES), sts);
                                               ^
>> drivers/iommu/intel/dmar.c:1866:22: warning: Uninitialized variable: pas=
id [uninitvar]
          pasid_present ? pasid : -1,
                        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D672cf6df9b8a3a6d70a6a5c30397f76fa40d3178
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git remote update linus
git checkout 672cf6df9b8a3a6d70a6a5c30397f76fa40d3178
vim +/ret +2051 drivers/iommu/intel/dmar.c

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1803  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1804 =
 #define PRIMARY_FAULT_REG_LEN (16)
1531a6a6b81a4e drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1805 =
 irqreturn_t dmar_fault(int irq, void *dev_id)
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1806 =
 {
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1807 =
 	struct intel_iommu *iommu =3D dev_id;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1808 =
 	int reg, fault_index;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1809 =
 	u32 fault_status;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1810 =
 	unsigned long flag;
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1811 =
 	static DEFINE_RATELIMIT_STATE(rs,
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1812 =
 				      DEFAULT_RATELIMIT_INTERVAL,
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1813 =
 				      DEFAULT_RATELIMIT_BURST);
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1814  =

1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner       2011-07-19  1815 =
 	raw_spin_lock_irqsave(&iommu->register_lock, flag);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1816 =
 	fault_status =3D readl(iommu->reg + DMAR_FSTS_REG);
6c50d79f66382d drivers/iommu/dmar.c Dmitry Safonov        2018-03-31  1817 =
 	if (fault_status && __ratelimit(&rs))
bf947fcb77ff85 drivers/iommu/dmar.c Donald Dutile         2012-06-04  1818 =
 		pr_err("DRHD: handling fault status reg %x\n", fault_status);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1819  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1820 =
 	/* TBD: ignore advanced fault log currently */
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1821 =
 	if (!(fault_status & DMA_FSTS_PPF))
bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1822 =
 		goto unlock_exit;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1823  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1824 =
 	fault_index =3D dma_fsts_fault_record_index(fault_status);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1825 =
 	reg =3D cap_fault_reg_offset(iommu->cap);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1826 =
 	while (1) {
6c50d79f66382d drivers/iommu/dmar.c Dmitry Safonov        2018-03-31  1827 =
 		/* Disable printing, simply clear the fault when ratelimited */
6c50d79f66382d drivers/iommu/dmar.c Dmitry Safonov        2018-03-31  1828 =
 		bool ratelimited =3D !__ratelimit(&rs);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1829 =
 		u8 fault_reason;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1830 =
 		u16 source_id;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1831 =
 		u64 guest_addr;
fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06  1832 =
 		int type, pasid;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1833 =
 		u32 data;
fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06  1834 =
 		bool pasid_present;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1835  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1836 =
 		/* highest 32 bits */
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1837 =
 		data =3D readl(iommu->reg + reg +
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1838 =
 				fault_index * PRIMARY_FAULT_REG_LEN + 12);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1839 =
 		if (!(data & DMA_FRCD_F))
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1840 =
 			break;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1841  =

c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1842 =
 		if (!ratelimited) {
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1843 =
 			fault_reason =3D dma_frcd_fault_reason(data);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1844 =
 			type =3D dma_frcd_type(data);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1845  =

fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06  1846 =
 			pasid =3D dma_frcd_pasid_value(data);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1847 =
 			data =3D readl(iommu->reg + reg +
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1848 =
 				     fault_index * PRIMARY_FAULT_REG_LEN + 8);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1849 =
 			source_id =3D dma_frcd_source_id(data);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1850  =

fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06  1851 =
 			pasid_present =3D dma_frcd_pasid_present(data);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1852 =
 			guest_addr =3D dmar_readq(iommu->reg + reg +
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1853 =
 					fault_index * PRIMARY_FAULT_REG_LEN);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1854 =
 			guest_addr =3D dma_frcd_page_addr(guest_addr);
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1855 =
 		}
c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1856  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1857 =
 		/* clear the fault */
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1858 =
 		writel(DMA_FRCD_F, iommu->reg + reg +
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1859 =
 			fault_index * PRIMARY_FAULT_REG_LEN + 12);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1860  =

1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner       2011-07-19  1861 =
 		raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1862  =

c43fce4eebae25 drivers/iommu/dmar.c Alex Williamson       2016-03-17  1863 =
 		if (!ratelimited)
fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06  1864 =
 			/* Using pasid -1 if pasid is not present */
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1865 =
 			dmar_fault_do_one(iommu, type, fault_reason,
fd730007a06e9b drivers/iommu/dmar.c Kyung Min Park        2019-09-06 @1866 =
 					  pasid_present ? pasid : -1,
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1867 =
 					  source_id, guest_addr);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1868  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1869 =
 		fault_index++;
8211a7b5857914 drivers/pci/dmar.c   Troy Heber            2009-08-19  1870 =
 		if (fault_index >=3D cap_num_fault_regs(iommu->cap))
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1871 =
 			fault_index =3D 0;
1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner       2011-07-19  1872 =
 		raw_spin_lock_irqsave(&iommu->register_lock, flag);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1873 =
 	}
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1874  =

973b546451fdf1 drivers/iommu/dmar.c Lu Baolu              2017-11-03  1875 =
 	writel(DMA_FSTS_PFO | DMA_FSTS_PPF | DMA_FSTS_PRO,
973b546451fdf1 drivers/iommu/dmar.c Lu Baolu              2017-11-03  1876 =
 	       iommu->reg + DMAR_FSTS_REG);
bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1877  =

bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1878 =
 unlock_exit:
1f5b3c3fd2d73d drivers/iommu/dmar.c Thomas Gleixner       2011-07-19  1879 =
 	raw_spin_unlock_irqrestore(&iommu->register_lock, flag);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1880 =
 	return IRQ_HANDLED;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1881 =
 }
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1882  =

0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1883 =
 int dmar_set_interrupt(struct intel_iommu *iommu)
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1884 =
 {
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1885 =
 	int irq, ret;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1886  =

9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1887 =
 	/*
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1888 =
 	 * Check if the fault interrupt is already initialized.
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1889 =
 	 */
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1890 =
 	if (iommu->irq)
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1891 =
 		return 0;
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1892  =

34742db8eaf9ff drivers/iommu/dmar.c Jiang Liu             2015-04-13  1893 =
 	irq =3D dmar_alloc_hwirq(iommu->seq_id, iommu->node, iommu);
34742db8eaf9ff drivers/iommu/dmar.c Jiang Liu             2015-04-13  1894 =
 	if (irq > 0) {
34742db8eaf9ff drivers/iommu/dmar.c Jiang Liu             2015-04-13  1895 =
 		iommu->irq =3D irq;
34742db8eaf9ff drivers/iommu/dmar.c Jiang Liu             2015-04-13  1896 =
 	} else {
9f10e5bf62f7b9 drivers/iommu/dmar.c Joerg Roedel          2015-06-12  1897 =
 		pr_err("No free IRQ vectors\n");
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1898 =
 		return -EINVAL;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1899 =
 	}
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1900  =

477694e71113fd drivers/iommu/dmar.c Thomas Gleixner       2011-07-19  1901 =
 	ret =3D request_irq(irq, dmar_fault, IRQF_NO_THREAD, iommu->name, iommu);
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1902 =
 	if (ret)
9f10e5bf62f7b9 drivers/iommu/dmar.c Joerg Roedel          2015-06-12  1903 =
 		pr_err("Can't request irq\n");
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1904 =
 	return ret;
0ac2491f57af56 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1905 =
 }
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1906  =

9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1907 =
 int __init enable_drhd_fault_handling(void)
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1908 =
 {
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1909 =
 	struct dmar_drhd_unit *drhd;
7c9197791a0cbb drivers/iommu/dmar.c Jiang Liu             2014-01-06  1910 =
 	struct intel_iommu *iommu;
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1911  =

9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1912 =
 	/*
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1913 =
 	 * Enable fault control interrupt.
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1914 =
 	 */
7c9197791a0cbb drivers/iommu/dmar.c Jiang Liu             2014-01-06  1915 =
 	for_each_iommu(iommu, drhd) {
bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1916 =
 		u32 fault_status;
7c9197791a0cbb drivers/iommu/dmar.c Jiang Liu             2014-01-06  1917 =
 		int ret =3D dmar_set_interrupt(iommu);
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1918  =

9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1919 =
 		if (ret) {
e9071b0be5e7ce drivers/iommu/dmar.c Donald Dutile         2012-06-08  1920 =
 			pr_err("DRHD %Lx: failed to enable fault, interrupt, ret %d\n",
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1921 =
 			       (unsigned long long)drhd->reg_base_addr, ret);
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1922 =
 			return -1;
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1923 =
 		}
7f99d946e71e71 drivers/pci/dmar.c   Suresh Siddha         2010-11-30  1924  =

7f99d946e71e71 drivers/pci/dmar.c   Suresh Siddha         2010-11-30  1925 =
 		/*
7f99d946e71e71 drivers/pci/dmar.c   Suresh Siddha         2010-11-30  1926 =
 		 * Clear any previous faults.
7f99d946e71e71 drivers/pci/dmar.c   Suresh Siddha         2010-11-30  1927 =
 		 */
7f99d946e71e71 drivers/pci/dmar.c   Suresh Siddha         2010-11-30  1928 =
 		dmar_fault(iommu->irq, iommu);
bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1929 =
 		fault_status =3D readl(iommu->reg + DMAR_FSTS_REG);
bd5cdad0c8e0f0 drivers/iommu/dmar.c Li, Zhen-Hua          2013-03-25  1930 =
 		writel(fault_status, iommu->reg + DMAR_FSTS_REG);
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1931 =
 	}
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1932  =

9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1933 =
 	return 0;
9d783ba0427712 drivers/pci/dmar.c   Suresh Siddha         2009-03-16  1934 =
 }
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1935  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1936 =
 /*
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1937 =
  * Re-enable Queued Invalidation interface.
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1938 =
  */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1939 =
 int dmar_reenable_qi(struct intel_iommu *iommu)
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1940 =
 {
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1941 =
 	if (!ecap_qis(iommu->ecap))
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1942 =
 		return -ENOENT;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1943  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1944 =
 	if (!iommu->qi)
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1945 =
 		return -ENOENT;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1946  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1947 =
 	/*
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1948 =
 	 * First disable queued invalidation.
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1949 =
 	 */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1950 =
 	dmar_disable_qi(iommu);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1951 =
 	/*
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1952 =
 	 * Then enable queued invalidation again. Since there is no pending
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1953 =
 	 * invalidation requests now, it's safe to re-enable queued
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1954 =
 	 * invalidation.
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1955 =
 	 */
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1956 =
 	__dmar_enable_qi(iommu);
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1957  =

eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1958 =
 	return 0;
eb4a52bc660ea8 drivers/pci/dmar.c   Fenghua Yu            2009-03-27  1959 =
 }
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1960  =

074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1961 =
 /*
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1962 =
  * Check interrupt remapping support in DMAR table description.
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1963 =
  */
0b8973a81876d9 drivers/pci/dmar.c   Tony Luck             2009-12-16  1964 =
 int __init dmar_ir_support(void)
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1965 =
 {
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1966 =
 	struct acpi_table_dmar *dmar;
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1967 =
 	dmar =3D (struct acpi_table_dmar *)dmar_tbl;
4f506e07e0a3df drivers/pci/dmar.c   Arnaud Patard         2010-03-25  1968 =
 	if (!dmar)
4f506e07e0a3df drivers/pci/dmar.c   Arnaud Patard         2010-03-25  1969 =
 		return 0;
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1970 =
 	return dmar->flags & 0x1;
074835f0143b83 drivers/pci/dmar.c   Youquan Song          2009-09-09  1971 =
 }
694835dc227ad2 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1972  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1973 =
 /* Check whether DMAR units are in use */
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1974 =
 static inline bool dmar_in_use(void)
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1975 =
 {
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1976 =
 	return irq_remapping_enabled || intel_iommu_enabled;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1977 =
 }
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1978  =

a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1979 =
 static int __init dmar_free_unused_resources(void)
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1980 =
 {
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1981 =
 	struct dmar_drhd_unit *dmaru, *dmaru_n;
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1982  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  1983 =
 	if (dmar_in_use())
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1984 =
 		return 0;
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1985  =

2e455289303886 drivers/iommu/dmar.c Jiang Liu             2014-02-19  1986 =
 	if (dmar_dev_scope_status !=3D 1 && !list_empty(&dmar_drhd_units))
59ce0515cdaf3b drivers/iommu/dmar.c Jiang Liu             2014-02-19  1987 =
 		bus_unregister_notifier(&pci_bus_type, &dmar_pci_bus_nb);
59ce0515cdaf3b drivers/iommu/dmar.c Jiang Liu             2014-02-19  1988  =

3a5670e8ac932c drivers/iommu/dmar.c Jiang Liu             2014-02-19  1989 =
 	down_write(&dmar_global_lock);
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1990 =
 	list_for_each_entry_safe(dmaru, dmaru_n, &dmar_drhd_units, list) {
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1991 =
 		list_del(&dmaru->list);
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1992 =
 		dmar_free_drhd(dmaru);
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1993 =
 	}
3a5670e8ac932c drivers/iommu/dmar.c Jiang Liu             2014-02-19  1994 =
 	up_write(&dmar_global_lock);
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1995  =

a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1996 =
 	return 0;
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1997 =
 }
a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1998  =

a868e6b7b661c3 drivers/iommu/dmar.c Jiang Liu             2014-01-06  1999 =
 late_initcall(dmar_free_unused_resources);
4db77ff3237a88 drivers/pci/dmar.c   Konrad Rzeszutek Wilk 2010-08-26  2000 =
 IOMMU_INIT_POST(detect_intel_iommu);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2001  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2002 =
 /*
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2003 =
  * DMAR Hotplug Support
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2004 =
  * For more details, please refer to Intel(R) Virtualization Technology
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2005 =
  * for Directed-IO Architecture Specifiction, Rev 2.2, Section 8.8
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2006 =
  * "Remapping Hardware Unit Hot Plug".
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2007 =
  */
94116f8126de97 drivers/iommu/dmar.c Andy Shevchenko       2017-06-05  2008 =
 static guid_t dmar_hp_guid =3D
94116f8126de97 drivers/iommu/dmar.c Andy Shevchenko       2017-06-05  2009 =
 	GUID_INIT(0xD8C1A3A6, 0xBE9B, 0x4C9B,
94116f8126de97 drivers/iommu/dmar.c Andy Shevchenko       2017-06-05  2010 =
 		  0x91, 0xBF, 0xC3, 0xCB, 0x81, 0xFC, 0x5D, 0xAF);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2011  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2012 =
 /*
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2013 =
  * Currently there's only one revision and BIOS will not check the revisio=
n id,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2014 =
  * so use 0 for safety.
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2015 =
  */
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2016 =
 #define	DMAR_DSM_REV_ID			0
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2017 =
 #define	DMAR_DSM_FUNC_DRHD		1
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2018 =
 #define	DMAR_DSM_FUNC_ATSR		2
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2019 =
 #define	DMAR_DSM_FUNC_RHSA		3
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2020  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2021 =
 static inline bool dmar_detect_dsm(acpi_handle handle, int func)
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2022 =
 {
94116f8126de97 drivers/iommu/dmar.c Andy Shevchenko       2017-06-05  2023 =
 	return acpi_check_dsm(handle, &dmar_hp_guid, DMAR_DSM_REV_ID, 1 << func);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2024 =
 }
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2025  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2026 =
 static int dmar_walk_dsm_resource(acpi_handle handle, int func,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2027 =
 				  dmar_res_handler_t handler, void *arg)
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2028 =
 {
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2029 =
 	int ret =3D -ENODEV;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2030 =
 	union acpi_object *obj;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2031 =
 	struct acpi_dmar_header *start;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2032 =
 	struct dmar_res_callback callback;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2033 =
 	static int res_type[] =3D {
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2034 =
 		[DMAR_DSM_FUNC_DRHD] =3D ACPI_DMAR_TYPE_HARDWARE_UNIT,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2035 =
 		[DMAR_DSM_FUNC_ATSR] =3D ACPI_DMAR_TYPE_ROOT_ATS,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2036 =
 		[DMAR_DSM_FUNC_RHSA] =3D ACPI_DMAR_TYPE_HARDWARE_AFFINITY,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2037 =
 	};
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2038  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2039 =
 	if (!dmar_detect_dsm(handle, func))
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2040 =
 		return 0;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2041  =

94116f8126de97 drivers/iommu/dmar.c Andy Shevchenko       2017-06-05  2042 =
 	obj =3D acpi_evaluate_dsm_typed(handle, &dmar_hp_guid, DMAR_DSM_REV_ID,
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2043 =
 				      func, NULL, ACPI_TYPE_BUFFER);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2044 =
 	if (!obj)
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2045 =
 		return -ENODEV;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2046  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2047 =
 	memset(&callback, 0, sizeof(callback));
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2048 =
 	callback.cb[res_type[func]] =3D handler;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2049 =
 	callback.arg[res_type[func]] =3D arg;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2050 =
 	start =3D (struct acpi_dmar_header *)obj->buffer.pointer;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09 @2051 =
 	ret =3D dmar_walk_remapping_entries(start, obj->buffer.length, &callback);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2052  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2053 =
 	ACPI_FREE(obj);
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2054  =

6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2055 =
 	return ret;
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2056 =
 }
6b1972493a84f8 drivers/iommu/dmar.c Jiang Liu             2014-11-09  2057  =


:::::: The code at line 2051 was first introduced by commit
:::::: 6b1972493a84f8fe13ff9d202745590f6c53d670 iommu/vt-d: Implement DMAR =
unit hotplug framework

:::::: TO: Jiang Liu <jiang.liu@linux.intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7964952803057940287==--

