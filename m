Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF713CF049
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Aug 2026 14:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718448; cv=none; b=ae50J401GJR38Qvx5DP+KQOsOpO7rIXPCO29U+T80Q5tBenYuCJiE3MQA0cddNRxI1unjwlp7OWpEENyCMBI/Ww/XzsoqzvCtVSXdC+pKvIuJ2z+rQfzCcZq/fwN3Mnr3TtKIwAgksvGPtWpfH07hgRYwd4ipbhFnFGHvLMKHEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718448; c=relaxed/simple;
	bh=RCrSbrHq+ZHJ9gb5oc2Zh0oFsbsWkjexjGW9yK2VhKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IOmYwjBDk/qI8W6h492mwPdhEERkvHta5nFEsiSC4CekLDb7e79HY4ZPWvkVUxKpXG9qHHoc4kNLxYMSJcAL161L7sOGnWvCuKJ9wzMdwT2Jk5tr0GKTkCnwBitzX16KbyACLHR6O6YUXRg4nXjrhlydJ246TuvE0eTGdRoO1Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ekr8f2Th; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ekr8f2Th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786718445; x=1818254445;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCrSbrHq+ZHJ9gb5oc2Zh0oFsbsWkjexjGW9yK2VhKw=;
  b=ekr8f2ThCs0JVO71/rm8O/8O+ejqjxgQkRfDXvQ7NIpD0g6bQvrcLCP6
   D1v2RVc/ukxLCHxZBFNglAKkF1Vs95jIQKYzICeM0Eem9h9pZL7UjHgOW
   H4hex4EpF+5AQFj21xvtPqHK4SD9jHousRgg+PWh6dMo7n4mOE45+OP5n
   ypxsGKH0koHomyDAltAt9aAQXBBsP0iG3q95xXeBI8Nv6kihd9kZP03AS
   NbpLYi6jnz9dNazPHHZo9W4mcwEBditPyWKWTtGy9J23QAkgj4KnEAj9H
   APS5Nnxj0w69DHED1i+Wh5krPddywEThOukA3+qtwwXFxoEH8rKAjjDWs
   w==;
X-CSE-ConnectionGUID: poPk3A6CQN2OVg0Ajxxr0A==
X-CSE-MsgGUID: 4Ezg+5R6TMunK9m/5672LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="89816305"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="89816305"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:40:43 -0700
X-CSE-ConnectionGUID: SUFyUt+IQUOqyBTzKWpL5A==
X-CSE-MsgGUID: 85c0FFF7RfGNJGTQ75rZWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262910410"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2026 07:40:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wut5M-000000006HR-1nxh;
	Fri, 14 Aug 2026 14:40:40 +0000
Date: Fri, 14 Aug 2026 16:39:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests/lsm: Fix memory leak in attr_lsm_count
Message-ID: <202608141615.Tzt1LAcx-lkp@intel.com>
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
In-Reply-To: <20260703025247.940055-1-wangyan01@kylinos.cn>
References: <20260703025247.940055-1-wangyan01@kylinos.cn>
TO: Wang Yan <wangyan01@kylinos.cn>
TO: linux-security-module@vger.kernel.org
CC: paul@paul-moore.com
CC: jmorris@namei.org
CC: serge@hallyn.com
CC: shuah@kernel.org
CC: casey@schaufler-ca.com
CC: mic@digikod.net
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Wang Yan <wangyan01@kylinos.cn>

Hi Wang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes pcmoore-selinux/next linus/master v7.2-rc7]
[cannot apply to next-20260813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wang-Yan/selftests-lsm-Fix-memory-leak-in-attr_lsm_count/20260807-191039
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20260703025247.940055-1-wangyan01%40kylinos.cn
patch subject: [PATCH] selftests/lsm: Fix memory leak in attr_lsm_count
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260814/202608141615.Tzt1LAcx-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141615.Tzt1LAcx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608141615.Tzt1LAcx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   common.c: In function 'attr_lsm_count':
>> common.c:78:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
      78 |         if (read_sysfs_lsms(names, sysconf(_SC_PAGESIZE)))
         |         ^~
   common.c:80:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
      80 |                 return 0;
         |                 ^~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
