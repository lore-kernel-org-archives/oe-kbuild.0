Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DBF100AD
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 20:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691006606; x=1722542606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ndPrILVvCyeR3qWYmTCycvSReGl9yLaRNtPfxZ8WxhE=;
  b=SDvdvBpNRisQsAsh34kW7xEldlay/U9+dwUts4XkgANUk1Y87doSkvZm
   ybSdeBfSVsBI7f9j/PBgQ+6Bg+k8wrhvic/rF5hI11Wgs6mVfm05DS74p
   mGf+2Yog7xWlnSPqZluSzNgx9gUqZYpCxCpgYr+RN/4zaRSjBNkwAemgF
   fOAeTy9fGf7CqQ7sSxXPKCTRmB0+tkOxBH/Rle0xeBJvA6PYoo3s9rxnf
   7PaUsa7Lb4f4+wY2wwZyUNO/z/q7VeCySfX1QVPbtBo+VK3/hHkM8QT7U
   RKtYAE+doxzE6ERwTigFybCQ149gM8m+vrbcRW4LZaFhUSlOttC0yYYXy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="436004244"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="436004244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 13:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="758873029"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="758873029"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Aug 2023 13:03:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRI44-0001SB-1o;
	Wed, 02 Aug 2023 20:03:24 +0000
Date: Thu, 3 Aug 2023 04:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 4/6] virtio-net: support rx netdim
Message-ID: <202308030335.S81NnNgz-lkp@intel.com>
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
In-Reply-To: <20230801082235.21634-5-hengqi@linux.alibaba.com>
References: <20230801082235.21634-5-hengqi@linux.alibaba.com>
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
patch link:    https://lore.kernel.org/r/20230801082235.21634-5-hengqi%40linux.alibaba.com
patch subject: [RFC PATCH 4/6] virtio-net: support rx netdim
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230803/202308030335.S81NnNgz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030335.S81NnNgz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308030335.S81NnNgz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `virtnet_rx_dim_work':
>> virtio_net.c:(.text+0x933c64): undefined reference to `net_dim_get_rx_moderation'
   ld: vmlinux.o: in function `virtnet_poll':
>> virtio_net.c:(.text+0x93b6b0): undefined reference to `net_dim'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
