Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2313C1F80C4
	for <oe-kbuild@lists.linux.dev>; Tue,  5 Nov 2024 22:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847295; cv=none; b=J5/1ypp0hGqOH2nP5wfRkiHaEAtIp8+TgzTeLMfLyyQtg2LA4AdhRWo3rrxjvA6c/+K0fa4DAG4gS4xS7E3A9ldCoGHY91Q3OX5ZOJb4UtVZbzJ3CGsgSe5h2bda9E+eChL2bqc9hqcPS7ZvIvTE/deTsvUM2SkX9HBhJhySG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847295; c=relaxed/simple;
	bh=iXcir121rUCd/Uoc/lsup0A692k2N4U8iIm0o7uuirM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZW7uQmhk4C2Vp6XIL2cBW6qmMGTFFzTJ3/6XiFuQN6ixXWvaddqyHHqyloLehHx6o3myY0eLusUxnp5+UAD9pKQw5GpqnYLOLgyyyO5ws/jPR7TQntXNsG6smv9LnnkXeUec3GrynUhXlbpc7GtIL/q9Hb0FlYy7oP3iCCbe4iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K8XjgRCb; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K8XjgRCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730847293; x=1762383293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXcir121rUCd/Uoc/lsup0A692k2N4U8iIm0o7uuirM=;
  b=K8XjgRCbRP2CXI/5hxwO7b0CYe1B/aNhqPQenoL/uyR2Lh1XwkDXLIlU
   WugUjUCJ78legBPUX5qBBQBsWLuzQTtXZGHHZYUJu4Li2/AV5C4VOBgHn
   5+ZB8LT8mleEdkxB6AQ7zM3XyQf2GvLcOFmKeK6UWJYWUD4jlkTPyrH/4
   Z8ZdQewgMCo6p1At5PZbmqW4BG/+ZzFzIJxQZrvoohhPd32NVSxEiLw1z
   wRukqD1Ho8Bj6MT1oo6iXoBlGW4zieZSYduwRwkuJxfXtDGb+k/JiF/Ie
   cvRp9R44UzAaRDac6b3Bfx5dbbD0rkp9cCrvVSiFP9kAm5tRPdWyW03MA
   A==;
X-CSE-ConnectionGUID: 1FJALLIHTbeuM0jfuxkZmg==
X-CSE-MsgGUID: HSOrKQSRSAadU6Gk85Ejuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="56022803"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="56022803"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 14:54:52 -0800
X-CSE-ConnectionGUID: 2GF5lGk4SnmFRs/NueiXBg==
X-CSE-MsgGUID: AWNZvf3VQQaWpGzcDayKmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="121698465"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Nov 2024 14:54:51 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8SRk-000mYB-2w;
	Tue, 05 Nov 2024 22:54:48 +0000
Date: Wed, 6 Nov 2024 06:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2284/2284] drivers/gpu/drm/ast/ast_mm.c:116
 ast_pci_host_is_5c01() error: we previously assumed 'child' could be null
 (see line 109)
Message-ID: <202411060612.GYmwZx1k-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jiakun Shuai <shuaijiakun1288@phytium.com.cn>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f705e909a01ee9ae75542457ca95b055dae177a0
commit: 968ee436e4d0ce09994f74015dc163ef280ccc1e [2284/2284] drm/ast: Fixed display error for ps23xx when using ast bmc card
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241106/202411060612.GYmwZx1k-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411060612.GYmwZx1k-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/ast/ast_mm.c:116 ast_pci_host_is_5c01() error: we previously assumed 'child' could be null (see line 109)

vim +/child +116 drivers/gpu/drm/ast/ast_mm.c

968ee436e4d0ce Jiakun Shuai 2024-05-14  103  
968ee436e4d0ce Jiakun Shuai 2024-05-14  104  static bool ast_pci_host_is_5c01(struct pci_bus *bus)
968ee436e4d0ce Jiakun Shuai 2024-05-14  105  {
968ee436e4d0ce Jiakun Shuai 2024-05-14  106  	struct pci_bus *child = bus;
968ee436e4d0ce Jiakun Shuai 2024-05-14  107  	struct pci_dev *root = NULL;
968ee436e4d0ce Jiakun Shuai 2024-05-14  108  
968ee436e4d0ce Jiakun Shuai 2024-05-14 @109  	while (child) {
968ee436e4d0ce Jiakun Shuai 2024-05-14  110  		if (child->parent->parent)
968ee436e4d0ce Jiakun Shuai 2024-05-14  111  			child = child->parent;
968ee436e4d0ce Jiakun Shuai 2024-05-14  112  		else
968ee436e4d0ce Jiakun Shuai 2024-05-14  113  			break;
968ee436e4d0ce Jiakun Shuai 2024-05-14  114  	}
968ee436e4d0ce Jiakun Shuai 2024-05-14  115  
968ee436e4d0ce Jiakun Shuai 2024-05-14 @116  	root = child->self;
968ee436e4d0ce Jiakun Shuai 2024-05-14  117  
968ee436e4d0ce Jiakun Shuai 2024-05-14  118  	if ((root->vendor == 0x1db7) && (root->device == 0x5c01))
968ee436e4d0ce Jiakun Shuai 2024-05-14  119  		return true;
968ee436e4d0ce Jiakun Shuai 2024-05-14  120  	return false;
968ee436e4d0ce Jiakun Shuai 2024-05-14  121  }
968ee436e4d0ce Jiakun Shuai 2024-05-14  122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
