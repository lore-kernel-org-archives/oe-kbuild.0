Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A115B4
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Sep 2023 03:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694230964; x=1725766964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=490lAjaCJ+Q/f6cWRCumZjDROHf4uO6Dzm82tpcMZwM=;
  b=KHw1+ur3pN4CTqLi3WWzYKAfQSFjSGjzEM7pQjgDOz2P56A3ai0fx2zs
   kUidLdAaq56+n+TxWxpHOpu8X2agH+QshjoocJZ9QCuq3X38/vTh1K6BS
   dSrzNMnLKgiJq4KCkPypGHB6YXXQmvOKESgGpevQFjgNzIjQZyP/fUGPn
   7gP3d4hyKf6+xOWdJOeHugzBdlyHQzHMjhVHhzpIvGhkZd8nFTgo5Q9NI
   /RD75IqRL98tEeEEAIvoJxm4UccTFiNxpDXlGWFgOFxLA+xEwVjK2ukuE
   GeEHE2QxdhPcRp7AgSC4STmxY62stTjt0QAVthJJ/BztGOTIQDDsRZSeM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="380518224"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="380518224"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 20:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="808226245"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="808226245"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 08 Sep 2023 20:42:42 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeoro-0002tL-24;
	Sat, 09 Sep 2023 03:42:40 +0000
Date: Sat, 9 Sep 2023 11:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/bluetooth/msft.c:563 msft_add_monitor_sync() warn: passing zero
 to 'PTR_ERR'
