Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B85392
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Feb 2023 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677074717; x=1708610717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=10YZXfMFNDztSNGLdXiGW4SIqMV9TkdAB+1A3YMMIA0=;
  b=bgVzFHSw22fZQAAk47E63JFSL4tNsXft60SrwXWk1AQgOCotidULXxHo
   piyF1EDMrgNJYh37fsnNtQbL0VEODJp2i2iBwGldstp3Xsa2rraY4XWhm
   +eT8xDaKeUcHTj/DucjE5X6IBlWrjxVpDHJmpcKVg5sFufbpaqocRsk6k
   tIik6OQb3ouScFj0Pe/4eHlDM/P2gX/OibEIm+qr+WCgqyE/kC947oxFB
   1S9jc17WmfI8l1P+WcJ4peIV54h2/uByMAhrhRHhlmJIKh195cDknwjEA
   HLdsTIFpFcNB/oYMy0Kwv5ZIN8gACqug0XweYsshXgoyOGl6K4kNrivj6
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="397616130"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="397616130"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 06:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="740829768"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="740829768"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2023 06:05:16 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUpkB-0000P3-10;
	Wed, 22 Feb 2023 14:05:15 +0000
Date: Wed, 22 Feb 2023 22:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [steev:lenovo-x13s-v6.2 114/188] drivers/interconnect/core.c:853
 icc_node_destroy() error: we previously assumed 'node' could be null (see
 line 846)
Message-ID: <202302222118.nGz1F0oJ-lkp@intel.com>
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
TO: Johan Hovold <johan+linaro@kernel.org>
CC: Steev Klimaszewski <steev@kali.org>

tree:   https://github.com/steev/linux lenovo-x13s-v6.2
head:   b9925baa3e5cf7919e9736257505a214b66dcdd2
commit: f89ce4d6ffc2c5e73c476d0d264951feef193f17 [114/188] interconnect: fix mem leak when freeing nodes
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: microblaze-randconfig-m031-20230222 (https://download.01.org/0day-ci/archive/20230222/202302222118.nGz1F0oJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302222118.nGz1F0oJ-lkp@intel.com/

smatch warnings:
drivers/interconnect/core.c:853 icc_node_destroy() error: we previously assumed 'node' could be null (see line 846)

vim +/node +853 drivers/interconnect/core.c

11f1ceca7031de Georgi Djakov 2019-01-16  834  
11f1ceca7031de Georgi Djakov 2019-01-16  835  /**
11f1ceca7031de Georgi Djakov 2019-01-16  836   * icc_node_destroy() - destroy a node
11f1ceca7031de Georgi Djakov 2019-01-16  837   * @id: node id
11f1ceca7031de Georgi Djakov 2019-01-16  838   */
11f1ceca7031de Georgi Djakov 2019-01-16  839  void icc_node_destroy(int id)
11f1ceca7031de Georgi Djakov 2019-01-16  840  {
11f1ceca7031de Georgi Djakov 2019-01-16  841  	struct icc_node *node;
11f1ceca7031de Georgi Djakov 2019-01-16  842  
11f1ceca7031de Georgi Djakov 2019-01-16  843  	mutex_lock(&icc_lock);
11f1ceca7031de Georgi Djakov 2019-01-16  844  
11f1ceca7031de Georgi Djakov 2019-01-16  845  	node = node_find(id);
11f1ceca7031de Georgi Djakov 2019-01-16 @846  	if (node) {
11f1ceca7031de Georgi Djakov 2019-01-16  847  		idr_remove(&icc_idr, node->id);
11f1ceca7031de Georgi Djakov 2019-01-16  848  		WARN_ON(!hlist_empty(&node->req_list));
11f1ceca7031de Georgi Djakov 2019-01-16  849  	}
11f1ceca7031de Georgi Djakov 2019-01-16  850  
11f1ceca7031de Georgi Djakov 2019-01-16  851  	mutex_unlock(&icc_lock);
11f1ceca7031de Georgi Djakov 2019-01-16  852  
f89ce4d6ffc2c5 Johan Hovold  2023-01-31 @853  	kfree(node->links);
11f1ceca7031de Georgi Djakov 2019-01-16  854  	kfree(node);
11f1ceca7031de Georgi Djakov 2019-01-16  855  }
11f1ceca7031de Georgi Djakov 2019-01-16  856  EXPORT_SYMBOL_GPL(icc_node_destroy);
11f1ceca7031de Georgi Djakov 2019-01-16  857  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
