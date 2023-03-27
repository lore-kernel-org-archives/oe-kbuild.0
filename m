Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6F1FBB
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Mar 2023 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679921713; x=1711457713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twvlQTlOX1tNnXiiO8LOJ4YXYklB2o5kydVYKGnjkmk=;
  b=iZZVjgVqKNvxWLc47xVTTE9dN8IG2Db4h6JZxPYBdTbOVbQvXiO+JQUd
   FZiXfJogimHmg5/RjxDRtyEX8aB8NSLqJHiSdXzvf5HQwA/BYeW1GjiqI
   IFz3/Cmu5iTEGhT/eEZV1tFvw9Jp5nHCw83wN/O7hXbFoRkWj6vdWArNP
   b3+VimOOUD2G9tmSJ01wEw88KDHC+g3Cv95PnKisT0GE9aByG2mBHpRjD
   b6rkgCmtUpv/xG+jPA5y8z8cI8hww+/CXgdu5pVurh5+2w/GS9e1m5ZZJ
   YzYb4U5isHVh8yE78kukawbaOKdD54C8OmWHVcs6qvqsEMwOX4+LmP0mm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="328689528"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="328689528"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 05:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="929447476"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="929447476"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 27 Mar 2023 05:55:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgmNT-000Hit-16;
	Mon, 27 Mar 2023 12:55:11 +0000
Date: Mon, 27 Mar 2023 20:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_conn: Fix not cleaning up on LE
 Connection failure
Message-ID: <202303272048.I3jduMCE-lkp@intel.com>
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
In-Reply-To: <20230324204525.3630188-1-luiz.dentz@gmail.com>
References: <20230324204525.3630188-1-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth@vger.kernel.org

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.3-rc4 next-20230327]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-Fix-printing-errors-if-LE-Connection-times-out/20230325-044559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230324204525.3630188-1-luiz.dentz%40gmail.com
patch subject: [PATCH 1/2] Bluetooth: hci_conn: Fix not cleaning up on LE Connection failure
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: riscv-randconfig-m031-20230326 (https://download.01.org/0day-ci/archive/20230327/202303272048.I3jduMCE-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303272048.I3jduMCE-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_conn.c:1202 hci_le_conn_failed() error: uninitialized symbol 'params'.

vim +/params +1202 net/bluetooth/hci_conn.c

^1da177e4c3f41 Linus Torvalds         2005-04-16  1186  
9bb3c01fdb2201 Andre Guedes           2014-01-30  1187  /* This function requires the caller holds hdev->lock */
9b3628d79b46f0 Luiz Augusto von Dentz 2022-04-22  1188  static void hci_le_conn_failed(struct hci_conn *conn, u8 status)
9bb3c01fdb2201 Andre Guedes           2014-01-30  1189  {
9bb3c01fdb2201 Andre Guedes           2014-01-30  1190  	struct hci_dev *hdev = conn->hdev;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1191  	struct hci_conn_params *params;
f161dd4122ffa7 Johan Hedberg          2014-08-15  1192  
e15b8378a4f322 Luiz Augusto von Dentz 2023-03-24  1193  	hci_connect_le_scan_cleanup(conn);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1194  
acb9f911ea1f82 Johan Hedberg          2015-12-03  1195  	/* If the status indicates successful cancellation of
91641b79e1e153 Zheng Yongjun          2021-06-02  1196  	 * the attempt (i.e. Unknown Connection Id) there's no point of
acb9f911ea1f82 Johan Hedberg          2015-12-03  1197  	 * notifying failure since we'll go back to keep trying to
acb9f911ea1f82 Johan Hedberg          2015-12-03  1198  	 * connect. The only exception is explicit connect requests
acb9f911ea1f82 Johan Hedberg          2015-12-03  1199  	 * where a timeout + cancel does indicate an actual failure.
acb9f911ea1f82 Johan Hedberg          2015-12-03  1200  	 */
acb9f911ea1f82 Johan Hedberg          2015-12-03  1201  	if (status != HCI_ERROR_UNKNOWN_CONN_ID ||
acb9f911ea1f82 Johan Hedberg          2015-12-03 @1202  	    (params && params->explicit_connect))
acb9f911ea1f82 Johan Hedberg          2015-12-03  1203  		mgmt_connect_failed(hdev, &conn->dst, conn->type,
acb9f911ea1f82 Johan Hedberg          2015-12-03  1204  				    conn->dst_type, status);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1205  
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1206  	/* Enable advertising in case this was a failed connection
3c857757ef6e5a Johan Hedberg          2014-03-25  1207  	 * attempt as a peripheral.
3c857757ef6e5a Johan Hedberg          2014-03-25  1208  	 */
abfeea476c68af Luiz Augusto von Dentz 2021-10-27  1209  	hci_enable_advertising(hdev);
9bb3c01fdb2201 Andre Guedes           2014-01-30  1210  }
9bb3c01fdb2201 Andre Guedes           2014-01-30  1211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
