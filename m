Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6114D51F
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 22:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691014592; x=1722550592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+MdeRsKM39d/9/MAn6CPOXA6GKI7YTcd3xT1iekhHCE=;
  b=G/oOAOopuYcKZPn+qjukAE4qYD9Y86z8QVBP3+94T0lyEjnfe1mXzTTN
   GTq+qpwQRPNtlP6UKYNLBS2ZL1EDjFsGDzYrhrYcYjQZtqDdd248fAMj8
   rbjD8cNrnyjUEg7UoaCpXSYDgfKuMSbhDxWUtH3t/QCrjvYUK4IwMUB/C
   el2w2PfzSQCj+C/rReOXNheuJ8M2aqrv8CSQBR7Cg2onV7Z939YTN4S0J
   duKowSNaJclP+TRbw6DxhvrUGQsaoXqJ6cqCw0mLLfNKT+oIYTejAwbS7
   FjrgMMdaEh+B4GntjwJPa9Posn1RgWbmfh3pmFCL3bIHE9u6DweeFQDg5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349309907"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="349309907"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 15:16:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="903104034"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="903104034"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Aug 2023 15:16:30 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRK8s-0001WR-07;
	Wed, 02 Aug 2023 22:16:30 +0000
Date: Thu, 3 Aug 2023 06:16:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 5/6] virtio-net: support tx netdim
Message-ID: <202308030654.2yAeKpbK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230801082235.21634-6-hengqi@linux.alibaba.com>
References: <20230801082235.21634-6-hengqi@linux.alibaba.com>
TO: Heng Qi <hengqi@linux.alibaba.com>

Hi Heng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc4 next-20230802]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heng-Qi/virtio-net-returns-whether-napi-is-complete/20230801-162552
base:   linus/master
patch link:    https://lore.kernel.org/r/20230801082235.21634-6-hengqi%40linux.alibaba.com
patch subject: [RFC PATCH 5/6] virtio-net: support tx netdim
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230803/202308030654.2yAeKpbK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030654.2yAeKpbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308030654.2yAeKpbK-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtnet_poll_tx':
   virtio_net.c:(.text+0x932b85): undefined reference to `net_dim'
   ld: vmlinux.o: in function `virtnet_tx_dim_work':
>> virtio_net.c:(.text+0x9335a4): undefined reference to `net_dim_get_tx_moderation'
   ld: vmlinux.o: in function `virtnet_rx_dim_work':
   virtio_net.c:(.text+0x934034): undefined reference to `net_dim_get_rx_moderation'
   ld: vmlinux.o: in function `skb_xmit_done':
   virtio_net.c:(.text+0x9346fa): undefined reference to `net_dim'
   ld: vmlinux.o: in function `virtnet_poll':
   virtio_net.c:(.text+0x93b923): undefined reference to `net_dim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
