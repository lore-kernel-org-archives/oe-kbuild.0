Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7354438B
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735021128; cv=none; b=mmjm8ORFsfzb0Up7LjqP2Q4KZZaPmh0CShPICr0tPt9C+firHWy6qzN0a7ibeCerbMQQQ5L52aZAAJd6ADttNmEWNkJ5BaxlwSxGgOz1Cf2YJVcU7JoUv1Wo9hVywtwrCeJwFB3BS9CyMRPdHdH3sAvuHq3RmQzNV4rCNKgvbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735021128; c=relaxed/simple;
	bh=oC6UJu/PSHf32H/qm11G9PT0rkRu61dXgmssPvJhu/w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYpakixFGUt0udlsvs/9wrOM+EGm8R1bXRxKQklkmuzxm8kwtAOwrdHp9A7TzeUr1GKyXKWlHVuIO14XPB8bQoF6pQQ+3Lbbn4WxIXCfWm1K6sVz555rviSZfAZ5S3M8CUuKTKYXF47ds+MEDsy1sqD6FvdbQ4DT48/eF8JSirQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CElG3AUa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CElG3AUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735021125; x=1766557125;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oC6UJu/PSHf32H/qm11G9PT0rkRu61dXgmssPvJhu/w=;
  b=CElG3AUaQpvIgA426v9m8PmX4/Exao5+C1hhI4VI80hFDgFfjBx1EV+X
   7dQ59gt81J9m6Q9DkQlixiH1jBYHVzarUDTEoUG8e80syb9fqL9WMNUUq
   SmixF+vUNO9XSXWryDK+iH69IqcXLQL0cpOios8o5WnM0a5czxfl++Nfu
   BKNiCM2QlCPcg5JIQK8Ez1gx5LS7rcEjb7cRAe2HPcOlGA8H1zqoyaLHM
   QzZxHKocSNIh/iHZoB3fRHoDuy6ZRDIExS8R3m3jhK24F8b7qi7vti976
   C8wMIYVc362TRk4hAwGzGhai48Hbn0pj6GcAVQ7rEVKbmaspmxruvMnA/
   A==;
X-CSE-ConnectionGUID: b36xG/2SSiyf8RWwNN/Iiw==
X-CSE-MsgGUID: l8aEcKP2QXePQI+BQhyPSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46863272"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="46863272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 22:18:45 -0800
X-CSE-ConnectionGUID: 6G49jx0vRrGl9XY+fMD62A==
X-CSE-MsgGUID: mk979at7TFqmwH+AMMZqTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="99927129"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 22:18:43 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPyFd-0000ug-0i;
	Tue, 24 Dec 2024 06:18:41 +0000
Date: Tue, 24 Dec 2024 14:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [selinuxproject-selinux:pr/72 12/22]
 security/selinux/ss/conditional.c:436 cond_read_list() warn: missing unwind
 goto?
Message-ID: <202412241405.LK8YTZqp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Christian Göttsche" <cgzones@googlemail.com>

tree:   https://github.com/SELinuxProject/selinux-kernel pr/72
head:   658ac7dc269a7bc68b2040caf9953fcf2ec7d9b1
commit: 3ec5d7b95729824a7373521ca15951c852fb7125 [12/22] selinux: check length fields in policies
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: alpha-randconfig-r073-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241405.LK8YTZqp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412241405.LK8YTZqp-lkp@intel.com/

smatch warnings:
security/selinux/ss/conditional.c:436 cond_read_list() warn: missing unwind goto?

vim +436 security/selinux/ss/conditional.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  417  
006caddaada8c9 Christian Göttsche 2024-11-14  418  int cond_read_list(struct policydb *p, struct policy_file *fp)
^1da177e4c3f41 Linus Torvalds     2005-04-16  419  {
b5bf6c55edf94e Alexey Dobriyan    2005-09-03  420  	__le32 buf[1];
b5bf6c55edf94e Alexey Dobriyan    2005-09-03  421  	u32 i, len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  422  	int rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  423  
65d96351b135c2 Ethan Edwards      2020-06-24  424  	rc = next_entry(buf, fp, sizeof(buf));
5241c1074f6e2f Dan Carpenter      2010-06-12  425  	if (rc)
5241c1074f6e2f Dan Carpenter      2010-06-12  426  		return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  427  
^1da177e4c3f41 Linus Torvalds     2005-04-16  428  	len = le32_to_cpu(buf[0]);
^1da177e4c3f41 Linus Torvalds     2005-04-16  429  
3ec5d7b9572982 Christian Göttsche 2024-11-14  430  	rc = oom_check(2 * sizeof(u32), len, fp);
3ec5d7b9572982 Christian Göttsche 2024-11-14  431  	if (rc)
3ec5d7b9572982 Christian Göttsche 2024-11-14  432  		goto err;
3ec5d7b9572982 Christian Göttsche 2024-11-14  433  
60abd3181db29e Ondrej Mosnacek    2020-02-03  434  	p->cond_list = kcalloc(len, sizeof(*p->cond_list), GFP_KERNEL);
60abd3181db29e Ondrej Mosnacek    2020-02-03  435  	if (!p->cond_list)
292fed1fc89509 Wei Yongjun        2020-04-27 @436  		return -ENOMEM;
60abd3181db29e Ondrej Mosnacek    2020-02-03  437  
3232c110b56bd0 Yuichi Nakamura    2007-08-24  438  	rc = avtab_alloc(&(p->te_cond_avtab), p->te_avtab.nel);
3232c110b56bd0 Yuichi Nakamura    2007-08-24  439  	if (rc)
3232c110b56bd0 Yuichi Nakamura    2007-08-24  440  		goto err;
3232c110b56bd0 Yuichi Nakamura    2007-08-24  441  
60abd3181db29e Ondrej Mosnacek    2020-02-03  442  	p->cond_list_len = len;
^1da177e4c3f41 Linus Torvalds     2005-04-16  443  
60abd3181db29e Ondrej Mosnacek    2020-02-03  444  	for (i = 0; i < len; i++) {
60abd3181db29e Ondrej Mosnacek    2020-02-03  445  		rc = cond_read_node(p, &p->cond_list[i], fp);
5241c1074f6e2f Dan Carpenter      2010-06-12  446  		if (rc)
^1da177e4c3f41 Linus Torvalds     2005-04-16  447  			goto err;
^1da177e4c3f41 Linus Torvalds     2005-04-16  448  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  449  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  450  err:
60abd3181db29e Ondrej Mosnacek    2020-02-03  451  	cond_list_destroy(p);
5241c1074f6e2f Dan Carpenter      2010-06-12  452  	return rc;
^1da177e4c3f41 Linus Torvalds     2005-04-16  453  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  454  

:::::: The code at line 436 was first introduced by commit
:::::: 292fed1fc89509bab2c0b291d5d395dea5b6ab2f selinux: fix error return code in cond_read_list()

:::::: TO: Wei Yongjun <weiyongjun1@huawei.com>
:::::: CC: Paul Moore <paul@paul-moore.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
