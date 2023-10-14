Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502E442E
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Oct 2023 06:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpjyZjfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697263503; x=1728799503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n9atFlal8Z4c7ZU0hgiyhx4YetejKeEpkTOWR+tjeYg=;
  b=MpjyZjfcVtwowgKxS2vO28rRVcmbPmfMd/RD85bElYkmOzt1trBkkAMr
   hElC1lpkPcKtvpSTwDxCfMw1baIIelQsOPKN+zPg7QWr13w9ljS4IvbmJ
   UVLtiIwHswC+FZ+ik4/aXP/QArzFY9LUsWxUYIyrY/CPncCS9TspRrdhw
   Zo/RVCPughdBxOavRiOYcMKIbBKI4l12bQqnc5/VXW1k2CTC17rw7Bbfu
   hjCZfjOrtdczFFbI7i77i0DENwNYhlJVP20RWH7kLV8PPZHXqQRx6h1jI
   /hK6w/ESkToNQgb8gJ1b4sezAfg3A7SBmZC3EJp4Wbfh+AXP7yIcQOKXT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384176441"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384176441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 23:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="790104823"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="790104823"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Oct 2023 23:04:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXlf-0005kx-1D;
	Sat, 14 Oct 2023 06:04:55 +0000
Date: Sat, 14 Oct 2023 14:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/vme_user/vme_tsi148.c:748 tsi148_alloc_resource()
 warn: passing freed memory 'image->bus_resource.name'
Message-ID: <202310141358.KfQilTUL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cb1f10d8c4b716c88b87ae4402a3305d96e5db2
commit: 4ec4190be4cf9cc3e0ccaf5f155a5f9066d18950 kasan, x86: don't rename memintrinsics in uninstrumented files
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-161-20230928 (https://download.01.org/0day-ci/archive/20231014/202310141358.KfQilTUL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231014/202310141358.KfQilTUL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310141358.KfQilTUL-lkp@intel.com/

smatch warnings:
drivers/staging/vme_user/vme_tsi148.c:748 tsi148_alloc_resource() warn: passing freed memory 'image->bus_resource.name'

vim +748 drivers/staging/vme_user/vme_tsi148.c

d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  704  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  705  /*
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  706   * Allocate and map PCI Resource
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  707   */
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  708  static int tsi148_alloc_resource(struct vme_master_resource *image,
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  709  	unsigned long long size)
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  710  {
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  711  	unsigned long long existing_size;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  712  	int retval = 0;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  713  	struct pci_dev *pdev;
29848ac9f3b33b drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  714  	struct vme_bridge *tsi148_bridge;
29848ac9f3b33b drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  715  
29848ac9f3b33b drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  716  	tsi148_bridge = image->parent;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  717  
177581faf2a5aa drivers/vme/bridges/vme_tsi148.c         Aaron Sierra      2014-04-03  718  	pdev = to_pci_dev(tsi148_bridge->parent);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  719  
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  720  	existing_size = (unsigned long long)(image->bus_resource.end -
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  721  		image->bus_resource.start);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  722  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  723  	/* If the existing size is OK, return */
59c2290428dd93 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-10-29  724  	if ((size != 0) && (existing_size == (size - 1)))
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  725  		return 0;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  726  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  727  	if (existing_size != 0) {
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  728  		iounmap(image->kern_base);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  729  		image->kern_base = NULL;
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  730  		kfree(image->bus_resource.name);
886953e9b70bcb drivers/staging/vme/bridges/vme_tsi148.c Emilio G. Cota    2010-11-12  731  		release_resource(&image->bus_resource);
6d011dd876cb82 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    2017-08-25  732  		memset(&image->bus_resource, 0, sizeof(image->bus_resource));
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  733  	}
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  734  
59c2290428dd93 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-10-29  735  	/* Exit here if size is zero */
7946328faf1dca drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-03-22  736  	if (size == 0)
59c2290428dd93 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-10-29  737  		return 0;
59c2290428dd93 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-10-29  738  
a75dc630086a6b drivers/vme/bridges/vme_tsi148.c         Markus Elfring    2017-08-25  739  	if (!image->bus_resource.name) {
0aa3f139cd5123 drivers/staging/vme/bridges/vme_tsi148.c Julia Lawall      2010-05-30  740  		image->bus_resource.name = kmalloc(VMENAMSIZ+3, GFP_ATOMIC);
a75dc630086a6b drivers/vme/bridges/vme_tsi148.c         Markus Elfring    2017-08-25  741  		if (!image->bus_resource.name) {
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  742  			retval = -ENOMEM;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  743  			goto err_name;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  744  		}
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  745  	}
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  746  
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  747  	sprintf((char *)image->bus_resource.name, "%s.%d", tsi148_bridge->name,
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31 @748  		image->number);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  749  
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  750  	image->bus_resource.start = 0;
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  751  	image->bus_resource.end = (unsigned long)size;
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  752  	image->bus_resource.flags = IORESOURCE_MEM;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  753  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  754  	retval = pci_bus_alloc_resource(pdev->bus,
da5ae8a991d35d drivers/vme/bridges/vme_tsi148.c         Dmitry Kalinkin   2015-07-08  755  		&image->bus_resource, size, 0x10000, PCIBIOS_MIN_MEM,
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  756  		0, NULL, NULL);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  757  	if (retval) {
f13bd29c1ae1c2 drivers/staging/vme_user/vme_tsi148.c    Mingyi Kang       2022-07-30  758  		dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  759  			image->number, (unsigned long)size,
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  760  			(unsigned long)image->bus_resource.start);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  761  		goto err_resource;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  762  	}
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  763  
4bdc0d676a6431 drivers/vme/bridges/vme_tsi148.c         Christoph Hellwig 2020-01-06  764  	image->kern_base = ioremap(
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  765  		image->bus_resource.start, size);
a75dc630086a6b drivers/vme/bridges/vme_tsi148.c         Markus Elfring    2017-08-25  766  	if (!image->kern_base) {
48d9356e7750d3 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-03-22  767  		dev_err(tsi148_bridge->parent, "Failed to remap resource\n");
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  768  		retval = -ENOMEM;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  769  		goto err_remap;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  770  	}
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  771  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  772  	return 0;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  773  
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  774  err_remap:
886953e9b70bcb drivers/staging/vme/bridges/vme_tsi148.c Emilio G. Cota    2010-11-12  775  	release_resource(&image->bus_resource);
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  776  err_resource:
8fafb47638012d drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2010-02-18  777  	kfree(image->bus_resource.name);
6d011dd876cb82 drivers/vme/bridges/vme_tsi148.c         Markus Elfring    2017-08-25  778  	memset(&image->bus_resource, 0, sizeof(image->bus_resource));
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  779  err_name:
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  780  	return retval;
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  781  }
d22b8ed9a3b0a1 drivers/staging/vme/bridges/vme_tsi148.c Martyn Welch      2009-07-31  782  

:::::: The code at line 748 was first introduced by commit
:::::: d22b8ed9a3b0a157b732580258ec16b729265953 Staging: vme: add Tundra TSI148 VME-PCI Bridge driver

:::::: TO: Martyn Welch <martyn.welch@gefanuc.com>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
