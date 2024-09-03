Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B3615667D
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 15:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375921; cv=none; b=HEgwFDxkDiP61QoOS2kAEG/W/1UCDiktwJBzs42lMYdsjhttgu8pR2G7QfsnBY7XOpHe+SOVlINib4sJ8JTmkgwRKKBIL4eWeKVSoow1UIk8OAFCN3IRSE29MevsXox5xFjmgEG+jd6q/gND4mfLjedv/wrlfUDaH3KayCW/Ork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375921; c=relaxed/simple;
	bh=s3W06DgAQNnZIMdj/SroTvaUWLpa1OwP66EZO2lTf5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=avzf3KGymBkQgSm5L1qD37npyGW8yLNzryPoBh2ce8EDngLwG9XR7uduPwQekxJO96fWDURYd2WuAvJpj8+Hq56TbaOWPOAhqupurGQNyoaHGsHzpryH56c0FzQ7X3QgrPjjzmZCsOmAvyJkMNR5yr2EqRRRI6TMwztz75iwP+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n1tcJUyU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n1tcJUyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725375919; x=1756911919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3W06DgAQNnZIMdj/SroTvaUWLpa1OwP66EZO2lTf5w=;
  b=n1tcJUyUE/yqWfci5Bz5udve9IYwh7wasI6tU4BoTJqXC9Vfjcaea4h1
   eIlPHbVespQPmSoi3S5KqanJEzCHTwcsoAtQjY3pFy/3B9ZzqHMSjOBeB
   esnot3XEwu/kB/zEcPKOWSN0oKu5JTnvxZtnYSLMkzqOwweDx7oWDtp3J
   MZyd9C1v9zc4wm/qF8VmJAOLrGKxGL1O+CyGPtSYDJISXgZtGvzQAq43r
   2ew3ByQVyIG2EyLmmV/UXws8hAd/DyJIlMhe9BpmNtsUn0HJvRWnznpIC
   it4zmNVEUVzIkXgfknGYqjxolkkqu/lG/GrLnRyKuUH8dlR4a9ZnVXKr0
   Q==;
X-CSE-ConnectionGUID: AuYDtKxUS4qm9Ies/lFX4w==
X-CSE-MsgGUID: Kz02F8+hS1a3T/ZdmrymAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="49388703"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="49388703"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:05:14 -0700
X-CSE-ConnectionGUID: yPcWAfqDR0++NZUbd0jTmw==
X-CSE-MsgGUID: vFA+TAgZTcWymjD9joFDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="64615660"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Sep 2024 08:05:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slV5j-0006pG-0A;
	Tue, 03 Sep 2024 15:05:11 +0000
Date: Tue, 3 Sep 2024 23:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8573/8795] drivers/block/zram/zram_drv.c:1060
 algorithm_params_store() warn: error code type promoted to positive: 'prio'
Message-ID: <202409032256.TNyZLI44-lkp@intel.com>
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
TO: Sergey Senozhatsky <senozhatsky@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: 69e43cdcd6910aafdc8d0ad39f298c9c2764b00a [8573/8795] zram: introduce algorithm_params device attribute
:::::: branch date: 8 hours ago
:::::: commit date: 15 hours ago
config: i386-randconfig-141-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032256.TNyZLI44-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409032256.TNyZLI44-lkp@intel.com/

smatch warnings:
drivers/block/zram/zram_drv.c:1060 algorithm_params_store() warn: error code type promoted to positive: 'prio'

vim +/prio +1060 drivers/block/zram/zram_drv.c

69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1006  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1007  static ssize_t algorithm_params_store(struct device *dev,
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1008  				      struct device_attribute *attr,
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1009  				      const char *buf,
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1010  				      size_t len)
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1011  {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1012  	s32 prio = ZRAM_PRIMARY_COMP, level = ZCOMP_PARAM_NO_LEVEL;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1013  	char *args, *param, *val, *algo = NULL;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1014  	struct zram *zram = dev_to_zram(dev);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1015  	int ret;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1016  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1017  	args = skip_spaces(buf);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1018  	while (*args) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1019  		args = next_arg(args, &param, &val);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1020  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1021  		if (!val || !*val)
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1022  			return -EINVAL;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1023  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1024  		if (!strcmp(param, "priority")) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1025  			ret = kstrtoint(val, 10, &prio);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1026  			if (ret)
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1027  				return ret;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1028  			continue;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1029  		}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1030  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1031  		if (!strcmp(param, "level")) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1032  			ret = kstrtoint(val, 10, &level);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1033  			if (ret)
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1034  				return ret;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1035  			continue;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1036  		}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1037  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1038  		if (!strcmp(param, "algo")) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1039  			algo = val;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1040  			continue;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1041  		}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1042  	}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1043  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1044  	/* Lookup priority by algorithm name */
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1045  	if (algo) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1046  		s32 p;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1047  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1048  		prio = -EINVAL;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1049  		for (p = ZRAM_PRIMARY_COMP; p < ZRAM_MAX_COMPS; p++) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1050  			if (!zram->comp_algs[p])
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1051  				continue;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1052  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1053  			if (!strcmp(zram->comp_algs[p], algo)) {
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1054  				prio = p;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1055  				break;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1056  			}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1057  		}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1058  	}
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1059  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02 @1060  	if (prio < ZRAM_PRIMARY_COMP || prio >= ZRAM_MAX_COMPS)
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1061  		return -EINVAL;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1062  
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1063  	ret = comp_params_store(zram, prio, level);
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1064  	return ret ? ret : len;
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1065  }
69e43cdcd6910aa Sergey Senozhatsky 2024-09-02  1066  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
