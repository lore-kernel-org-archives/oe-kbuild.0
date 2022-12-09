Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A275816
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Dec 2022 07:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670570109; x=1702106109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ej7TgiAHzhvLK7DqrPyN/K9bzjcj8kwd173293mOWWs=;
  b=kB23wMkNDwbZPS2rlBRdy8TOkjPswNB0cuErMQD+DQKIM1QRGe0NRWj4
   aSsdi3J3cgudSbN2TMiKDvPu2WSuPe6O5CuRHqEL9xNPQd00pmyj1Rmaz
   Iebr4MUW6gml7gtPDkjQ+5ktYHB4Sp5gQdfpcTDlLSYtKxlxG6WYnpO68
   QF3zyXgNO62+wUE5cFbhfjR6sCAa98bvEymcXgx7ZXggIEFRnxdXquP+O
   /08M5QtkcNIUTOsfhnRoqIGHnZdjAWvRcibdntITC1/3dPm3kHsYQgJZC
   cqpH8Ro4821iHco2RYeP/uXEQFfQFQipyUXQ4jX6dABBZ6zeHOLjx/qhj
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="315036437"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="315036437"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2022 23:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="892562783"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; 
   d="scan'208";a="892562783"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2022 23:15:07 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p3Xb9-0001il-0f;
	Fri, 09 Dec 2022 07:15:07 +0000
Date: Fri, 9 Dec 2022 15:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V3 1/8] cxl/mem: Read, trace, and clear events on driver
 load
Message-ID: <202212091529.KGJtfbLV-lkp@intel.com>
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
In-Reply-To: <20221208052115.800170-2-ira.weiny@intel.com>
References: <20221208052115.800170-2-ira.weiny@intel.com>
TO: ira.weiny@intel.com

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on acb704099642bc822ef2aed223a0b8db1f7ea76e]

url:    https://github.com/intel-lab-lkp/linux/commits/ira-weiny-intel-com/CXL-Process-event-logs/20221208-132333
base:   acb704099642bc822ef2aed223a0b8db1f7ea76e
patch link:    https://lore.kernel.org/r/20221208052115.800170-2-ira.weiny%40intel.com
patch subject: [PATCH V3 1/8] cxl/mem: Read, trace, and clear events on driver load
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/cxl/core/trace.h: linux/tracepoint.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
