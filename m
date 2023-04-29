Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B0C1FD3
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Apr 2023 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682782148; x=1714318148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDFZdg/keU/piw6dJKGcjdONCIGGJIiXrZSKzW0vRpc=;
  b=iMUpXcLM4acaj2a7JUvquJFoBxgRostfQLoQK+FdEiO7olkVw0Yn8gnu
   dGXiLEu80GMBf4UowfUHTHMXCYOqS8FjEwCvxVzz1ahOgAlApe87+ojeX
   K9Sf1rjugwcFzKCyavcUFozUKAdN7JAmRK0LiZ9FhV6Ga19O66JDcN8iF
   H2M8tuOFzUMWC4NHCmLZd8sExcJCGAy4O5XMo2C7S04N+KU58rmXPAZf4
   1hDcprJLch1NEs9jf5pL2LRlCYtB3R2up6a6sVc7KiFvOuOaP2+bahieb
   hhTWF4KNC8o2vMCc5owNmkkRtJIKktnyXq+GgPdJ3xVJznD+YBbDUeShr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="350882233"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="350882233"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 08:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="697956814"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="697956814"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 29 Apr 2023 08:29:06 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psmVV-0001EL-3D;
	Sat, 29 Apr 2023 15:29:05 +0000
Date: Sat, 29 Apr 2023 23:28:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ext4/balloc.c:114:34-36: WARNING opportunity for max()
Message-ID: <202304292355.ZSoZhOYd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Kemeng Shi <shikemeng@huaweicloud.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89d77f71f493a3663b10fa812d17f472935d24be
commit: 68e294dcccf965c93d65c4660547794728a4cff0 ext4: improve inode table blocks counting in ext4_num_overhead_clusters
date:   5 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230429/202304292355.ZSoZhOYd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202304292355.ZSoZhOYd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/balloc.c:114:34-36: WARNING opportunity for max()
>> fs/ext4/balloc.c:116:30-32: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
