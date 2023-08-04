Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCC51BEE3
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 23:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691191377; x=1722727377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CGlSTX/fxmPuMLo8lDVdRdNm7WjJ6u4DAiMF9BAUuh0=;
  b=Yilj7SqxYQHbBDnY0qunSXlHNn5gNdLpQNG55FDmRtH9lBTGYtuOymuE
   MgrCy99CJBqwj99XhKWfqrI0aBUqN3BMMF1HnuXhCwJqyNOcf1aRJGYjc
   N1mwfhNwcFqMuppld1pFrB/kqn58c4QL5h1wCP+db0WvHMarx/snFMzXh
   v33nL44/Gv/nDRw9hnnxVGx4Gf7VtcRSjCaFHYLir+7VKhHX7+U7ukoIU
   Q/kLb8LukEj8AYhUvASHHIDhWkZFqEpnycgAC1GgGeBOyM8sOImg8uY85
   GrEbLvZ9dtT6eSWoH6WZzHWRxW8PIsGZCF4DZ/4QgwBPVDbt8pcyWNF6s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="350575912"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="350575912"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 16:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="730233281"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="730233281"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 04 Aug 2023 16:22:55 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS48E-0003Br-3B;
	Fri, 04 Aug 2023 23:22:54 +0000
Date: Sat, 5 Aug 2023 07:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1413/7272]
 drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ with no
 primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)
Message-ID: <202308050722.5C6s5XDi-lkp@intel.com>
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
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdffb18b5dd8071cd25685b966f380a30b1fadaa
commit: f2ba47e65f3b5642488802a60cb7dd068f425edc [1413/7272] Input: add support for Azoteq IQS7210A/7211A/E
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: microblaze-randconfig-r064-20230805 (https://download.01.org/0day-ci/archive/20230805/202308050722.5C6s5XDi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050722.5C6s5XDi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308050722.5C6s5XDi-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/iqs7211.c:2547:9-34: WARNING: Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless it is nested IRQ)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
