Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727E380
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Jan 2023 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674265062; x=1705801062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXdQLa94fGL8AY63MUMJqO8MXvRV9X9BLe2uEvn5J3o=;
  b=lY9Q2tfcrZJy31oOE8deHKwchxwk7///IQKjP+Ub3x9URfavlWrr7FnC
   l275GASAatb2maou2d66iOUgnXlJKP+R7R7Xr2kaWuPjWH7P5ZqTl9WSc
   vF/CO3wPp7bYbOZZtwv28dlDzQkR7tALE2D/qDEKnHlhg/AhLMhXJKHvK
   BEUshQHDswZdNmHMsqPXC/uXncG1i3qcdFZCJW3PUddJc2MH61/JbBU7r
   b53YtxSHI54RUTKG0wyz0HJG2hQwP8wuLn0ybO6bURhwsTWJc1Y3L28Ta
   9B1R7PzzCnWfv6AjH4fz/2+EnnSXFvw4aLr1tftgHJ/C6zkRXtV/fxb0m
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327016386"
X-IronPort-AV: E=Sophos;i="5.97,234,1669104000"; 
   d="scan'208";a="327016386"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 17:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="989594957"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="989594957"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 17:37:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJ2p8-0003EG-15;
	Sat, 21 Jan 2023 01:37:38 +0000
Date: Sat, 21 Jan 2023 09:37:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH] ARM: mvebu: potential dereference of null pointer
Message-ID: <202301210926.eZarSBqd-lkp@intel.com>
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
In-Reply-To: <202301191051184033370@zte.com.cn>
References: <202301191051184033370@zte.com.cn>
TO: ye.xingchen@zte.com.cn
TO: andrew@lunn.ch
CC: gregory.clement@bootlin.com
CC: sebastian.hesselbarth@gmail.com
CC: linux@armlinux.org.uk
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/ARM-mvebu-potential-dereference-of-null-pointer/20230119-105239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/202301191051184033370%40zte.com.cn
patch subject: [PATCH] ARM: mvebu: potential dereference of null pointer
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c032-20230119 (https://download.01.org/0day-ci/archive/20230121/202301210926.eZarSBqd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
>> arch/arm/mach-mvebu/board-v7.c:124:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 129.
   arch/arm/mach-mvebu/board-v7.c:124:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 136.
--
>> arch/arm/mach-mvebu/coherency.c:190:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 195.
   arch/arm/mach-mvebu/coherency.c:190:1-25: WARNING: Function "for_each_compatible_node" should have of_node_put() before return around line 198.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
