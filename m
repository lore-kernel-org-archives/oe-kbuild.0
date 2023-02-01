Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A2963B3
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 15:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675264713; x=1706800713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRtWQhtJWyQJk7mrpm9LoCTOYTsdtZJ7N/jvHhqc9yY=;
  b=PvdGffpC8LKZnFQqEbfYygK26sPG+2E33G+c+PSlNnFLplchExjH5EEY
   IDQevsT2InECvHXPoQFMsV2cQir5teHBJ8CSnSVMP31/+sO5CksgAVEyr
   UPXqQ03iZJTezoQTLe211TnTfRszhdRmxmb5MGAz43QtQismkcSxCG8xW
   ZcWsL47Jic0qjjQsYV7hgn73DpYgQjPxBgYGXLwuQlLJOYDPq/r9IGf9Y
   XJc+nFFVkPSVknlWnejB1KoA1KCx7iQcluOGh5MW7wOTdtKCMsewCQgVZ
   PIuf07Fy1zgijcnDOPHYnpjJVlb0JIfIPwE89mV1+JYazGFsGJHAs3D95
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355502897"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="355502897"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 07:18:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="642457131"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="642457131"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Feb 2023 07:18:31 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNEsY-0005Ws-1Y;
	Wed, 01 Feb 2023 15:18:30 +0000
Date: Wed, 1 Feb 2023 23:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8679/9815] drivers/of/platform.c:570:2-23:
 WARNING: Function "for_each_node_by_type" should have of_node_put() before
 break around line 575.
Message-ID: <202302012320.Rl6PHBdQ-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michal Suchanek <msuchanek@suse.de>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66eee64b235411d512bed4d672c2d00683239daf
commit: 2b54c9b44c7e7ac4d6b2e67a10db591e227c9c07 [8679/9815] of: Make of framebuffer devices unique
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-c043-20230129 (https://download.01.org/0day-ci/archive/20230201/202302012320.Rl6PHBdQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@lip6.fr>

cocci warnings: (new ones prefixed by >>)
   drivers/of/platform.c:557:2-23: WARNING: Function "for_each_node_by_type" should have of_node_put() before return around line 563.
   drivers/of/platform.c:557:2-23: WARNING: Function "for_each_node_by_type" should have of_node_put() before return around line 566.
>> drivers/of/platform.c:570:2-23: WARNING: Function "for_each_node_by_type" should have of_node_put() before break around line 575.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
