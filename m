Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD87F
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 02:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675823462; x=1707359462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kRxok6l7hKFf/GO5bpyiv/2j37pgOB6hC7sW8noUGDo=;
  b=d8h1+Q38xlZPymkfq5cQBfS7a36Cf7wn3AqluNlBkiHuH9JsRXhO4jr0
   Vfi4OwEluLmUcek60mMZSNrudRpSbYCm5DeMygdGrfurDT+5SD9bd/Dib
   wphQXVzaZpl2fd9bdg8cH/HZJ+OEzp9ZbM1olq9h4wFCaGkhog3+v2JmE
   TGtIBwRnRH0gRHsd8vxVaNT6uPBviUbuAZal1pMN7s2h3woUKmJD/NeaY
   8wZaK1d9FnN3fDo1KN5js1kmvVPfnPFjXL+kE5yFR00QC/Wx/7EiNzMVM
   gyyTjRCsHfiXGqvbFkMxWU5QOIBrAMza2qdM4Q6M8YDIE/hB0x0DsG522
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="330980933"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="330980933"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 18:30:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="697496939"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="697496939"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2023 18:30:45 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPaEO-000458-35;
	Wed, 08 Feb 2023 02:30:44 +0000
Date: Wed, 8 Feb 2023 10:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:guest-filter-upstream 7/31]
 drivers/base/da_firmware.c:295 parse_pci_id() warn: Please consider using
 kcalloc instead of kmalloc_array
Message-ID: <202302081042.yC1t5hbQ-lkp@intel.com>
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
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   fd61f2d2a82f5c0c284fa3f074bae5016c39e7bc
commit: 2918c8a83642b317e92706dcb7ee6ee4443f3266 [7/31] driver core: Add command line option to update device authorization list
:::::: branch date: 27 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230208/202302081042.yC1t5hbQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

New smatch warnings:
drivers/base/da_firmware.c:295 parse_pci_id() warn: Please consider using kcalloc instead of kmalloc_array

Old smatch warnings:
drivers/base/da_firmware.c:174 parse_firmware_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +295 drivers/base/da_firmware.c

304ef1a77b5f517 Kuppuswamy Sathyanarayanan 2022-12-22  286  
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  287  static int parse_pci_id(struct da_bus_node *bnode, char *ids, int count)
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  288  {
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  289  	unsigned int subdevice = PCI_ANY_ID, class = 0, class_mask = 0;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  290  	unsigned int vendor, device, subvendor = PCI_ANY_ID;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  291  	struct pci_device_id *pci_ids;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  292  	int fields, i = 0;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  293  	char *id;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  294  
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22 @295  	pci_ids = kmalloc_array(count, sizeof(*pci_ids), GFP_KERNEL | __GFP_ZERO);
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  296  	if (!pci_ids)
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  297  		return -ENOMEM;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  298  
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  299  	while ((id = strsep(&ids, ",")) != NULL) {
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  300  		if (!strlen(id))
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  301  			continue;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  302  		fields = sscanf(id, "%x:%x:%x:%x:%x:%x", &vendor, &device, &subvendor,
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  303  				&subdevice, &class, &class_mask);
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  304  		if (fields < 2)
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  305  			continue;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  306  		pci_ids[i].vendor = vendor;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  307  		pci_ids[i].device = device;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  308  		pci_ids[i].subvendor = subvendor;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  309  		pci_ids[i].subdevice = subdevice;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  310  		i++;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  311  	}
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  312  
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  313  	if (i > 0) {
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  314  		bnode->dev_ids = pci_ids;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  315  		bnode->count = i;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  316  	}
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  317  
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  318  	return 0;
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  319  }
2918c8a83642b31 Kuppuswamy Sathyanarayanan 2023-01-22  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
