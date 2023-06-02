Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823FB19A
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jun 2023 00:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685665493; x=1717201493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u/OwDwVZvtT2qlrLWqmq7tqWj+SZVJBxZALh6Qusy5E=;
  b=iaTBv+tYt4wWERg396VtkeU9MvZz4E4VduRm/D2ndJGZvJy4vkicRc22
   G2zQvQXunj0PCCf5gk9pupfhliXwR7UxIBxCz4So+zG9+pxsPBzICegh0
   uHr3LRPdWqJr76Bq9i+lrJyF+MYrJWVi9wCQV0qGDejpXzfewsiWKgXI6
   H+UjC3sufJasBURNrugkTLMYMvtuGKPv4fQTFHdoHB6tOgJOMIr8Oytcv
   Bm7GFhUqzMul07BCF4t9D4glO+yod0u/lXE7hRFXYVfuO32zaOPkH2DbX
   MkHbyJ/Ww6VhKnN5OhRgc7pP/mTEvmjwY5clOIO9HIYuBTCfMv1C0azyd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354578721"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="354578721"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 17:24:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="851915094"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="851915094"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2023 17:24:51 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4sb4-0002oa-2S;
	Fri, 02 Jun 2023 00:24:50 +0000
Date: Fri, 2 Jun 2023 08:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [net-next/RFC PATCH v1 2/4] net: Add support for associating
 napi with queue[s]
Message-ID: <202306020821.NcqBX7pS-lkp@intel.com>
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
In-Reply-To: <168564135094.7284.9691772825401908320.stgit@anambiarhost.jf.intel.com>
References: <168564135094.7284.9691772825401908320.stgit@anambiarhost.jf.intel.com>
TO: Amritha Nambiar <amritha.nambiar@intel.com>

Hi Amritha,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue net/main net-next/main linus/master v6.4-rc4 next-20230601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amritha-Nambiar/net-Introduce-new-napi-fields-for-rx-tx-queues/20230602-013021
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/168564135094.7284.9691772825401908320.stgit%40anambiarhost.jf.intel.com
patch subject: [net-next/RFC PATCH v1 2/4] net: Add support for associating napi with queue[s]
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-randconfig-m021-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020821.NcqBX7pS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306020821.NcqBX7pS-lkp@intel.com/

New smatch warnings:
net/core/dev.c:6396 netif_napi_add_queue() warn: possible memory leak of 'napi_queue'

Old smatch warnings:
net/core/dev.c:10454 netdev_run_todo() warn: passing freed memory 'dev'

vim +/napi_queue +6396 net/core/dev.c

5fdd2f0e5c6484 Wei Wang        2021-02-08  6368  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6369  /**
9b6d735207c0eb Amritha Nambiar 2023-06-01  6370   * netif_napi_add_queue - Associate queue with the napi
9b6d735207c0eb Amritha Nambiar 2023-06-01  6371   * @napi: NAPI context
9b6d735207c0eb Amritha Nambiar 2023-06-01  6372   * @queue_index: Index of queue
9b6d735207c0eb Amritha Nambiar 2023-06-01  6373   * @napi_container_type: queue type as RX or TX
9b6d735207c0eb Amritha Nambiar 2023-06-01  6374   *
9b6d735207c0eb Amritha Nambiar 2023-06-01  6375   * Add queue with its corresponding napi context
9b6d735207c0eb Amritha Nambiar 2023-06-01  6376   */
9b6d735207c0eb Amritha Nambiar 2023-06-01  6377  int netif_napi_add_queue(struct napi_struct *napi, u16 queue_index,
9b6d735207c0eb Amritha Nambiar 2023-06-01  6378  			 enum napi_container_type type)
9b6d735207c0eb Amritha Nambiar 2023-06-01  6379  {
9b6d735207c0eb Amritha Nambiar 2023-06-01  6380  	struct napi_queue *napi_queue;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6381  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6382  	napi_queue = kzalloc(sizeof(*napi_queue), GFP_KERNEL);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6383  	if (!napi_queue)
9b6d735207c0eb Amritha Nambiar 2023-06-01  6384  		return -ENOMEM;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6385  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6386  	napi_queue->queue_index = queue_index;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6387  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6388  	switch (type) {
9b6d735207c0eb Amritha Nambiar 2023-06-01  6389  	case NAPI_RX_CONTAINER:
9b6d735207c0eb Amritha Nambiar 2023-06-01  6390  		list_add_rcu(&napi_queue->q_list, &napi->napi_rxq_list);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6391  		break;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6392  	case NAPI_TX_CONTAINER:
9b6d735207c0eb Amritha Nambiar 2023-06-01  6393  		list_add_rcu(&napi_queue->q_list, &napi->napi_txq_list);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6394  		break;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6395  	default:
9b6d735207c0eb Amritha Nambiar 2023-06-01 @6396  		return -EINVAL;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6397  	}
9b6d735207c0eb Amritha Nambiar 2023-06-01  6398  
9b6d735207c0eb Amritha Nambiar 2023-06-01  6399  	return 0;
9b6d735207c0eb Amritha Nambiar 2023-06-01  6400  }
9b6d735207c0eb Amritha Nambiar 2023-06-01  6401  EXPORT_SYMBOL(netif_napi_add_queue);
9b6d735207c0eb Amritha Nambiar 2023-06-01  6402  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
