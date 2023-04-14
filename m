Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027E7EE
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Apr 2023 06:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681454422; x=1712990422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ACzJsOf1NUo7/NTJ11al583jYV99+Vz8WR+GHHClnyg=;
  b=lQ4cdXAMiNSSZdJa7LSp5P4JmHDvKQCJlhrdIxorV/fCTUgOXPD8eKA1
   ZeXVfrL3/pCeG3wYaKt7yECaAkjJvtpa4GULSpU9bGtfp/fcejJZJwXKB
   KfJLL3TWNjDitO13tDqCqxjCdAha82XCoZNkzcP3JaC+9Je/Ju+Q0fluI
   gYBOzk6krZCMkQYa7sxjTMH0O2d3BnqV6/Jx5gSM4y8hxuvGY9M1zG6Sm
   oMMauxCCOXW2Zf+0OEXyisKV9xntb1SBC5Iy/rpFXocBe0gkjSGfPDpb1
   0881LAmXeo8LomMlOx37rT2jV5kFhlVeozRfvk7HLSdx3OT5VsAD16pNH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="343156326"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="343156326"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 23:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689679276"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689679276"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 23:40:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnD6Z-000ZJH-2G;
	Fri, 14 Apr 2023 06:40:19 +0000
Date: Fri, 14 Apr 2023 14:39:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [atishp04:cove_integeration_v2 75/136] drivers/base/da_firmware.c:67
 pci_parse_devices() warn: Please consider using kcalloc instead of
 kmalloc_array
Message-ID: <202304141419.mRARWHGd-lkp@intel.com>
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
CC: Atish Patra <Atish.Patra@wdc.com>
TO: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
CC: Rajnesh Kanwal <rkanwal@rivosinc.com>

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 896621978781d8378b4f51a9e33c33846439695d [75/136] driver core: Add support to parse device authorize firmware
:::::: branch date: 7 hours ago
:::::: commit date: 3 weeks ago
config: csky-randconfig-m031-20230411 (https://download.01.org/0day-ci/archive/20230414/202304141419.mRARWHGd-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304141419.mRARWHGd-lkp@intel.com/

smatch warnings:
drivers/base/da_firmware.c:67 pci_parse_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +67 drivers/base/da_firmware.c

896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  60  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  61  static size_t pci_parse_devices(struct da_bus_node *node, void *data)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  62  {
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  63  	struct da_pci_device_id *da_id = data;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  64  	struct pci_device_id *ids;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  65  	unsigned int i;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  66  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22 @67  	ids = kmalloc_array(node->count, sizeof(*ids), GFP_KERNEL | __GFP_ZERO);
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  68  	if (!ids)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  69  		return 0;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  70  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  71  	for (i = 0; i < node->count; i++)
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  72  		memcpy(&ids[i], &da_id[i], sizeof(*da_id));
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  73  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  74  	node->dev_ids = ids;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  75  
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  76  	return sizeof(*da_id) * node->count;
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  77  }
896621978781d8 Kuppuswamy Sathyanarayanan 2022-12-22  78  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
