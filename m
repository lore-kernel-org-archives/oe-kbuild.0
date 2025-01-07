Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5BA259498
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736214276; cv=none; b=RoEG0WfuVeFEYHozFeDk544MvrOj60AQGiToPmz9gr4ldggVKJuEOitzz4eMCL/DNmzKXcv7Ivaqn8r2XX+QsETYj4N7V3Me28z30kTosMOemgq2eHVUYxziQFePSJwBX+zfEk+vXhqimBls5s9qequwOovTbal9bOQFLopqVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736214276; c=relaxed/simple;
	bh=RcUWzuBeEUoNOqn/EEaaqT8YeE/VZe5/43ulKciy9u8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CeKBRC4QUf5FZcGXkvugKcYeOD1kXiG9Mdyd3VotG4Vz8EbB/Lw6v20Ki9yF7x84LWnF4hfBDYlp03ZJ6rooxMGJdybcfD7xrbVKm7YOoaBEn4nHttpH9NqufiRr7vvLd4hlgw0s1shXt52aSSCP+DXSp7kXeOC2IceSxLaj9r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwdZfsMv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwdZfsMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736214274; x=1767750274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RcUWzuBeEUoNOqn/EEaaqT8YeE/VZe5/43ulKciy9u8=;
  b=DwdZfsMv4m2ZKUoZjh5r/G+b5d3jvCSqB2u9hx8M6e0haIntokaUOLFu
   ZePX3niTWb3MnUUMWwu4BmZtB4/JxtHq1QazvmsPeXsXO/oFgcPE66b6S
   ESYGKBtIcKu32hjqa5rxh5GB+eI5YBhOs+MCX5NVEIUgtdHwXwXw9xo+S
   ExzvsTSAhiXaYEEW1inBUhMqdPevA9xUmPkY7RzZfhCltB9JZt8wAfN0A
   t27Pir6r2IrLHbZ+q2572KMLaCNATzxVYvL7dTqN0YSAVBY8KYcBx5MhB
   1EIGNWqF9Izq+a0vupLsm+Ez9C7qNKH9vU8i1XSjTzvAMTDjDTs1BKcGF
   Q==;
X-CSE-ConnectionGUID: 2bN8uSgoS2+Iof2gm3PpFA==
X-CSE-MsgGUID: 3RT0A2fXTK+LlebxDzo3+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36537754"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="36537754"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 17:44:33 -0800
X-CSE-ConnectionGUID: lDZ3OLGVQX+TTUbsYc5fHA==
X-CSE-MsgGUID: ve0inYtzS6SqOukmpUHqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103116038"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Jan 2025 17:44:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUydx-000E6J-3A;
	Tue, 07 Jan 2025 01:44:29 +0000
Date: Tue, 7 Jan 2025 09:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bytedance:5.15-velinux 1347/1347]
 drivers/nvme/host/qmap.c:303:5-12: WARNING: Unsigned expression compared
 with zero: timeout <= 0
Message-ID: <202501070902.iXCpGKJX-lkp@intel.com>
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
TO: jason.zeng@intel.com
TO: lin.x.wang@intel.com
TO: pei.p.jia@intel.com

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 3a9b973eb8419fe1dad8585ceb7d4ab6cdcf8da0 [1347/1347] bytedance: nvme: Introduce nvme qmap
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-103-20250107 (https://download.01.org/0day-ci/archive/20250107/202501070902.iXCpGKJX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501070902.iXCpGKJX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/qmap.c:303:5-12: WARNING: Unsigned expression compared with zero: timeout <= 0

vim +303 drivers/nvme/host/qmap.c

3a9b973eb8419f dingtao.darren 2024-07-08  298  
3a9b973eb8419f dingtao.darren 2024-07-08  299  static int nvme_qmap_do_cease_io(struct nvme_ctrl *ctrl, unsigned long timeout)
3a9b973eb8419f dingtao.darren 2024-07-08  300  {
3a9b973eb8419f dingtao.darren 2024-07-08  301  	nvme_start_freeze(ctrl);
3a9b973eb8419f dingtao.darren 2024-07-08  302  	timeout = nvme_wait_freeze_timeout(ctrl, timeout);
3a9b973eb8419f dingtao.darren 2024-07-08 @303  	if (timeout <= 0)
3a9b973eb8419f dingtao.darren 2024-07-08  304  		return -ETIME;
3a9b973eb8419f dingtao.darren 2024-07-08  305  
3a9b973eb8419f dingtao.darren 2024-07-08  306  	/* wait all hw queue dispatch finished */
3a9b973eb8419f dingtao.darren 2024-07-08  307  	nvme_stop_queues(ctrl);
3a9b973eb8419f dingtao.darren 2024-07-08  308  
3a9b973eb8419f dingtao.darren 2024-07-08  309  	/* wait all request completed from blk layer
3a9b973eb8419f dingtao.darren 2024-07-08  310  	 * work like blk_mq_tagset_wait_completed_request
3a9b973eb8419f dingtao.darren 2024-07-08  311  	 */
3a9b973eb8419f dingtao.darren 2024-07-08  312  	return nvme_qmap_wait_mq_completed_timeout(ctrl->tagset, timeout);
3a9b973eb8419f dingtao.darren 2024-07-08  313  }
3a9b973eb8419f dingtao.darren 2024-07-08  314  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
