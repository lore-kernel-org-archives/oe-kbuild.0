Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6487B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 01:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676509994; x=1708045994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iu/mG16vicl1oiTnEwDtjx2O3AuY2vGDtfD3hcMh03c=;
  b=NHkH5uUwwsFgrP8iWRNGaC0JsMuXB8s4if5Xo9vb04xG7A4GzyntI9JV
   wUVf925FuK8dxNWEnQApxIb1fngInyyDiSeLp1Bmt7BMpH7akYaLvRumk
   pmqxdMz7DTHNnYuj6TJzLxFFyvQEXF8IC1FpY1Mm1kAZJOxINDJRZ8xxu
   oDjhD1dhBNVObvc9VBJr3LSHBpAvJImuYheqLAfPUfDvcIg3jKyph0+Bl
   CZIjWs4Z4saot79P+oKCgZRh+Kyj1rDwjUaZt+fRZl1cX3wKjlb1zIG2r
   GJ0R6VDw44vkhn8kPs6RkHwu5hqClBjYXf3/VQgu0gu6F6bGVy0fyFPM5
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396228148"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="396228148"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 17:13:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="619828338"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="619828338"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 17:13:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSSpj-0009vN-2S;
	Thu, 16 Feb 2023 01:13:11 +0000
Date: Thu, 16 Feb 2023 09:12:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 4344/13038] drivers/hid/hid-sony.c:1726:41:
 warning: Uninitialized variables: entry.lock, entry.list_node, entry.hdev,
 entry.touchpad, entry.sensor_dev, entry.quirks, entry.state_worker,
 entry.send_output_report, entry.battery, entry.battery_desc,
 entry.device_id, en...
Message-ID: <202302160922.nitD5BDe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/hid-sony.c:1726:41: warning: Uninitialized variables: entry.lock, entry.list_node, entry.hdev, entry.touchpad, entry.sensor_dev, entry.quirks, entry.state_worker, entry.send_output_report, entry.battery, entry.battery_desc, entry.device_id, entry.output_report_dmabuf, entry.state_worker_initialized, entry.defer_initialization, entry.battery_capacity, entry.battery_status, entry.led_count, entry.ghl_urb, entry.ghl_poke_timer [uninitvar]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Roderick Colenbrander <roderick@gaikai.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9019bcea1aac7eed64a1a4966282b6b7b141c8
commit: 4f1f391869eecb11d57e9e07ddec143ff3dc08ee [4344/13038] HID: sony: remove DualShock4 support.
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 4f1f391869eecb11d57e9e07ddec143ff3dc08ee
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302160922.nitD5BDe-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/hid/hid-sony.c:1726:41: warning: Uninitialized variables: entry.lock, entry.list_node, entry.hdev, entry.touchpad, entry.sensor_dev, entry.quirks, entry.state_worker, entry.send_output_report, entry.battery, entry.battery_desc, entry.device_id, entry.output_report_dmabuf, entry.state_worker_initialized, entry.defer_initialization, entry.battery_capacity, entry.battery_status, entry.led_count, entry.ghl_urb, entry.ghl_poke_timer [uninitvar]
      if (sony_compare_connection_type(sc, entry)) {
                                           ^
   drivers/hid/hid-sony.c:1726:41: warning: Uninitialized variables: entry.lock, entry.list_node, entry.hdev, entry.touchpad, entry.sensor_dev, entry.quirks, entry.state_worker, entry.send_output_report, entry.battery, entry.battery_desc, entry.device_id, entry.output_report_dmabuf, entry.left, entry.right, entry.state_worker_initialized, entry.defer_initialization, entry.battery_capacity, entry.battery_status, entry.led_count, entry.ghl_urb, entry.ghl_poke_timer [uninitvar]
      if (sony_compare_connection_type(sc, entry)) {
                                           ^

vim +1726 drivers/hid/hid-sony.c

0f3982308b5fc7 Frank Praznik 2016-09-22  1713  
d2d782fccee4f6 Frank Praznik 2014-02-20  1714  static int sony_check_add_dev_list(struct sony_sc *sc)
d2d782fccee4f6 Frank Praznik 2014-02-20  1715  {
d2d782fccee4f6 Frank Praznik 2014-02-20  1716  	struct sony_sc *entry;
d2d782fccee4f6 Frank Praznik 2014-02-20  1717  	unsigned long flags;
d2d782fccee4f6 Frank Praznik 2014-02-20  1718  	int ret;
d2d782fccee4f6 Frank Praznik 2014-02-20  1719  
d2d782fccee4f6 Frank Praznik 2014-02-20  1720  	spin_lock_irqsave(&sony_dev_list_lock, flags);
c4e1ddf2680b35 Frank Praznik 2014-01-17  1721  
d2d782fccee4f6 Frank Praznik 2014-02-20  1722  	list_for_each_entry(entry, &sony_device_list, list_node) {
d2d782fccee4f6 Frank Praznik 2014-02-20  1723  		ret = memcmp(sc->mac_address, entry->mac_address,
d2d782fccee4f6 Frank Praznik 2014-02-20  1724  				sizeof(sc->mac_address));
d2d782fccee4f6 Frank Praznik 2014-02-20  1725  		if (!ret) {
0f3982308b5fc7 Frank Praznik 2016-09-22 @1726  			if (sony_compare_connection_type(sc, entry)) {
0f3982308b5fc7 Frank Praznik 2016-09-22  1727  				ret = 1;
0f3982308b5fc7 Frank Praznik 2016-09-22  1728  			} else {
d2d782fccee4f6 Frank Praznik 2014-02-20  1729  				ret = -EEXIST;
0f3982308b5fc7 Frank Praznik 2016-09-22  1730  				hid_info(sc->hdev,
0f3982308b5fc7 Frank Praznik 2016-09-22  1731  				"controller with MAC address %pMR already connected\n",
d2d782fccee4f6 Frank Praznik 2014-02-20  1732  				sc->mac_address);
0f3982308b5fc7 Frank Praznik 2016-09-22  1733  			}
d2d782fccee4f6 Frank Praznik 2014-02-20  1734  			goto unlock;
d2d782fccee4f6 Frank Praznik 2014-02-20  1735  		}
d2d782fccee4f6 Frank Praznik 2014-02-20  1736  	}
d2d782fccee4f6 Frank Praznik 2014-02-20  1737  
d2d782fccee4f6 Frank Praznik 2014-02-20  1738  	ret = 0;
d2d782fccee4f6 Frank Praznik 2014-02-20  1739  	list_add(&(sc->list_node), &sony_device_list);
d2d782fccee4f6 Frank Praznik 2014-02-20  1740  
d2d782fccee4f6 Frank Praznik 2014-02-20  1741  unlock:
d2d782fccee4f6 Frank Praznik 2014-02-20  1742  	spin_unlock_irqrestore(&sony_dev_list_lock, flags);
d2d782fccee4f6 Frank Praznik 2014-02-20  1743  	return ret;
c4e1ddf2680b35 Frank Praznik 2014-01-17  1744  }
c4e1ddf2680b35 Frank Praznik 2014-01-17  1745  

:::::: The code at line 1726 was first introduced by commit
:::::: 0f3982308b5fc7373c8d4e6dcfc8a02ee5a3408d HID: sony: Relax duplicate checking for USB-only devices

:::::: TO: Frank Praznik <frank.praznik@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
