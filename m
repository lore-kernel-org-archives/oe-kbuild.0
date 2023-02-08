Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C4D361
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675816062; x=1707352062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YNXGs76l3naC3PI+iB6VFSYtIEUKiHh04Z7nHFDdEss=;
  b=LTXBOBopq7Tlbd1KrctRxPLNcQ6N3m3gTzmkJ9OvCnPrUMLi/+TV9FKJ
   goy6Q18MQWCBIeNFdUq7YJGbROULVXsMispc6TZBDusuQMK5/cUQQOFdl
   rtxIiEC11gqx7j41DpwKkUIBV0nA+HVL+GOHbQ9MIlbOcFlySOtIMcY0y
   IPCKQDq4f0hMECnWPPcyHsBGOXyer5OIyJm3C9hgfdGffHF8A/XnKWwbJ
   EHW74Kf6dJ6q3AOxQfL2xq83tyclifKWkAXJbKG6weEgvlWHm33PdDStn
   e3DHuJ6OyKi5y889FOu41nxGlmqzFVCpyAwo3DG0wMZM2hHUEiSBRuxU8
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="327358939"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="327358939"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 16:27:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809742155"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809742155"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 16:27:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPYJI-000402-0s;
	Wed, 08 Feb 2023 00:27:40 +0000
Date: Wed, 8 Feb 2023 08:27:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:guest-filter-upstream 5/31]
 drivers/base/da_firmware.c:153 parse_firmware_devices() warn: Please
 consider using kcalloc instead of kmalloc_array
Message-ID: <202302080846.SXvGsX7h-lkp@intel.com>
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
commit: 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92 [5/31] driver core: Add support to parse device authorize firmware
:::::: branch date: 25 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230208/202302080846.SXvGsX7h-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/base/da_firmware.c:153 parse_firmware_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +153 drivers/base/da_firmware.c

304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  144  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  145  size_t parse_firmware_devices(struct da_bus_node *node, void *data)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  146  {
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  147  	struct da_pci_device_id *da_id = data;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  148  	struct pci_device_id *pci_ids;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  149  	struct da_bus_device_id *ids;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  150  	unsigned int i;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  151  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  152  	if (!strncmp(node->name, "pci", 3)) {
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22 @153  		pci_ids = kmalloc_array(node->count, sizeof(*pci_ids), GFP_KERNEL | __GFP_ZERO);
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  154  		if (!pci_ids)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  155  			return 0;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  156  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  157  		for (i = 0; i < node->count; i++)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  158  			memcpy(&pci_ids[i], &da_id[i], sizeof(*da_id));
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  159  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  160  		node->dev_ids = pci_ids;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  161  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  162  		return sizeof(*da_id) * node->count;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  163  	}
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  164  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  165  	ids = kmalloc_array(node->count, sizeof(*ids), GFP_KERNEL);
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  166  	if (!ids)
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  167  		return 0;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  168  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  169  	memcpy(ids, data, sizeof(*ids) * node->count);
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  170  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  171  	node->dev_ids = ids;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  172  
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  173  	return sizeof(*ids) * node->count;
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  174  }
304ef1a77b5f51 Kuppuswamy Sathyanarayanan 2022-12-22  175  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
