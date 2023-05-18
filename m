Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5815EAD3C
	for <oe-kbuild@lists.linux.dev>; Thu, 18 May 2023 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684400539; x=1715936539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5JTh+rE5MGq6yObIsgdoLcSC+6FBLhVH7gdUP4HN1w=;
  b=mcgNFkpxGMrL5z/DJeXsGDRyijYz6EtbKQmINoac63vhuTx7nvlt3CrM
   tmUHTsRF4HtutIZFqKZ37KzTF85rB9JmR2yVlxgUEddS/XzPkCsfgmZpz
   CKXix6un9skylT/t3US/yTbEPSwD/CucTpc7jMZsGfhmhUVKWObZxhNJ5
   20RGyed/bds+Pty/QfZcBSL4U5zif83qEvYG1OtXdJRe7FPJKyh7IJjZd
   QWJsHEf7Gp9Rs7uREsmFHZbUb0XP4RBYeS7DiYzaiyJmwOEfsDZQivvqV
   ZtSlRRPDKHrAo6Nq736Lcy64V5UfJghkTCn9w1Q4ScwEtC24BOEmjzoRi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349527326"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="349527326"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2023 02:02:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948614500"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; 
   d="scan'208";a="948614500"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 18 May 2023 02:02:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzZWa-0009nG-2a;
	Thu, 18 May 2023 09:02:16 +0000
Date: Thu, 18 May 2023 17:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RFC v2 net-next 18/28] p4tc: add P4 classifier
Message-ID: <202305181621.3GcoiWn8-lkp@intel.com>
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
In-Reply-To: <20230517110232.29349-18-jhs@mojatatu.com>
References: <20230517110232.29349-18-jhs@mojatatu.com>
TO: Jamal Hadi Salim <jhs@mojatatu.com>

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-increase-action-kind-string-length/20230517-193344
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230517110232.29349-18-jhs%40mojatatu.com
patch subject: [PATCH RFC v2 net-next 18/28] p4tc: add P4 classifier
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305181621.3GcoiWn8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/sched/p4tc/p4tc_bpf.c: linux/filter.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
