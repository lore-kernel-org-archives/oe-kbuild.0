Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0679A626
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Apr 2023 17:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681407255; x=1712943255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/dppiKjj1sb9b1JAF17eASkF8GXYebkkTB3vMOJAf+k=;
  b=XZI0KUKMpeBuXzJZ+LGcwKy1tCMCQKISTW02hvztWPHwh1/kJJl1WxlO
   qEflvDjJlB6bYVQhhCRYOCY+6sYwpD9GYsgJsw6sEWoiu50kIfEWABLmx
   noMlU3wgViw5Xj/QKVj4N0kiiK0Fimb5CdGoNylGbD5UHUEJCY7nPyptb
   Il6GU/FYArpylQLvfpzSrYqEH0EvnhtjW/k6/YMaB4Wh8qkY1e7C/OH3g
   lR/ktwzVD9e47kLWbbzDBcJuRgubK8WNgJrym7kqI/FBXirbE7aeu54uE
   3P0m7zSu/Yf8Az7354ZeeSXSWBUKv9BHnAEtxaQQl2OAlZIIH2tNQfXgc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409434067"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="409434067"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 10:34:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="935688291"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; 
   d="scan'208";a="935688291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Apr 2023 10:33:59 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pn0pa-000Yqn-0M;
	Thu, 13 Apr 2023 17:33:58 +0000
Date: Fri, 14 Apr 2023 01:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC net-next v20] vmxnet3: Add XDP support.
Message-ID: <202304140107.ud5iiJZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230412234434.91819-1-witu@nvidia.com>
References: <20230412234434.91819-1-witu@nvidia.com>
TO: William Tu <u9012063@gmail.com>

Hi William,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3-Add-XDP-support/20230413-074504
patch link:    https://lore.kernel.org/r/20230412234434.91819-1-witu%40nvidia.com
patch subject: [PATCH RFC net-next v20] vmxnet3: Add XDP support.
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304140107.ud5iiJZQ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/vmxnet3/vmxnet3_int.h: linux/skbuff.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
