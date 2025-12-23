Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011C1EDA3C;
	Tue, 23 Dec 2025 04:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465685; cv=none; b=OBIDK1Z7EictvHq0Pz8+1UGoKr1EDk7CA047RiA8r4+nm/Z6Jkh8dW1oBlaAFZf9oBYvTpB+XaM5AnwgYzraDhLYVU6kqlQcGeoCcCumdiU/PcpskFzTpmNz6zuCB901sAQplC+3wfaQgkHBYymfkP0Qp/QKCw0ecIrc3qCoNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465685; c=relaxed/simple;
	bh=xnRLuSfHdapEY6wNPtLsgrn5IplhiqGYGD6xpiXGAZo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KNqWfZrLBMXC7qqm5qC243OImmvTMcOUEqjlI5BrRtKT1G/lmGW8jOCX8YSneHATfpBwGvG5yswN9GGXmo+gQJNDcxTH74VDjspYz7o6QIa/GEyHRdnZzKdcHBcE16gx4szYM2wwrirbCTq9/2YymZtui5UMoQRbfG/YgbUR24A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; arc=none smtp.client-ip=115.124.28.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Received: from guoyaxing.localdomain(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.fqpBkQe_1766465655 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 23 Dec 2025 12:54:29 +0800
From: Yaxing Guo <guoyaxing@bosc.ac.cn>
To: dan.carpenter@linaro.org,
	oe-kbuild@lists.linux.dev
Cc: lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org,
	guoyaxing@bosc.ac.cn
Subject: [PATCH v4] uio: Add SVA support for PCI devices via uio_pci_generic_sva.c
Date: Tue, 23 Dec 2025 12:54:09 +0800
Message-Id: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces a new UIO driver, uio_pci_generic_sva, which
extends the functionality of uio_pci_generic by adding support for
Shared Virtual Addressing (SVA) when IOMMU is enabled in the system.

The key enhancement allows PCI devices to directly use user-space virtual
addresses for DMA operations, eliminating the need for bounce buffers or
explicit IOVA mapping. This is achieved by leveraging the kernel's IOMMU-SVA
subsystem, including process address space attachment, page fault handling,
and shared context management between CPU and device.

With this driver, userspace applications can perform zero-copy DMA using
native pointers:

   void *addr = malloc(N);
   set_dma_addr((uint64_t)addr);  // Passing user VA directly
   start_dma();

The device can now access 'addr' through the IOMMU's PASID-based translation,
provided that the underlying IOMMU hardware (e.g., Intel VT-d 3.1+, AMD-Vi,
ARM SMMU, RISCV IOMMU) and platform support SVA.

Dependencies:
- CONFIG_IOMMU_SVA must be enabled.
- The platform must support PRI (Page Request Interface) and PASID.
- Device drivers/userspace must handle page faults if demand-paging is used.

The implementation reuses core logic from uio_pci_generic.c while adding
PASID setting, and integration with the IOMMU SVA APIs.

Also, add a read-only sysfs attribute 'pasid' to expose the Process Address
Space ID assigned by IOMMU driver when binding an SVA-enabled device.
For details, refer to the ABI documentation for uio_pci_sva driver sysfs attribute
(Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid).

Signed-off-by: Yaxing Guo <guoyaxing@bosc.ac.cn>
---
Changes in v4:
 -- Fix the errors about 'udev' could be null and double free that
    reported by: kernel test robot <lkp@intel.com> and Dan Carpenter <dan.carpenter@linaro.org>
    error report: https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/

 .../testing/sysfs-driver-uio_pci_sva-pasid    |  29 +++
 drivers/uio/Kconfig                           |  12 ++
 drivers/uio/Makefile                          |   1 +
 drivers/uio/uio_pci_generic_sva.c             | 190 ++++++++++++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
 create mode 100644 drivers/uio/uio_pci_generic_sva.c

diff --git a/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid b/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
new file mode 100644
index 000000000000..6892fe46cea8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-uio_pci_sva-pasid
@@ -0,0 +1,29 @@
+What:		/sys/bus/pci/drivers/uio_pci_sva/<pci_dev>/pasid
+Date:		September 2025
+Contact:	Yaxing Guo <guoyaxing@bosc.ac.cn>
+Description:
+		Process Address Space ID (PASID) assigned by IOMMU driver to
+		the device for use with Shared Virtual Addressing (SVA).
+
+		This read-only attribute exposes the PASID (A 20-bit identifier
+		used in PCIe Address Translation Services and iommu table walks)
+		allocated by the IOMMU driver during sva device binding.
+
+		User-space UIO applications must read this attribute to obtain
+		the PASID and program it into the device's configuration registers.
+		This enables the device to perform DMA using user-space virtual
+		address, with address translation handled by IOMMU.
+
+		UIO User-space applications must:
+		- Opening device and Mapping the device's register space via /dev/uioX
+		(This triggers the IOMMU driver to allocate the PASID)
+		- Reading the PASID from sysfs
+		- Writing the PASID to a device-specific register (with example offset)
+		The code may be like:
+
+		map = mmap(..., "/dev/uio0", ...);
+
+		f = fopen("/sys/.../pasid", "r");
+		fscanf(f, "%d", &pasid);
+
+		map[REG_PASID_OFFSET] = pasid;
diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index b060dcd7c635..9e06f0e9cbdf 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -164,4 +164,16 @@ config UIO_DFL
 	    opae-sdk/tools/libopaeuio/
 
 	  If you compile this as a module, it will be called uio_dfl.
+
+config UIO_PCI_GENERIC_SVA
+	tristate "Generic driver for PCI Express that supports sva"
+	depends on PCI && IOMMU_SVA
+	help
+	  Userspace I/O driver for PCI devices that support Shared Virtual
+	  Addressing (SVA), enabling direct use of user-space virtual
+	  addresses in device DMA operations via IOMMU hardware.
+
+	  This driver binds to PCI devices and exposes them to userspace
+	  via the UIO framework.
+
 endif
diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
index 1c5f3b5a95cf..5352e21e918d 100644
--- a/drivers/uio/Makefile
+++ b/drivers/uio/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
 obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
 obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
 obj-$(CONFIG_UIO_DFL)	+= uio_dfl.o
+obj-$(CONFIG_UIO_PCI_GENERIC_SVA)  += uio_pci_generic_sva.o
diff --git a/drivers/uio/uio_pci_generic_sva.c b/drivers/uio/uio_pci_generic_sva.c
new file mode 100644
index 000000000000..9c9f30c4f8b0
--- /dev/null
+++ b/drivers/uio/uio_pci_generic_sva.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * UIO PCI Express sva driver
+ *
+ * Copyright (c) 2025 Beijing Institute of Open Source Chip (BOSC)
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/uio_driver.h>
+#include <linux/iommu.h>
+
+struct uio_pci_sva_dev {
+	struct pci_dev *pdev;
+	struct uio_info info;
+	struct iommu_sva *sva_handle;
+	int pasid;
+};
+
+static irqreturn_t irq_handler(int irq, struct uio_info *dev_info)
+{
+	return IRQ_HANDLED;
+}
+
+static int uio_pci_sva_open(struct uio_info *info, struct inode *inode)
+{
+	struct iommu_sva *handle;
+	struct uio_pci_sva_dev *udev = info->priv;
+	struct iommu_domain *domain;
+
+	if (!udev || !udev->pdev)
+		return -ENODEV;
+
+	domain = iommu_get_domain_for_dev(&udev->pdev->dev);
+	if (domain)
+		iommu_detach_device(domain, &udev->pdev->dev);
+
+	handle = iommu_sva_bind_device(&udev->pdev->dev, current->mm);
+	if (IS_ERR(handle))
+		return -EINVAL;
+
+	udev->pasid = iommu_sva_get_pasid(handle);
+
+	udev->sva_handle = handle;
+
+	return 0;
+}
+
+static int uio_pci_sva_release(struct uio_info *info, struct inode *inode)
+{
+	struct uio_pci_sva_dev *udev = info->priv;
+
+	if (!udev || !udev->pdev)
+		return -ENODEV;
+
+	iommu_sva_unbind_device(udev->sva_handle);
+
+	return 0;
+}
+
+static int probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	struct uio_pci_sva_dev *udev;
+	int ret, i, irq = 0;
+
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "pci_enable_device failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret)
+		goto out_disable;
+
+	pci_set_master(pdev);
+
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSIX | PCI_IRQ_MSI);
+	if (ret > 0) {
+		irq = pci_irq_vector(pdev, 0);
+		if (irq < 0) {
+			dev_err(&pdev->dev, "Failed to get MSI vector\n");
+			ret = irq;
+			goto out_disable;
+		}
+	} else
+		dev_warn(&pdev->dev,
+			 "No IRQ vectors available (%d), using polling\n", ret);
+
+	udev = devm_kzalloc(&pdev->dev, sizeof(struct uio_pci_sva_dev),
+			    GFP_KERNEL);
+	if (!udev) {
+		ret =  -ENOMEM;
+		goto out_disable;
+	}
+
+	udev->pdev = pdev;
+	udev->info.name = "uio_pci_sva";
+	udev->info.version = "0.0.1";
+	udev->info.open = uio_pci_sva_open;
+	udev->info.release = uio_pci_sva_release;
+	udev->info.irq = irq;
+	udev->info.handler = irq_handler;
+	udev->info.priv = udev;
+
+	for (i = 0; i < MAX_UIO_MAPS; i++) {
+		struct resource *r = &pdev->resource[i];
+		struct uio_mem *uiomem = &udev->info.mem[i];
+
+		if (r->flags != (IORESOURCE_SIZEALIGN | IORESOURCE_MEM))
+			continue;
+
+		if (uiomem >= &udev->info.mem[MAX_UIO_MAPS]) {
+			dev_warn(&pdev->dev, "Do not support more than %d iomem\n",
+				 MAX_UIO_MAPS);
+			break;
+		}
+
+		uiomem->memtype = UIO_MEM_PHYS;
+		uiomem->addr = r->start & PAGE_MASK;
+		uiomem->offs = r->start & ~PAGE_MASK;
+		uiomem->size =
+			(uiomem->offs + resource_size(r) + PAGE_SIZE - 1) &
+			PAGE_MASK;
+		uiomem->name = r->name;
+	}
+
+	ret = devm_uio_register_device(&pdev->dev, &udev->info);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register uio device\n");
+		goto out_disable;
+	}
+
+	pci_set_drvdata(pdev, udev);
+
+	return 0;
+
+out_disable:
+	pci_disable_device(pdev);
+
+	return ret;
+}
+
+static void remove(struct pci_dev *pdev)
+{
+	struct uio_pci_sva_dev *udev = pci_get_drvdata(pdev);
+
+	pci_release_regions(pdev);
+	pci_disable_device(pdev);
+	kfree(udev);
+}
+
+static ssize_t pasid_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct uio_pci_sva_dev *udev = pci_get_drvdata(pdev);
+
+	return sysfs_emit(buf, "%d\n", udev->pasid);
+}
+static DEVICE_ATTR_RO(pasid);
+
+static struct attribute *uio_pci_sva_attrs[] = {
+	&dev_attr_pasid.attr,
+	NULL
+};
+
+static const struct attribute_group uio_pci_sva_attr_group = {
+	.attrs = uio_pci_sva_attrs,
+};
+
+static const struct attribute_group *uio_pci_sva_attr_groups[] = {
+	&uio_pci_sva_attr_group,
+	NULL
+};
+
+static struct pci_driver uio_pci_generic_sva_driver = {
+	.name = "uio_pci_generic_sva",
+	.dev_groups = uio_pci_sva_attr_groups,
+	.id_table = NULL,
+	.probe = probe,
+	.remove = remove,
+};
+
+module_pci_driver(uio_pci_generic_sva_driver);
+MODULE_VERSION("0.0.01");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Yaxing Guo <guoyaxing@bosc.ac.cn>");
+MODULE_DESCRIPTION("Generic UIO sva driver for PCI");
-- 
2.34.1

