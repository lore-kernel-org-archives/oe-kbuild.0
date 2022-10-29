Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E215AD
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Oct 2022 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667047476; x=1698583476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q9f2n+p3D3kSQF6VpHU5yaDI3lRm7pIcikHi2ZfJrdo=;
  b=RAldwgWHE6zgCYKMjtJCecdAsuvxyI7R4v3thUMRP2MHSdeiLdvvAfoP
   NUm9eg7ECQ5aGobV12nDhU9iSo29tW8lfyRra2M2mZSkbVeU8uVCZc8Yo
   QoLs74xbI4/gwPVgrxzwevTBqZhO1a8yekp8DhQdXIoc6ebV5VJ33YsvT
   EQ9WG1TB1QdYe1nVjjqroOnAtfI6VxZDSRZIOZYFmC2VQEB8ndRgplcac
   VkgEMPPXARl1icj2hPfnBt7dIW2dmlfWuxntOKTvtD4hQxGwH5d9rjy3j
   3RVmCCxy3KN0PS7X2m+nJyVE1CIebiMLK9z9X+qhmPFcsjSMTXn+8tTQ7
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="335312795"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="335312795"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 05:44:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="696526264"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="696526264"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Oct 2022 05:44:35 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oolCU-000B2R-1U;
	Sat, 29 Oct 2022 12:44:34 +0000
Date: Sat, 29 Oct 2022 20:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 15/21] btrfs: store a fscrypt extent context per
 normal file extent
Message-ID: <202210292035.pI0Ja8pq-lkp@intel.com>
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
In-Reply-To: <014e0e48e9c00aedf7f3473948e569008c87541d.1666651724.git.sweettea-kernel@dorminy.me>
References: <014e0e48e9c00aedf7f3473948e569008c87541d.1666651724.git.sweettea-kernel@dorminy.me>
TO: Sweet Tea Dorminy <sweettea-kernel@dorminy.me>

Hi Sweet,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on cc159678aee59042e24fd1b039405b4fdf7b0538]

url:    https://github.com/intel-lab-lkp/linux/commits/Sweet-Tea-Dorminy/btrfs-add-fscrypt-integration/20221025-084435
base:   cc159678aee59042e24fd1b039405b4fdf7b0538
patch link:    https://lore.kernel.org/r/014e0e48e9c00aedf7f3473948e569008c87541d.1666651724.git.sweettea-kernel%40dorminy.me
patch subject: [PATCH v4 15/21] btrfs: store a fscrypt extent context per normal file extent
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/fscrypt.c: fscrypt.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
