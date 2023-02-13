Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F18256F
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 10:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676285477; x=1707821477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AQG2pAqiTRIeUogl+qXyUL8eOHBJ7i0s+3xyyFupFHY=;
  b=NIVvkCux/HlR2GC2eqaP0n0LgJOoL+Yu64TwkWCvoy+kb2MzE0s19LYK
   VOtTu3BP3x1druNQiwEMt+bU+N7tU39fEOJX4K7YTXjqgCqeQnzs5KbYo
   D9/vOJF3lDNnLifSZr5Wat4dknmYkgdaZyshkCCuNR/bgMTASZchEJv0I
   mhdZ6mclswFc5tpSVjnBONS5OYvdlclCG2OB0BAe5qXtP3Wd/Wub6EUxL
   pdw9omQhFbTnJj37oC2gGezyc5MSrWBmqskOb+0gM6MWBwJ34XmkmzDUq
   kQf7s+pycHlpi/CnOGrMBSd9HKIoUznpQeyL7wWd7CRc1pdOOu3C7agja
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="311225703"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="311225703"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:51:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="618603611"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="618603611"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 02:51:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRWQU-0007h6-1b;
	Mon, 13 Feb 2023 10:51:14 +0000
Date: Mon, 13 Feb 2023 18:50:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 4945/12440]
 drivers/firmware/arm_scmi/bus.c:128:18-22: ERROR: reference preceded by free
 on line 102
