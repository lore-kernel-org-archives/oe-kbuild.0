Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9781111
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Aug 2023 04:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691815324; x=1723351324;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5lNJYo/mPRm8Kw/FitdO2qY5yQGaUs8/g4YeGJNor2k=;
  b=FkKyXd60TBqBuOXx15wBVRrvcpmRCSD2DxX/eKriUYg5lVjf4CuowCoa
   iRLPuiOcwqbzPRd7DPrDQprAYAzcLWd1OU0XpfzVmdPx7MVSAQEwF9dHe
   jDQS286F7pLkWOm+HcyCZtH5ZbLEQvspDXvauooJPoNdiIa4zmFHKDvNO
   9ww1cWgqQAzDHdxLCuYlV+kFA46P8sTpOQ9VmpI8Fs4Qi0Oe7CHRh2R68
   5YfLa27eNnCX7Z97NFhKJcZ184jC+99vrzmJ0MeiSngrET56tD6iiZafm
   4batuzf1NdvKS/hxxvESV/QwmlUsLi1NfNbcCJWLu3ItQN4xPDfbMRO1M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="438136193"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="438136193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="906640212"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="906640212"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Aug 2023 21:42:02 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUgRt-0008GS-3A;
	Sat, 12 Aug 2023 04:42:01 +0000
Date: Sat, 12 Aug 2023 12:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] cgroup: cgroup: =?utf-8?Q?Remo?=
 =?utf-8?B?dmUgdW5uZWNlc3Nhcnkg4oCYMOKAmQ==?= values from ret
Message-ID: <202308121210.gvdDqjhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230813014734.2916-1-kunyu@nfschina.com>
References: <20230813014734.2916-1-kunyu@nfschina.com>
TO: Li kunyu <kunyu@nfschina.com>
TO: tj@kernel.org
TO: lizefan.x@bytedance.com
TO: hannes@cmpxchg.org
CC: cgroups@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Li kunyu <kunyu@nfschina.com>

Hi Li,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.5-rc5]
[also build test WARNING on linus/master next-20230809]
[cannot apply to tj-cgroup/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/cgroup-cgroup-Remove-unnecessary-0-values-from-ret/20230811-171814
base:   v6.5-rc5
patch link:    https://lore.kernel.org/r/20230813014734.2916-1-kunyu%40nfschina.com
patch subject: [PATCH] cgroup: cgroup: Remove unnecessary ‘0’ values from ret
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-m021-20230812 (https://download.01.org/0day-ci/archive/20230812/202308121210.gvdDqjhF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308121210.gvdDqjhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308121210.gvdDqjhF-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:7000 delegate_show() error: uninitialized symbol 'ret'.

vim +/ret +7000 kernel/cgroup/cgroup.c

01ee6cfb1483fe Roman Gushchin 2017-11-06  6992  
01ee6cfb1483fe Roman Gushchin 2017-11-06  6993  static ssize_t delegate_show(struct kobject *kobj, struct kobj_attribute *attr,
01ee6cfb1483fe Roman Gushchin 2017-11-06  6994  			      char *buf)
01ee6cfb1483fe Roman Gushchin 2017-11-06  6995  {
01ee6cfb1483fe Roman Gushchin 2017-11-06  6996  	struct cgroup_subsys *ss;
01ee6cfb1483fe Roman Gushchin 2017-11-06  6997  	int ssid;
3d7f13682faf54 Li kunyu       2023-08-13  6998  	ssize_t ret;
01ee6cfb1483fe Roman Gushchin 2017-11-06  6999  
8a693f7766f9e2 Tejun Heo      2022-09-06 @7000  	ret = show_delegatable_files(cgroup_base_files, buf + ret,
8a693f7766f9e2 Tejun Heo      2022-09-06  7001  				     PAGE_SIZE - ret, NULL);
8a693f7766f9e2 Tejun Heo      2022-09-06  7002  	if (cgroup_psi_enabled())
8a693f7766f9e2 Tejun Heo      2022-09-06  7003  		ret += show_delegatable_files(cgroup_psi_files, buf + ret,
8a693f7766f9e2 Tejun Heo      2022-09-06  7004  					      PAGE_SIZE - ret, NULL);
01ee6cfb1483fe Roman Gushchin 2017-11-06  7005  
01ee6cfb1483fe Roman Gushchin 2017-11-06  7006  	for_each_subsys(ss, ssid)
01ee6cfb1483fe Roman Gushchin 2017-11-06  7007  		ret += show_delegatable_files(ss->dfl_cftypes, buf + ret,
01ee6cfb1483fe Roman Gushchin 2017-11-06  7008  					      PAGE_SIZE - ret,
01ee6cfb1483fe Roman Gushchin 2017-11-06  7009  					      cgroup_subsys_name[ssid]);
01ee6cfb1483fe Roman Gushchin 2017-11-06  7010  
01ee6cfb1483fe Roman Gushchin 2017-11-06  7011  	return ret;
01ee6cfb1483fe Roman Gushchin 2017-11-06  7012  }
01ee6cfb1483fe Roman Gushchin 2017-11-06  7013  static struct kobj_attribute cgroup_delegate_attr = __ATTR_RO(delegate);
01ee6cfb1483fe Roman Gushchin 2017-11-06  7014  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
