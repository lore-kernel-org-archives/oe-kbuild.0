Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41721373
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KD2nO1nZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701436199; x=1732972199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w+HnJzs5aDMv3D41kEjYIqtSytReNzKzAKnpR4ntEKE=;
  b=KD2nO1nZCNFV0Z7aRWYWUvlAlhE3Qne5cM9jx+/qrPKLcUuLBvTQCnLC
   z5teNOY+RKvZ3KAq0szoxNGxl9Lw0Iv5PusWUBu0rcVLbLu6tfs2vdb8E
   XKT7HKoVi8jbtmU3vFs4wgKwVfF9E84lBlJSX9rKxAE9ZMqs1eXcpZqfE
   pafAm35auvffxyKDC+UwvdZY/Iay7SWC4QIJ7NWkkHQ9OZJF9KRqSGp9T
   abf1ZjedlZEiGp6Jch95+ZEnNoEc5PnITNemdik6z+iTIFVmapj5LhuKm
   iMTj6YIMZUuUE2bCfWuBQlHG+tZTFnio9ci0zRHt2zO9noClcF/edjL21
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="506547"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="506547"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 05:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="887653862"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; 
   d="scan'208";a="887653862"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2023 05:09:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r93Gk-0003i4-0N;
	Fri, 01 Dec 2023 13:09:22 +0000
Date: Fri, 1 Dec 2023 21:08:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more
 than once.
Message-ID: <202312012151.Dq5V6dqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git v6.7/ffa_integ_test
head:   0dfce5abe57576c4804fc626172b0cd80a320c1c
commit: 0dfce5abe57576c4804fc626172b0cd80a320c1c [5/5] firmware: arm_ffa: Add test driver
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231201/202312012151.Dq5V6dqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312012151.Dq5V6dqG-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_ffa/test_driver.c: linux/arm_ffa.h is included more than once.
>> drivers/firmware/arm_ffa/test_driver.c: linux/module.h is included more than once.

