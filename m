Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B13628EE
	for <oe-kbuild@lists.linux.dev>; Tue, 11 Apr 2023 14:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681223897; x=1712759897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htPGqO2d0setuRae069mslJnjAqQN8lnAxWxE8v+Obs=;
  b=PVH+WcqQfhQ12MTflDb8xgYntCG5SXtTPv20cA6tiVR6t3h7QyLLoAFz
   Sf1BMTTLqGKUCtgcOepjMlO8fMirxEs2RGIWbE03OBDkMNosxGlBYbetU
   43SkKwEPINXHCA1hhuoMjkBhhiowwfmqD16q6nScUo6ekacJ6H068q8v2
   O79O/b1WPVdBLFrpnk6FbU8OBScA7M+dUCUp4f2/bRLkrjSLsdqSA1dz+
   oPh0vjXGDYi3+fZS5EmtW1966k2SGxqrbOPEr0Et0uEMryHPj46fzK+wx
   VoAkBZT1yp0IkvD28FHnB/A7T/nWfiQhVi4N1KrbpmZXH5eCW9sXrUrvr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343636223"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343636223"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 07:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="666000212"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="666000212"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Apr 2023 07:38:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmF8P-000WOf-0t;
	Tue, 11 Apr 2023 14:38:13 +0000
Date: Tue, 11 Apr 2023 22:37:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:guest-filter-upstream 12/39] drivers/acpi/dalt.c:122
 parse_dalt_table() error: uninitialized symbol 'devid'.
Message-ID: <202304112205.SpBYYgia-lkp@intel.com>
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
head:   359e363de7b2f8863a0cbfb771cceaefb7a80873
commit: 7930762a9eb63a3bfb1fc6fdc1ab121e926d00d6 [12/39] ACPI: DALT: Add support to parse DALT ACPI table
:::::: branch date: 17 hours ago
:::::: commit date: 35 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230411/202304112205.SpBYYgia-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304112205.SpBYYgia-lkp@intel.com/

smatch warnings:
drivers/acpi/dalt.c:122 parse_dalt_table() error: uninitialized symbol 'devid'.

vim +/devid +122 drivers/acpi/dalt.c

7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   76  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   77  static int parse_dalt_table(struct acpi_table_dalt *dalt)
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   78  {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   79  	struct acpi_dalt_device *ddev = (struct acpi_dalt_device *)dalt->devices;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   80  	u32 max_size = dalt->header.length - sizeof(*dalt) - sizeof(*ddev);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   81  	struct pci_device_id *pci_id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   82  	unsigned int vendor, device;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   83  	int fields, ret = 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   84  	u32 curr_size = 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   85  	void *devid;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   86  	char *id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   87  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   88  	while (curr_size <= max_size ) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   89  		pr_debug("Device type:%d len:%d name:%s\n", ddev->type,
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   90  			 ddev->len, ddev->name);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   91  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   92  		id = NULL;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   93  		pci_id = NULL;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   94  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   95  		if (ddev->type == ACPI_DALT_PCI_DEV) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   96  			fields = sscanf(ddev->name, "%x:%x", &vendor, &device);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   97  			if (fields == 2) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   98  				pci_id = kzalloc(sizeof(*pci_id), GFP_KERNEL);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10   99  				if (!pci_id) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  100  					ret = -ENOMEM;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  101  					goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  102  				}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  103  				pci_id->vendor = vendor;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  104  				pci_id->device = device;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  105  				pci_id->subdevice = PCI_ANY_ID;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  106  				pci_id->subvendor = PCI_ANY_ID;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  107  				devid = pci_id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  108  			} else {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  109  				pr_warn("Invalid PCI device %s\n", ddev->name);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  110  			}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  111  		} else if ((ddev->type == ACPI_DALT_ACPI_DEV) ||
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  112  			   (ddev->type == ACPI_DALT_PLATFORM_DEV)) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  113  			id = (char *)kzalloc(ddev->len, GFP_KERNEL);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  114  			if (!id) {
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  115  				ret = -ENOMEM;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  116  				goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  117  			}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  118  			strcpy(id, ddev->name);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  119  			devid = id;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  120  		}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  121  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10 @122  		ret = add_da_bus_node(ddev->type, devid);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  123  		if (ret)
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  124  			goto parse_failed;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  125  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  126  		curr_size = curr_size + sizeof(*ddev) + ddev->len;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  127  		ddev = (struct acpi_dalt_device *)(dalt->devices + curr_size);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  128  	}
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  129  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  130  	return 0;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  131  
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  132  parse_failed:
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  133  	kfree(id);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  134  	kfree(pci_id);
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  135  	free_da_bus_list();
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  136  	return ret;
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  137  }
7930762a9eb63a Kuppuswamy Sathyanarayanan 2023-04-10  138  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
