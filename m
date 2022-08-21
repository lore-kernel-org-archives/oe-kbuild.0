Content-Type: multipart/mixed; boundary="===============7127075082282468352=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 12/27] drivers/vfio/vfio_main.c:1756 vfio_ioctl_device_feature_logging_report() warn: comparison of a potentially tagged address (vfio_ioctl_device_feature_logging_report, -2, report.page_size)
Date: Mon, 22 Aug 2022 06:38:54 +0800
Message-ID: <202208220607.xyC72xKD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7127075082282468352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yishai Hadas <yishaih@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   4320b084b9047a5eb52a5cbc3cfe1801517866ad
commit: 7c9d8c9c4d4373a87864e5caaf6d02e7d243f3df [12/27] vfio: Introduce th=
e DMA logging feature support
:::::: branch date: 3 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220822/202208220607.xyC72xKD-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vfio/vfio_main.c:1756 vfio_ioctl_device_feature_logging_report() wa=
rn: comparison of a potentially tagged address (vfio_ioctl_device_feature_l=
ogging_report, -2, report.page_size)

vim +1756 drivers/vfio/vfio_main.c

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1731  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1732  static int
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1733  vfio_ioctl_device_feature_log=
ging_report(struct vfio_device *device,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1734  					 u32 flags, void __user =
*arg,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1735  					 size_t argsz)
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1736  {
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1737  	size_t minsz =3D
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1738  		offsetofend(struct vfio_dev=
ice_feature_dma_logging_report,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1739  			    bitmap);
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1740  	struct vfio_device_feature_d=
ma_logging_report report;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1741  	struct iova_bitmap_iter iter;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1742  	int ret;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1743  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1744  	if (!device->log_ops)
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1745  		return -ENOTTY;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1746  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1747  	ret =3D vfio_check_feature(f=
lags, argsz,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1748  				 VFIO_DEVICE_FEATURE_GET,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1749  				 sizeof(report));
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1750  	if (ret !=3D 1)
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1751  		return ret;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1752  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1753  	if (copy_from_user(&report, =
arg, minsz))
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1754  		return -EFAULT;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1755  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31 @1756  	if (report.page_size < PAGE_=
SIZE || !is_power_of_2(report.page_size))
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1757  		return -EINVAL;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1758  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1759  	ret =3D iova_bitmap_iter_ini=
t(&iter, report.iova, report.length,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1760  				    report.page_size,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1761  				    u64_to_user_ptr(repor=
t.bitmap));
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1762  	if (ret)
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1763  		return ret;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1764  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1765  	for (; !iova_bitmap_iter_don=
e(&iter) && !ret;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1766  	     ret =3D iova_bitmap_ite=
r_advance(&iter)) {
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1767  		ret =3D device->log_ops->lo=
g_read_and_clear(device,
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1768  			iova_bitmap_iova(&iter),
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1769  			iova_bitmap_length(&iter),=
 &iter.dirty);
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1770  		if (ret)
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1771  			break;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1772  	}
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1773  =

7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1774  	iova_bitmap_iter_free(&iter);
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1775  	return ret;
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1776  }
7c9d8c9c4d4373 Yishai Hadas 2022-05-31  1777  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7127075082282468352==--

