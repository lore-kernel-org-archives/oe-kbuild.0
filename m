Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BC17E
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Dec 2022 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672425772; x=1703961772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iwjULecQnDgUGv7cLq7sH2RqLsL1SJ8mXfBcA3yOxNc=;
  b=ON/5yve9z0JmuniRouiWSqgFhwHexuD9L7Hm9Vosn+WvUkHQEHvWF4Wr
   ggfJCC0EYzWf4UT2UjNA7JkmaUOHcW+jE2zDxRsx8MLVYYs096zTq43sg
   Fw8f6i0YOluLAwj6ukveWo84Wy3tbgBGTgH+asCVB6d07tPkPUqUKFJt/
   g0fm+7Id6LyIlhRNZWb6UVMtGETUOMUQz4rC+UGLOWEFlB9202c83Xc4c
   mfDVuy1uVEfXQU67zBxre6VXoxUWVHsI6Mj939hOMyN2+z8hA1YvFRqNK
   DYl+sXmhgz9Ia0X22FuXCrnrA+qPUMVWb9yR3JOIDuX5QgiVy92lNYTLs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="348456511"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="348456511"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2022 10:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10576"; a="684529725"
X-IronPort-AV: E=Sophos;i="5.96,288,1665471600"; 
   d="scan'208";a="684529725"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 30 Dec 2022 10:42:50 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pBKLB-000IJR-1D;
	Fri, 30 Dec 2022 18:42:49 +0000
Date: Sat, 31 Dec 2022 02:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v2 8/9] octeon_ep: add PF-VF mailbox
 communication
Message-ID: <202212310217.PtUcbZhB-lkp@intel.com>
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
In-Reply-To: <20221129130933.25231-9-vburru@marvell.com>
References: <20221129130933.25231-9-vburru@marvell.com>
TO: Veerasenareddy Burru <vburru@marvell.com>
TO: netdev@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: lironh@marvell.com
TO: aayarekar@marvell.com
TO: sedara@marvell.com
TO: sburla@marvell.com
CC: linux-doc@vger.kernel.org
CC: Veerasenareddy Burru <vburru@marvell.com>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>

Hi Veerasenareddy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 7a168f560e3c3829b74a893d3655caab14a7aef8]

url:    https://github.com/intel-lab-lkp/linux/commits/Veerasenareddy-Burru/octeon_ep-Update-PF-mailbox-for-VF/20221130-110134
base:   7a168f560e3c3829b74a893d3655caab14a7aef8
patch link:    https://lore.kernel.org/r/20221129130933.25231-9-vburru%40marvell.com
patch subject: [PATCH net-next v2 8/9] octeon_ep: add PF-VF mailbox communication
:::::: branch date: 4 weeks ago
:::::: commit date: 4 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/marvell/octeon_ep/octep_pfvf_mbox.c: linux/types.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
