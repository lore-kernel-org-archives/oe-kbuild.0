Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A73928E2
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Feb 2023 11:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677325531; x=1708861531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/iGhv2cwCn3Lppn/tBZQ3YgnPiJBYc0jsXn9qb3TQc=;
  b=XzBVHRUGVJDB03sZ7MMblx8iMkIh1z+/aCVrVpxhIHYHOaW18/1CZS0/
   2jm1Rkw3eVl50GbuSP0DAW8+1RSikEWMWht0Zmq0aAqNXk6RtSsvPD0co
   VahhRn91KxF8qX+7WCwhr8AsE3YwJwrW3FtiCrVoNlw9LAQwjDl2tghSg
   cyfyY998kKpLIQm8a5pdgwDZyqQTrBhaGD12keNaCA7xEeDR+ZHDvXD/w
   SWMAyGbz1QDPhC339jrc5kKl15p000Fs9/HhsuTxDR/m7K5YbeUxrXW2W
   m8V4meRECJvoZJXt5QJ5iBsDfdKN4qpZegGkp05plEwiqnzG+bC2SZQjP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="314044358"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="314044358"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 03:45:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="816040247"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="816040247"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Feb 2023 03:45:29 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVszY-0003A1-2b;
	Sat, 25 Feb 2023 11:45:28 +0000
Date: Sat, 25 Feb 2023 19:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13863/14003] net/bluetooth/hci_sync.c:2403
 hci_pause_addr_resolution() warn: missing error code? 'err'
Message-ID: <202302251952.xryXOegd-lkp@intel.com>
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
TO: Zhengping Jiang <jiangzp@google.com>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8232539f864ca60474e38eb42d451f5c26415856
commit: 2b291083eb0c49cd1633cddf95cc0e6e7303e43b [13863/14003] Bluetooth: hci_sync: Resume adv with no RPA when active scan
:::::: branch date: 8 hours ago
:::::: commit date: 15 hours ago
config: parisc-randconfig-m031-20230223 (https://download.01.org/0day-ci/archive/20230225/202302251952.xryXOegd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302251952.xryXOegd-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_sync.c:2403 hci_pause_addr_resolution() warn: missing error code? 'err'

Old smatch warnings:
net/bluetooth/hci_sync.c:2367 hci_resume_advertising_sync() error: uninitialized symbol 'err'.

vim +/err +2403 net/bluetooth/hci_sync.c

e8907f76544ffe Luiz Augusto von Dentz 2021-10-27  2369  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2370  static int hci_pause_addr_resolution(struct hci_dev *hdev)
2b291083eb0c49 Zhengping Jiang        2023-02-21  2371  {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2372  	int err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2373  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2374  	if (!use_ll_privacy(hdev))
2b291083eb0c49 Zhengping Jiang        2023-02-21  2375  		return 0;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2376  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2377  	if (!hci_dev_test_flag(hdev, HCI_LL_RPA_RESOLUTION))
2b291083eb0c49 Zhengping Jiang        2023-02-21  2378  		return 0;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2379  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2380  	/* Cannot disable addr resolution if scanning is enabled or
2b291083eb0c49 Zhengping Jiang        2023-02-21  2381  	 * when initiating an LE connection.
2b291083eb0c49 Zhengping Jiang        2023-02-21  2382  	 */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2383  	if (hci_dev_test_flag(hdev, HCI_LE_SCAN) ||
2b291083eb0c49 Zhengping Jiang        2023-02-21  2384  	    hci_lookup_le_connect(hdev)) {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2385  		bt_dev_err(hdev, "Command not allowed when scan/LE connect");
2b291083eb0c49 Zhengping Jiang        2023-02-21  2386  		return -EPERM;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2387  	}
2b291083eb0c49 Zhengping Jiang        2023-02-21  2388  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2389  	/* Cannot disable addr resolution if advertising is enabled. */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2390  	err = hci_pause_advertising_sync(hdev);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2391  	if (err) {
2b291083eb0c49 Zhengping Jiang        2023-02-21  2392  		bt_dev_err(hdev, "Pause advertising failed: %d", err);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2393  		return err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2394  	}
2b291083eb0c49 Zhengping Jiang        2023-02-21  2395  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2396  	err = hci_le_set_addr_resolution_enable_sync(hdev, 0x00);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2397  	if (err)
2b291083eb0c49 Zhengping Jiang        2023-02-21  2398  		bt_dev_err(hdev, "Unable to disable Address Resolution: %d",
2b291083eb0c49 Zhengping Jiang        2023-02-21  2399  			   err);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2400  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2401  	/* Return if address resolution is disabled and RPA is not used. */
2b291083eb0c49 Zhengping Jiang        2023-02-21  2402  	if (!err && scan_use_rpa(hdev))
2b291083eb0c49 Zhengping Jiang        2023-02-21 @2403  		return err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2404  
2b291083eb0c49 Zhengping Jiang        2023-02-21  2405  	hci_resume_advertising_sync(hdev);
2b291083eb0c49 Zhengping Jiang        2023-02-21  2406  	return err;
2b291083eb0c49 Zhengping Jiang        2023-02-21  2407  }
2b291083eb0c49 Zhengping Jiang        2023-02-21  2408  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
