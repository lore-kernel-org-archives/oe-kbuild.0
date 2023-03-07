Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F92710790
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Mar 2023 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678223061; x=1709759061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jw3PVTjmnpOf9HBu5QOPKvxI73aYD9udbGgK5mXTL5U=;
  b=bACctTViYFrL3msJ3St3q3/B0DJYjkpowc+rSxDxCwThUctl9K0eMjIZ
   U3XbqnXGNOJRJv3Dxh8Snrz9q8aLsbSoszbTu/Cq9rV6J3YQhatdYE8JB
   21JDlAHptSkr3s8d4FOTvLXynWc9LqwoaGypFQ5Y16elHd9ISxpFzgp2b
   L9WQsQBlHB5+8neDTH1/lF5AmxgRf9YWXM6KdiMfgOftaRywRUE/SQm3S
   Wssyc/TidEUCt1oRuHB870lS7loHNAZ0LNfhfBHFXIXzYAtQF1JTHzC+v
   z3HaBnIkuAMgn7ZK4a74Dm5NHfy2eWK7PkyKw9vuWFRziKpBkBCIgMmwP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337492908"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="337492908"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:04:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676706970"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="676706970"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 13:04:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZeTq-0001bh-39;
	Tue, 07 Mar 2023 21:04:18 +0000
Date: Wed, 8 Mar 2023 05:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-tdx:guest-filter-upstream 5/31]
 drivers/base/da_firmware.c:189 parse_firmware_data() warn: variable
 dereferenced before check 'bnode' (see line 187)
Message-ID: <202303080452.BPTZeOyI-lkp@intel.com>
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
head:   6bcd8bef8871c6a80cb55b1cbb2651111da10890
commit: d0c26c6546ae5c1271597dc8fa1633456881afab [5/31] driver core: Add support to parse device authorize firmware
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: loongarch-randconfig-m041-20230305 (https://download.01.org/0day-ci/archive/20230308/202303080452.BPTZeOyI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303080452.BPTZeOyI-lkp@intel.com/

New smatch warnings:
drivers/base/da_firmware.c:189 parse_firmware_data() warn: variable dereferenced before check 'bnode' (see line 187)

Old smatch warnings:
drivers/base/da_firmware.c:146 parse_firmware_devices() warn: Please consider using kcalloc instead of kmalloc_array

vim +/bnode +189 drivers/base/da_firmware.c

d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  168  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  169  static int __init parse_firmware_data(struct cpio_data *cpio)
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  170  {
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  171  	struct da_firmware_hdr *fhdr = cpio->data;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  172  	void *cur = cpio->data, *end;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  173  	struct da_bus_node *bnode;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  174  	struct da_bus_hdr *bhdr;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  175  	size_t size;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  176  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  177  	pr_debug("firmware version: %d.%d type: %d count: %d\n",
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  178  		 fhdr->major_ver, fhdr->minor_ver, fhdr->type, fhdr->count);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  179  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  180  	cur = cur + sizeof(*fhdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  181  	end = cur + cpio->size - sizeof(struct da_bus_hdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  182  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  183  	while (cur <= end) {
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  184  		bhdr = (struct da_bus_hdr *)cur;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  185  		bnode = alloc_bus_node(bhdr->bus, bhdr->count);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  186  		list_add_tail(&bnode->list, &platform_da_list);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22 @187  		pr_debug("parsing %s node count:%d\n", bnode->name, bnode->count);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  188  		cur =  cur + sizeof(*bhdr);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22 @189  		if (!bnode)
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  190  			goto out;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  191  		size = parse_firmware_devices(bnode, cur);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  192  		cur = cur + size;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  193  	}
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  194  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  195  	return 0;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  196  
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  197  out:
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  198  	free_da_list(&platform_da_list);
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  199  	return -EINVAL;
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  200  }
d0c26c6546ae5c Kuppuswamy Sathyanarayanan 2022-12-22  201  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
