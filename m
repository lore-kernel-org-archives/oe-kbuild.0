Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5151CA4C
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Sep 2023 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694692879; x=1726228879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4JfWVCvQP9Dxurj2IzN6CI/TVokGfXZCNPWYM8Hqi0=;
  b=D5fKoBx+6jOKf3kYlzLjSNqAi10nS/9+FAR4PzO+ssiaF4BYnQC+b69I
   YzjicP/nFN5TDJs8GrfhJj2mf++iS5raMkdGpaaf7w5HWTAFCHWu5qQfL
   zr1w/jcvSA6S27eB8bLAXXbvUqCzhh6OntjgmQCS77GpOPgKeTD5VDGeT
   dv1HPhSLcNiDyux3lggl16tTjb4Z1dzcCxQIgq64rCHPIxOO7n6zZ9rfK
   AI7GeOiP9Iqn768c29nfzZVLH2aMVekXUt/OF06xMia6YOk/cOMhYSQhU
   Q12V3HtNo54clSz3XbwM8XJR4Sg2Rq3NBJaAWsql8uAT3KSv8XYaudzK/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409880903"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="409880903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 05:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="1075328328"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; 
   d="scan'208";a="1075328328"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 14 Sep 2023 05:01:17 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgl23-0001ZF-0x;
	Thu, 14 Sep 2023 12:01:15 +0000
Date: Thu, 14 Sep 2023 20:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix leaking l2cap_conn objects
Message-ID: <202309141910.lGRlJL61-lkp@intel.com>
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
In-Reply-To: <20230913193839.3029428-1-luiz.dentz@gmail.com>
References: <20230913193839.3029428-1-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth@vger.kernel.org

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6-rc1 next-20230914]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-L2CAP-Fix-leaking-l2cap_conn-objects/20230914-034053
base:   linus/master
patch link:    https://lore.kernel.org/r/20230913193839.3029428-1-luiz.dentz%40gmail.com
patch subject: [PATCH] Bluetooth: L2CAP: Fix leaking l2cap_conn objects
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-161-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141910.lGRlJL61-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230914/202309141910.lGRlJL61-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309141910.lGRlJL61-lkp@intel.com/

smatch warnings:
net/bluetooth/hci_conn.c:2725 hci_chan_del() warn: variable dereferenced before check 'conn' (see line 2723)

vim +/conn +2725 net/bluetooth/hci_conn.c

73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2719  
9472007c62ecc8 Andrei Emeltchenko     2012-09-06  2720  void hci_chan_del(struct hci_chan *chan)
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2721  {
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2722  	struct hci_conn *conn = chan->conn;
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02 @2723  	struct hci_dev *hdev = conn->hdev;
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2724  
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13 @2725  	if (!conn)
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2726  		return;
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2727  
38b3fef1730319 Andrei Emeltchenko     2012-06-15  2728  	BT_DBG("%s hcon %p chan %p", hdev->name, conn, chan);
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2729  
8192edef03f9b4 Gustavo Padovan        2011-12-14  2730  	list_del_rcu(&chan->list);
8192edef03f9b4 Gustavo Padovan        2011-12-14  2731  
8192edef03f9b4 Gustavo Padovan        2011-12-14  2732  	synchronize_rcu();
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2733  
bcbb655a180344 Johan Hedberg          2014-08-18  2734  	/* Prevent new hci_chan's to be created for this hci_conn */
f94b665dcf1532 Johan Hedberg          2014-08-18  2735  	set_bit(HCI_CONN_DROP, &conn->flags);
b3ff670a44cc34 Johan Hedberg          2014-08-18  2736  
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2737  	if (chan->cleanup)
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2738  		chan->cleanup(chan);
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2739  
6fc2f406e4158e Luiz Augusto von Dentz 2023-09-13  2740  	chan->conn = NULL;
6c388d32ec1b9f Johan Hedberg          2014-08-18  2741  	hci_conn_put(conn);
e9b02748ffc043 Andrei Emeltchenko     2012-10-25  2742  
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2743  	skb_queue_purge(&chan->data_q);
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2744  	kfree(chan);
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2745  }
73d80deb7bdf01 Luiz Augusto von Dentz 2011-11-02  2746  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
