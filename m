Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2549210E3
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jun 2023 01:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685671077; x=1717207077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVu7sGuXn3UV7vrZly3/FdBa/hqnNvCQ4acLastf9mo=;
  b=dCoEg+FZmOx3JnRJTsaVh6SIZIqa7LRn6JgW4O6x5Gj6hz5zlq/OUsvS
   4vBwmgI6oKjXekVT0CkOXQnS2KNYyeVDUOBoqsCQuJsoRxtOi5TLJgP1g
   EhCzsWWVl/EmweeIkJssxcs3I3l6asPyjDxdvo/28ysEdcCBya3T6Ttg5
   WF0mc/mEZh87Qs2xgkxZfGjWa30s/HsKxfMZPPIGL7ZbyrX3qYOOOWZxp
   VvMfCn9CNRPbRUjhacHaL5qkQVKwg81eWXBpvNZsW39PIMRlSZEXIXgLI
   E5aQjyguRNdF7RJxHyfo0Seexeks2IiO5fXS4+KJ8ZmGzVmTqx2rb5SiA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="354591796"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="354591796"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="737336429"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="737336429"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2023 18:57:54 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4u38-0002u6-05;
	Fri, 02 Jun 2023 01:57:54 +0000
Date: Fri, 2 Jun 2023 09:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-nvme:nvme-6.5 15/21] drivers/nvme/host/fabrics.c:96:2-8:
 preceding lock on line 85
Message-ID: <202306020909.MTUEBeIa-lkp@intel.com>
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
CC: linux-nvme@lists.infradead.org
TO: Max Gurtovoy <mgurtovoy@nvidia.com>
CC: Keith Busch <kbusch@kernel.org>
CC: Israel Rukshin <israelr@nvidia.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/nvme.git nvme-6.5
head:   14ad91f7a9a29562f23bedd205ef209255d8b8d1
commit: f0cebf82004d610be3ef47abf315ddf95aa2dcd1 [15/21] nvme-fabrics: prevent overriding of existing host
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-c032-20230531 (https://download.01.org/0day-ci/archive/20230602/202306020909.MTUEBeIa-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306020909.MTUEBeIa-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/fabrics.c:96:2-8: preceding lock on line 85

vim +96 drivers/nvme/host/fabrics.c

f0cebf82004d61 Max Gurtovoy      2023-05-12   80  
f0cebf82004d61 Max Gurtovoy      2023-05-12   81  static struct nvmf_host *nvmf_host_add(const char *hostnqn, uuid_t *id)
07bfcd09a28855 Christoph Hellwig 2016-06-13   82  {
07bfcd09a28855 Christoph Hellwig 2016-06-13   83  	struct nvmf_host *host;
07bfcd09a28855 Christoph Hellwig 2016-06-13   84  
07bfcd09a28855 Christoph Hellwig 2016-06-13  @85  	mutex_lock(&nvmf_hosts_mutex);
f0cebf82004d61 Max Gurtovoy      2023-05-12   86  	host = __nvmf_host_find(hostnqn, id);
f0cebf82004d61 Max Gurtovoy      2023-05-12   87  	if (IS_ERR(host)) {
f0cebf82004d61 Max Gurtovoy      2023-05-12   88  		goto out_unlock;
f0cebf82004d61 Max Gurtovoy      2023-05-12   89  	} else if (host) {
98096d8a787f05 Christoph Hellwig 2016-08-18   90  		kref_get(&host->ref);
07bfcd09a28855 Christoph Hellwig 2016-06-13   91  		goto out_unlock;
98096d8a787f05 Christoph Hellwig 2016-08-18   92  	}
07bfcd09a28855 Christoph Hellwig 2016-06-13   93  
f0cebf82004d61 Max Gurtovoy      2023-05-12   94  	host = nvmf_host_alloc(hostnqn, id);
07bfcd09a28855 Christoph Hellwig 2016-06-13   95  	if (!host)
f0cebf82004d61 Max Gurtovoy      2023-05-12  @96  		return ERR_PTR(-ENOMEM);
07bfcd09a28855 Christoph Hellwig 2016-06-13   97  
07bfcd09a28855 Christoph Hellwig 2016-06-13   98  	list_add_tail(&host->list, &nvmf_hosts);
07bfcd09a28855 Christoph Hellwig 2016-06-13   99  out_unlock:
07bfcd09a28855 Christoph Hellwig 2016-06-13  100  	mutex_unlock(&nvmf_hosts_mutex);
07bfcd09a28855 Christoph Hellwig 2016-06-13  101  	return host;
07bfcd09a28855 Christoph Hellwig 2016-06-13  102  }
07bfcd09a28855 Christoph Hellwig 2016-06-13  103  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
