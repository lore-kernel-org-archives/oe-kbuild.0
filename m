Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B325D83A17
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Aug 2024 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723900783; cv=none; b=TTzTkfA7VihyBV/O2FMGwmIHVkHtWxoc4TsOYWL52yV9e4mF1lBarChkDHEiw8SlEgSgd7ry9uW/gTH7FMAm54ZwzwOtsTgxkBimx5jgbqNrICvxMOv++5w/WgRtPwuxYvoWE9pCZnTD2KaDMuAp+ETYlFM6VMti5HQ7mVaYrFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723900783; c=relaxed/simple;
	bh=Y+BafNZStlO0xkNFrGqP4TLAY+qh0yWbpsiPFGjGveo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DU0b5W6RYnW2pWRPHKnzNcZUcDWpQiXtYjc24s7DjxfCOjq7lb8H9pK49hzPs1Id4qiLfnHKEzdqNNc6tRasJ1al20K+xJHTLzu4DUOkqBq2616B4JPgIpOXmlCvYwFqdtaOU5QddThp4qGLxZA4ygjucxj4ea4ZKRomaxdMC4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqRbs+bf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqRbs+bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723900781; x=1755436781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+BafNZStlO0xkNFrGqP4TLAY+qh0yWbpsiPFGjGveo=;
  b=fqRbs+bfHgWd6HmK8U3Hfv06xdDIv03W8S9mWbLMd5q6trABTSAy9cBJ
   RC6uGEHwxbLmio6/HBaoi//2uYkNtJf/gDI8+NjHxVlnzdERVBHZFZDbZ
   uCW7YZve+QCLGGtYw88E1WlVdKSm2ap+qyY5q9k05gVaUzwZPeYgD2q9V
   t33B+ycFI9+GGvGWnzVRIss+cTbZAB2deCJvWQhfP3tcQdrxJ4thcP3PB
   9lKjY713MMelqk5A6orwt/A0e/3MzDy78oKCzkPwottNq2mnR3f87c+ky
   D4cXCA7aWvdup4kVMjiXu0DJeeOKg5kA7zJttN8+vAdwQiA+dyzN+NCQZ
   Q==;
X-CSE-ConnectionGUID: dCAmhGNnS7OA/U5MIccfHA==
X-CSE-MsgGUID: bakDdR2YTpK67dG/ktJFgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="39638868"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="39638868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 06:19:41 -0700
X-CSE-ConnectionGUID: CSXyQrw7QB2igmkCg4mHhA==
X-CSE-MsgGUID: I0vQklVJSpuLhO7+JcmwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="64889852"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2024 06:19:39 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfJLE-0007UU-2S;
	Sat, 17 Aug 2024 13:19:36 +0000
Date: Sat, 17 Aug 2024 21:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rafael-pm:thermal-core-testing 14/18]
 drivers/thermal/thermal_of.c:323:3-14: ERROR: probable double put.
Message-ID: <202408172115.o4q95c8X-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git thermal-core-testing
head:   7614833c510a4fa9b8567097aac91c71d38b3fa7
commit: d67921b3a07428696ab6d91d3c027b1c7afbca85 [14/18] thermal/of: Use the .should_bind() thermal zone callback
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: i386-randconfig-053-20240817 (https://download.01.org/0day-ci/archive/20240817/202408172115.o4q95c8X-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202408172115.o4q95c8X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/thermal_of.c:323:3-14: ERROR: probable double put.

vim +323 drivers/thermal/thermal_of.c

3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  297  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  298  static bool thermal_of_should_bind(struct thermal_zone_device *tz,
d67921b3a074286 Rafael J. Wysocki 2024-07-31  299  				   const struct thermal_trip *trip,
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  300  				   struct thermal_cooling_device *cdev,
d67921b3a074286 Rafael J. Wysocki 2024-07-31  301  				   struct cooling_spec *c)
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  302  {
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  303  	struct device_node *tz_np, *cm_np, *child;
d67921b3a074286 Rafael J. Wysocki 2024-07-31  304  	bool result = false;
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  305  
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  306  	tz_np = thermal_of_zone_get_by_name(tz);
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  307  	if (IS_ERR(tz_np)) {
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  308  		pr_err("Failed to get node tz by name\n");
d67921b3a074286 Rafael J. Wysocki 2024-07-31  309  		return false;
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  310  	}
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  311  
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  312  	cm_np = of_get_child_by_name(tz_np, "cooling-maps");
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  313  	if (!cm_np)
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  314  		goto out;
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  315  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  316  	/* Look up the trip and the cdev in the cooling maps. */
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  317  	for_each_child_of_node(cm_np, child) {
d67921b3a074286 Rafael J. Wysocki 2024-07-31  318  		struct device_node *tr_np;
d67921b3a074286 Rafael J. Wysocki 2024-07-31  319  		int count, i;
d67921b3a074286 Rafael J. Wysocki 2024-07-31  320  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  321  		tr_np = of_parse_phandle(child, "trip", 0);
d67921b3a074286 Rafael J. Wysocki 2024-07-31  322  		if (tr_np != trip->priv) {
8a81cf96f5510aa Julia Lawall      2023-09-07 @323  			of_node_put(child);
d67921b3a074286 Rafael J. Wysocki 2024-07-31  324  			continue;
d67921b3a074286 Rafael J. Wysocki 2024-07-31  325  		}
d67921b3a074286 Rafael J. Wysocki 2024-07-31  326  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  327  		/* The trip has been found, look up the cdev. */
d67921b3a074286 Rafael J. Wysocki 2024-07-31  328  		count = of_count_phandle_with_args(child, "cooling-device", "#cooling-cells");
d67921b3a074286 Rafael J. Wysocki 2024-07-31  329  		if (count <= 0)
d67921b3a074286 Rafael J. Wysocki 2024-07-31  330  			pr_err("Add a cooling_device property with at least one device\n");
d67921b3a074286 Rafael J. Wysocki 2024-07-31  331  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  332  		for (i = 0; i < count; i++) {
d67921b3a074286 Rafael J. Wysocki 2024-07-31  333  			result = thermal_of_get_cooling_spec(child, i, cdev, c);
d67921b3a074286 Rafael J. Wysocki 2024-07-31  334  			if (result)
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  335  				break;
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  336  		}
d67921b3a074286 Rafael J. Wysocki 2024-07-31  337  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  338  		of_node_put(child);
d67921b3a074286 Rafael J. Wysocki 2024-07-31  339  		break;
8a81cf96f5510aa Julia Lawall      2023-09-07  340  	}
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  341  
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  342  	of_node_put(cm_np);
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  343  out:
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  344  	of_node_put(tz_np);
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  345  
d67921b3a074286 Rafael J. Wysocki 2024-07-31  346  	return result;
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  347  }
3fd6d6e2b4e80fe Daniel Lezcano    2022-08-05  348  

:::::: The code at line 323 was first introduced by commit
:::::: 8a81cf96f5510aaf9a65d103f7405079a7b0fcc5 thermal/of: add missing of_node_put()

:::::: TO: Julia Lawall <Julia.Lawall@inria.fr>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
