Content-Type: multipart/mixed; boundary="===============6936298756133170199=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jgunthorpe:vfio_iommufd 27/29] drivers/vfio/vfio_main.c:1497 vfio_pin_pages() warn: impossible condition '(iova > (~0)) => (0-u32max > u32max)'
Date: Sun, 21 Aug 2022 19:07:55 +0800
Message-ID: <202208211931.y3eGH3ei-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6936298756133170199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://github.com/jgunthorpe/linux vfio_iommufd
head:   d2ab4343c9f524e9404059830828188b0f8a15b6
commit: 56e95c20bf11a9c515cc81a5a367bf7417459651 [27/29] vfio-iommufd: Supp=
ort iommufd for emulated VFIO devices
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m041-20220821 (https://download.01.org/0day-ci/=
archive/20220821/202208211931.y3eGH3ei-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vfio/vfio_main.c:1497 vfio_pin_pages() warn: impossible condition '=
(iova > (~0)) =3D> (0-u32max > u32max)'
drivers/vfio/vfio_main.c:1557 vfio_dma_rw() warn: impossible condition '(io=
va > (~0)) =3D> (0-u32max > u32max)'

vim +1497 drivers/vfio/vfio_main.c

c747f08aea847c drivers/vfio/vfio.c      Kirti Wankhede  2016-11-17  1477  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1478  /*
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1479   =
* Pin contiguous user pages and return their associated host pages for local
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1480   =
* domain only.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1481   =
* @device [in]  : device
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1482   =
* @iova [in]    : starting IOVA of user pages to be pinned.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1483   =
* @npage [in]   : count of pages to be pinned.  This count should not
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1484   =
*		   be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1485   =
* @prot [in]    : protection flags
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1486   =
* @pages[out]   : array of host pages
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1487   =
* Return error or number of pages pinned.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1488   =
*/
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1489  i=
nt vfio_pin_pages(struct vfio_device *device, dma_addr_t iova,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1490  	=
	   int npage, int prot, struct page **pages)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1491  {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1492  	=
if (!pages || !npage || !vfio_assert_device_open(device))
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1493  	=
	return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1494  	=
if (device->group->container)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1495  	=
	return vfio_container_pin_pages(device, iova, npage, prot, pages);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1496  	=
if (device->iommufd_access) {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11 @1497  	=
	if (iova > ULONG_MAX)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1498  	=
		return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1499  	=
	return iommufd_access_pin_pages(device->iommufd_access, iova,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1500  	=
					npage * PAGE_SIZE, pages,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1501  	=
					prot & IOMMU_WRITE);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1502  	}
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1503  	=
return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1504  }
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1505  E=
XPORT_SYMBOL(vfio_pin_pages);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1506  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1507  /*
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1508   =
* Unpin contiguous host pages for local domain only.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1509   =
* @device [in]  : device
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1510   =
* @iova [in]    : starting address of user pages to be unpinned.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1511   =
* @npage [in]   : count of pages to be unpinned.  This count should not
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1512   =
*                 be greater than VFIO_PIN_PAGES_MAX_ENTRIES.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1513   =
*/
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1514  v=
oid vfio_unpin_pages(struct vfio_device *device, dma_addr_t iova, int npage)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1515  {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1516  	=
if (WARN_ON(!vfio_assert_device_open(device)))
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1517  	=
	return;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1518  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1519  	=
if (device->group->container) {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1520  	=
	vfio_container_unpin_pages(device, iova, npage);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1521  	=
} else if (device->iommufd_access) {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1522  	=
	if (WARN_ON(iova > ULONG_MAX))
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1523  	=
		return;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1524  	=
	iommufd_access_unpin_pages(device->iommufd_access, iova,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1525  	=
				   npage * PAGE_SIZE);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1526  	}
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1527  }
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1528  E=
XPORT_SYMBOL(vfio_unpin_pages);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1529  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1530  /*
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1531   =
* This interface allows the CPUs to perform some sort of virtual DMA on
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1532   =
* behalf of the device.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1533   *
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1534   =
* CPUs read/write from/into a range of IOVAs pointing to user space memory
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1535   =
* into/from a kernel buffer.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1536   *
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1537   =
* As the read/write of user space memory is conducted via the CPUs and is
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1538   =
* not a real device DMA, it is not necessary to pin the user space memory.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1539   *
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1540   =
* @device [in]		: VFIO device
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1541   =
* @iova [in]		: base IOVA of a user space buffer
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1542   =
* @data [in]		: pointer to kernel buffer
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1543   =
* @len [in]		: kernel buffer length
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1544   =
* @write		: indicate read or write
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1545   =
* Return error code on failure or 0 on success.
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1546   =
*/
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1547  i=
nt vfio_dma_rw(struct vfio_device *device, dma_addr_t iova, void *data,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1548  	=
	size_t len, bool write)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1549  {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1550  	=
if (!data || len <=3D 0 || !vfio_assert_device_open(device))
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1551  	=
	return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1552  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1553  	=
if (device->group->container)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1554  	=
	return vfio_container_dma_rw(device, iova, data, len, write);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1555  =

56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1556  	=
if (device->iommufd_access) {
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11 @1557  	=
	if (iova > ULONG_MAX)
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1558  	=
		return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1559  	=
	return iommufd_access_rw(device->iommufd_access, iova, data,
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1560  	=
				 len, write);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1561  	}
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1562  	=
return -EINVAL;
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1563  }
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1564  E=
XPORT_SYMBOL(vfio_dma_rw);
56e95c20bf11a9 drivers/vfio/vfio_main.c Jason Gunthorpe 2022-08-11  1565  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6936298756133170199==--