Message-ID: <202309091157.V0PEAQVg-lkp@intel.com>
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
TO: Hilda Wu <hildawu@realtek.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Alex Lu <alex_lu@realsil.com.cn>
CC: Simon Horman <simon.horman@corigine.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   32bf43e4efdb87e0f7e90ba3883e07b8522322ad
commit: 9e14606d8f38ea52a38c27692a9c1513c987a5da Bluetooth: msft: Extended monitor tracking by address filter
date:   4 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20230906 (https://download.01.org/0day-ci/archive/20230909/202309091157.V0PEAQVg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091157.V0PEAQVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309091157.V0PEAQVg-lkp@intel.com/

smatch warnings:
net/bluetooth/msft.c:563 msft_add_monitor_sync() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +563 net/bluetooth/msft.c

ce81843be24e9d Manish Mandlik         2021-09-21  511  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  512  static int msft_add_monitor_sync(struct hci_dev *hdev,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  513  				 struct adv_monitor *monitor)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  514  {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  515  	struct msft_cp_le_monitor_advertisement *cp;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  516  	struct msft_le_monitor_advertisement_pattern_data *pattern_data;
9e14606d8f38ea Hilda Wu               2023-06-21  517  	struct msft_monitor_advertisement_handle_data *handle_data;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  518  	struct msft_le_monitor_advertisement_pattern *pattern;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  519  	struct adv_pattern *entry;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  520  	size_t total_size = sizeof(*cp) + sizeof(*pattern_data);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  521  	ptrdiff_t offset = 0;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  522  	u8 pattern_count = 0;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  523  	struct sk_buff *skb;
9e14606d8f38ea Hilda Wu               2023-06-21  524  	int err;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  525  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  526  	if (!msft_monitor_pattern_valid(monitor))
182ee45da083db Luiz Augusto von Dentz 2021-10-27  527  		return -EINVAL;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  528  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  529  	list_for_each_entry(entry, &monitor->patterns, list) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  530  		pattern_count++;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  531  		total_size += sizeof(*pattern) + entry->length;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  532  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  533  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  534  	cp = kmalloc(total_size, GFP_KERNEL);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  535  	if (!cp)
182ee45da083db Luiz Augusto von Dentz 2021-10-27  536  		return -ENOMEM;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  537  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  538  	cp->sub_opcode = MSFT_OP_LE_MONITOR_ADVERTISEMENT;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  539  	cp->rssi_high = monitor->rssi.high_threshold;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  540  	cp->rssi_low = monitor->rssi.low_threshold;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  541  	cp->rssi_low_interval = (u8)monitor->rssi.low_threshold_timeout;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  542  	cp->rssi_sampling_period = monitor->rssi.sampling_period;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  543  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  544  	cp->cond_type = MSFT_MONITOR_ADVERTISEMENT_TYPE_PATTERN;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  545  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  546  	pattern_data = (void *)cp->data;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  547  	pattern_data->count = pattern_count;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  548  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  549  	list_for_each_entry(entry, &monitor->patterns, list) {
182ee45da083db Luiz Augusto von Dentz 2021-10-27  550  		pattern = (void *)(pattern_data->data + offset);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  551  		/* the length also includes data_type and offset */
182ee45da083db Luiz Augusto von Dentz 2021-10-27  552  		pattern->length = entry->length + 2;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  553  		pattern->data_type = entry->ad_type;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  554  		pattern->start_byte = entry->offset;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  555  		memcpy(pattern->pattern, entry->value, entry->length);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  556  		offset += sizeof(*pattern) + entry->length;
182ee45da083db Luiz Augusto von Dentz 2021-10-27  557  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  558  
182ee45da083db Luiz Augusto von Dentz 2021-10-27  559  	skb = __hci_cmd_sync(hdev, hdev->msft_opcode, total_size, cp,
182ee45da083db Luiz Augusto von Dentz 2021-10-27  560  			     HCI_CMD_TIMEOUT);
182ee45da083db Luiz Augusto von Dentz 2021-10-27  561  
ce78e557ff8819 Soenke Huster          2022-07-22  562  	if (IS_ERR_OR_NULL(skb)) {
9e14606d8f38ea Hilda Wu               2023-06-21 @563  		err = PTR_ERR(skb);
9e14606d8f38ea Hilda Wu               2023-06-21  564  		goto out_free;
ce78e557ff8819 Soenke Huster          2022-07-22  565  	}
182ee45da083db Luiz Augusto von Dentz 2021-10-27  566  
9e14606d8f38ea Hilda Wu               2023-06-21  567  	err = msft_le_monitor_advertisement_cb(hdev, hdev->msft_opcode,
b747a83690c8f5 Manish Mandlik         2022-07-20  568  					       monitor, skb);
9e14606d8f38ea Hilda Wu               2023-06-21  569  	if (err)
9e14606d8f38ea Hilda Wu               2023-06-21  570  		goto out_free;
9e14606d8f38ea Hilda Wu               2023-06-21  571  
9e14606d8f38ea Hilda Wu               2023-06-21  572  	handle_data = msft_find_handle_data(hdev, monitor->handle, true);
9e14606d8f38ea Hilda Wu               2023-06-21  573  	if (!handle_data) {
9e14606d8f38ea Hilda Wu               2023-06-21  574  		err = -ENODATA;
9e14606d8f38ea Hilda Wu               2023-06-21  575  		goto out_free;
9e14606d8f38ea Hilda Wu               2023-06-21  576  	}
9e14606d8f38ea Hilda Wu               2023-06-21  577  
9e14606d8f38ea Hilda Wu               2023-06-21  578  	handle_data->rssi_high	= cp->rssi_high;
9e14606d8f38ea Hilda Wu               2023-06-21  579  	handle_data->rssi_low	= cp->rssi_low;
9e14606d8f38ea Hilda Wu               2023-06-21  580  	handle_data->rssi_low_interval	  = cp->rssi_low_interval;
9e14606d8f38ea Hilda Wu               2023-06-21  581  	handle_data->rssi_sampling_period = cp->rssi_sampling_period;
9e14606d8f38ea Hilda Wu               2023-06-21  582  
9e14606d8f38ea Hilda Wu               2023-06-21  583  out_free:
9e14606d8f38ea Hilda Wu               2023-06-21  584  	kfree(cp);
9e14606d8f38ea Hilda Wu               2023-06-21  585  	return err;
b747a83690c8f5 Manish Mandlik         2022-07-20  586  }
182ee45da083db Luiz Augusto von Dentz 2021-10-27  587  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