vim +6 drivers/firmware/arm_ffa/test_driver.c

   > 6	#include <linux/arm_ffa.h>
     7	#include <linux/module.h>
     8	
     9	#define PRIMARY_UUID \
    10		UUID_INIT(0xb4b5671e, 0x4a90, 0x4fe1, 0xb8, 0x1f, 0xfb, 0x13, 0xda, 0xe1, 0xda, 0xcb)
    11	#define SECONDARY_UUID \
    12		UUID_INIT(0xd1582309, 0xf023, 0x47b9, 0x82, 0x7c, 0x44, 0x64, 0xf5, 0x57, 0x8f, 0xc8)
    13	#define TERTIARY_UUID \
    14		UUID_INIT(0x79b55c73, 0x1d8c, 0x44b9, 0x85, 0x93, 0x61, 0xe1, 0x77, 0x0a, 0xd8, 0xd2)
    15	#define IVY_UUID \
    16		UUID_INIT(0xeaba83d8, 0xbaaf, 0x4eaf, 0x81, 0x44, 0xf7, 0xfd, 0xcb, 0xe5, 0x44, 0xa7)
    17	#define TEST_UUID(x) \
    18		UUID_INIT(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00, (x), 0x00, 0x00, 0x00)
    19	
    20	
    21	#define SECURE_WORLD_PARTITION_MASK 0x8000
    22	#define CACTUS_ECHO_CMD 0x6563686fUL
    23	#define ECHO_VAL1 0xa0a0a0a0UL
    24	#define ECHO_VAL2 0xb0b0b0b0UL
    25	#define ECHO_VAL3 0xc0c0c0c0UL
    26	
    27	
    28	void test_ffa_notif_cb(int notification_id, void *data)
    29	{
    30		pr_info("%x %p\n", notification_id, data);
    31	}
    32	
    33	static int ffa_test_driver_probe(struct ffa_device *ffa_dev)
    34	{
    35		int ret;
    36		struct ffa_send_direct_data data;
    37	
    38	        pr_info("FF-A test module probed for part ID 0x%x\n", ffa_dev->vm_id);
    39	
    40		data.data0 = CACTUS_ECHO_CMD;
    41		data.data1 = ECHO_VAL1;
    42		data.data2 = ffa_dev->vm_id;
    43		data.data3 = 0;
    44		data.data4 = 0;
    45	
    46		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    47		pr_info("Ret %d\n", ret);
    48	
    49		data.data0 = CACTUS_ECHO_CMD;
    50		data.data1 = ECHO_VAL2;
    51		data.data2 = ffa_dev->vm_id;
    52		data.data3 = 0;
    53		data.data4 = 0;
    54	
    55		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    56		pr_info("Ret %d\n", ret);
    57	
    58		data.data0 = CACTUS_ECHO_CMD;
    59		data.data1 = ECHO_VAL3;
    60		data.data2 = ffa_dev->vm_id;
    61		data.data3 = 0;
    62		data.data4 = 0;
    63	
    64		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    65		pr_info("Ret %d\n", ret);
    66	
    67		data.data0 = 0;
    68		data.data1 = 0;
    69		data.data2 = 0;
    70		data.data3 = 0;
    71		data.data4 = 0;
    72	
    73		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    74		pr_info("Ret %d\n", ret);
    75	
    76		data.data0 = 0;
    77		data.data1 = 1;
    78		data.data2 = 0;
    79		data.data3 = 0;
    80		data.data4 = 0;
    81	
    82		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    83		pr_info("Ret %d\n", ret);
    84	
    85		data.data0 = 0x736c656571;
    86		data.data1 = 0xc8;
    87		data.data2 = 0x8002;
    88		data.data3 = 0x1;
    89		data.data4 = 0;
    90	
    91		ret = ffa_dev->ops->msg_ops->sync_send_receive(ffa_dev, &data);
    92		pr_info("Ret %d\n", ret);
    93	
    94		ret = ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    95					&test_ffa_notif_cb, &data, BIT(0));
    96		pr_info("Ret %d\n", ret);
    97	
    98		ret = ffa_dev->ops->notifier_ops->notify_request(ffa_dev, 0,
    99					&test_ffa_notif_cb, &data, BIT(1));
   100		pr_info("Ret %d\n", ret);
   101	
   102		return 0;
   103	}
   104	
   105	static const struct ffa_device_id test_ffa_device_id[] = {
   106		{ PRIMARY_UUID },
   107	//	{ SECONDARY_UUID },
   108	//	{ TERTIARY_UUID },
   109	//	{ IVY_UUID },
   110		{ TEST_UUID(0x3) },
   111		{ TEST_UUID(0x4) },
   112		{ TEST_UUID(0x5) },
   113		{ TEST_UUID(0x6) },
   114		{ TEST_UUID(0x7) },
   115		{ TEST_UUID(0x8) },
   116		{ TEST_UUID(0x9) },
   117		{ TEST_UUID(0x11) },
   118		{ TEST_UUID(0x12) },
   119	        { }
   120	};
   121	
   122	static struct ffa_driver test_ffa_driver = {
   123	        .name = "test_ffa",
   124	        .probe = ffa_test_driver_probe,
   125	        .id_table = test_ffa_device_id,
   126	};
   127	
   128	module_ffa_driver(test_ffa_driver);
   129	
   130	MODULE_AUTHOR("Arm");
   131	MODULE_DESCRIPTION("PSA-FF-A test module");
   132	MODULE_LICENSE("GPL v2");
   133	
   134	#if 0
 > 135	#include <linux/arm_ffa.h>
   136	#include <linux/device.h>
   137	#include <linux/kdev_t.h>
   138	#include <linux/of_address.h>
   139	#include <linux/of_platform.h>
   140	#include <linux/mm.h>
   141	#include <linux/module.h>
   142	#include <linux/mutex.h>
   143	#include <linux/scatterlist.h>
   144	#include <linux/slab.h>
   145	#include <linux/smp.h>
   146	#include <linux/uaccess.h>
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