Message-ID: <202302131827.JrhSBb4s-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   09e41676e35ab06e4bce8870ea3bf1f191c3cb90
commit: d3cd7c525fd2ecce3a6c963f314969a54783d211 [4945/12440] firmware: arm_scmi: Refactor protocol device creation
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: ia64-randconfig-c042-20230212 (https://download.01.org/0day-ci/archive/20230213/202302131827.JrhSBb4s-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202302131827.JrhSBb4s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/bus.c:128:18-22: ERROR: reference preceded by free on line 102
   drivers/firmware/arm_scmi/bus.c:128:18-22: ERROR: reference preceded by free on line 113

vim +128 drivers/firmware/arm_scmi/bus.c

d3cd7c525fd2ec Cristian Marussi 2022-12-22   32  
d3cd7c525fd2ec Cristian Marussi 2022-12-22   33  /**
d3cd7c525fd2ec Cristian Marussi 2022-12-22   34   * scmi_protocol_device_request  - Helper to request a device
d3cd7c525fd2ec Cristian Marussi 2022-12-22   35   *
d3cd7c525fd2ec Cristian Marussi 2022-12-22   36   * @id_table: A protocol/name pair descriptor for the device to be created.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   37   *
d3cd7c525fd2ec Cristian Marussi 2022-12-22   38   * This helper let an SCMI driver request specific devices identified by the
d3cd7c525fd2ec Cristian Marussi 2022-12-22   39   * @id_table to be created for each active SCMI instance.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   40   *
d3cd7c525fd2ec Cristian Marussi 2022-12-22   41   * The requested device name MUST NOT be already existent for any protocol;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   42   * at first the freshly requested @id_table is annotated in the IDR table
d3cd7c525fd2ec Cristian Marussi 2022-12-22   43   * @scmi_requested_devices and then the requested device is advertised to any
d3cd7c525fd2ec Cristian Marussi 2022-12-22   44   * registered party via the @scmi_requested_devices_nh notification chain.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   45   *
d3cd7c525fd2ec Cristian Marussi 2022-12-22   46   * Return: 0 on Success
d3cd7c525fd2ec Cristian Marussi 2022-12-22   47   */
d3cd7c525fd2ec Cristian Marussi 2022-12-22   48  static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
d3cd7c525fd2ec Cristian Marussi 2022-12-22   49  {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   50  	int ret = 0;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   51  	unsigned int id = 0;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   52  	struct list_head *head, *phead = NULL;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   53  	struct scmi_requested_dev *rdev;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   54  
d3cd7c525fd2ec Cristian Marussi 2022-12-22   55  	pr_debug("Requesting SCMI device (%s) for protocol %x\n",
d3cd7c525fd2ec Cristian Marussi 2022-12-22   56  		 id_table->name, id_table->protocol_id);
d3cd7c525fd2ec Cristian Marussi 2022-12-22   57  
d3cd7c525fd2ec Cristian Marussi 2022-12-22   58  	/*
d3cd7c525fd2ec Cristian Marussi 2022-12-22   59  	 * Search for the matching protocol rdev list and then search
d3cd7c525fd2ec Cristian Marussi 2022-12-22   60  	 * of any existent equally named device...fails if any duplicate found.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   61  	 */
d3cd7c525fd2ec Cristian Marussi 2022-12-22   62  	mutex_lock(&scmi_requested_devices_mtx);
d3cd7c525fd2ec Cristian Marussi 2022-12-22   63  	idr_for_each_entry(&scmi_requested_devices, head, id) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   64  		if (!phead) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   65  			/* A list found registered in the IDR is never empty */
d3cd7c525fd2ec Cristian Marussi 2022-12-22   66  			rdev = list_first_entry(head, struct scmi_requested_dev,
d3cd7c525fd2ec Cristian Marussi 2022-12-22   67  						node);
d3cd7c525fd2ec Cristian Marussi 2022-12-22   68  			if (rdev->id_table->protocol_id ==
d3cd7c525fd2ec Cristian Marussi 2022-12-22   69  			    id_table->protocol_id)
d3cd7c525fd2ec Cristian Marussi 2022-12-22   70  				phead = head;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   71  		}
d3cd7c525fd2ec Cristian Marussi 2022-12-22   72  		list_for_each_entry(rdev, head, node) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   73  			if (!strcmp(rdev->id_table->name, id_table->name)) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   74  				pr_err("Ignoring duplicate request [%d] %s\n",
d3cd7c525fd2ec Cristian Marussi 2022-12-22   75  				       rdev->id_table->protocol_id,
d3cd7c525fd2ec Cristian Marussi 2022-12-22   76  				       rdev->id_table->name);
d3cd7c525fd2ec Cristian Marussi 2022-12-22   77  				ret = -EINVAL;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   78  				goto out;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   79  			}
d3cd7c525fd2ec Cristian Marussi 2022-12-22   80  		}
d3cd7c525fd2ec Cristian Marussi 2022-12-22   81  	}
d3cd7c525fd2ec Cristian Marussi 2022-12-22   82  
d3cd7c525fd2ec Cristian Marussi 2022-12-22   83  	/*
d3cd7c525fd2ec Cristian Marussi 2022-12-22   84  	 * No duplicate found for requested id_table, so let's create a new
d3cd7c525fd2ec Cristian Marussi 2022-12-22   85  	 * requested device entry for this new valid request.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   86  	 */
d3cd7c525fd2ec Cristian Marussi 2022-12-22   87  	rdev = kzalloc(sizeof(*rdev), GFP_KERNEL);
d3cd7c525fd2ec Cristian Marussi 2022-12-22   88  	if (!rdev) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22   89  		ret = -ENOMEM;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   90  		goto out;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   91  	}
d3cd7c525fd2ec Cristian Marussi 2022-12-22   92  	rdev->id_table = id_table;
d3cd7c525fd2ec Cristian Marussi 2022-12-22   93  
d3cd7c525fd2ec Cristian Marussi 2022-12-22   94  	/*
d3cd7c525fd2ec Cristian Marussi 2022-12-22   95  	 * Append the new requested device table descriptor to the head of the
d3cd7c525fd2ec Cristian Marussi 2022-12-22   96  	 * related protocol list, eventually creating such head if not already
d3cd7c525fd2ec Cristian Marussi 2022-12-22   97  	 * there.
d3cd7c525fd2ec Cristian Marussi 2022-12-22   98  	 */
d3cd7c525fd2ec Cristian Marussi 2022-12-22   99  	if (!phead) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22  100  		phead = kzalloc(sizeof(*phead), GFP_KERNEL);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  101  		if (!phead) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22 @102  			kfree(rdev);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  103  			ret = -ENOMEM;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  104  			goto out;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  105  		}
d3cd7c525fd2ec Cristian Marussi 2022-12-22  106  		INIT_LIST_HEAD(phead);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  107  
d3cd7c525fd2ec Cristian Marussi 2022-12-22  108  		ret = idr_alloc(&scmi_requested_devices, (void *)phead,
d3cd7c525fd2ec Cristian Marussi 2022-12-22  109  				id_table->protocol_id,
d3cd7c525fd2ec Cristian Marussi 2022-12-22  110  				id_table->protocol_id + 1, GFP_KERNEL);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  111  		if (ret != id_table->protocol_id) {
d3cd7c525fd2ec Cristian Marussi 2022-12-22  112  			pr_err("Failed to save SCMI device - ret:%d\n", ret);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  113  			kfree(rdev);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  114  			kfree(phead);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  115  			ret = -EINVAL;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  116  			goto out;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  117  		}
d3cd7c525fd2ec Cristian Marussi 2022-12-22  118  		ret = 0;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  119  	}
d3cd7c525fd2ec Cristian Marussi 2022-12-22  120  	list_add(&rdev->node, phead);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  121  
d3cd7c525fd2ec Cristian Marussi 2022-12-22  122  out:
d3cd7c525fd2ec Cristian Marussi 2022-12-22  123  	mutex_unlock(&scmi_requested_devices_mtx);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  124  
d3cd7c525fd2ec Cristian Marussi 2022-12-22  125  	if (!ret)
d3cd7c525fd2ec Cristian Marussi 2022-12-22  126  		blocking_notifier_call_chain(&scmi_requested_devices_nh,
d3cd7c525fd2ec Cristian Marussi 2022-12-22  127  					     SCMI_BUS_NOTIFY_DEVICE_REQUEST,
d3cd7c525fd2ec Cristian Marussi 2022-12-22 @128  					     (void *)rdev->id_table);
d3cd7c525fd2ec Cristian Marussi 2022-12-22  129  
d3cd7c525fd2ec Cristian Marussi 2022-12-22  130  	return ret;
d3cd7c525fd2ec Cristian Marussi 2022-12-22  131  }
d3cd7c525fd2ec Cristian Marussi 2022-12-22  132  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
