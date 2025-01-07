Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E737082A
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736223101; cv=none; b=Ey8v5ltnljQcQBeJ3orqiWLqOLiqJnFYj8j3W6uBljTNj33HCSS6O1jB9aj13qAziC/3G3luN5v+qTgnPaKH9RpLmkJzcUCs0XgAn/ulV+ZUiOdMDZdDr7iNY3IpCtbZNqP7Cj2iStEAuv7+l3zU8A7f7jU4lHaOun0gc/N5xrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736223101; c=relaxed/simple;
	bh=oCWvgl0FrTxADDYlLO5432QcWwStPeSfQ4Lldp4/LU0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfmHr/GrSA0BrcbuF723Yw4VnCi2KC/ws1kw/eOphyVo/6v8eHmZHwCx5sQqi0LrjOJs6ACfdU8uy9jUaSiS0c9NZi7GIOCWveuViW8K3Kv7lXsYt71mE9A8D/QnrScqyg/BB8GnvEDejP5jNMGiJ7UtmpvJQkvABhHfBy1/sOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vyv8sQfp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vyv8sQfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736223098; x=1767759098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCWvgl0FrTxADDYlLO5432QcWwStPeSfQ4Lldp4/LU0=;
  b=Vyv8sQfpKiP3OOyDLMBJqM5GtsHXJcjzajEnnYA9lBzQui9AXvJ2ORms
   0vRgYV7BJ2ybDZzDjVJoVooBODCYPXHcnkUaNWZZiPY8EItj2tul6dmrc
   gFFT9/V7MG/Wtu8tcdlXCWAhDzS+tG8XVjX5QioYH8KwUjcO1ArPfWYzS
   uP8ML1KxjIHOvbEeQmRws2m538w2bDge0J2hgb0kRQZaVdTCPEQ5QCoe/
   6pHaC3dkMSK/3K5hRoWI3UMFQjD7FqbkoiNKA3MUdfx4uxTlbZBbKSgZe
   VM/ftpmHapUk3lcdK4CGq2uHzyxxMsd9d/ieoMBWrQk/F6Fo8S2Wmrv2e
   w==;
X-CSE-ConnectionGUID: jYhPvyvxTt2CHcNLo4GOyQ==
X-CSE-MsgGUID: iYu+hgWFROaXX5amIVSHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61763365"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="61763365"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:11:38 -0800
X-CSE-ConnectionGUID: 5bNkfy3YReu+839qCwodxw==
X-CSE-MsgGUID: aj0hUvf+QZO5pRsp+AWSrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102441180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jan 2025 20:11:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV0wI-000EE9-2a;
	Tue, 07 Jan 2025 04:11:34 +0000
Date: Tue, 7 Jan 2025 12:11:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bytedance:5.15-velinux 1347/1347]
 drivers/nvme/host/qmap.c:208:8-12: ERROR: invalid reference to the index
 variable of the iterator on line 202
Message-ID: <202501071221.CmfPsaU3-lkp@intel.com>
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
commit: 6e74a414cbefd3f08ab27d0e7ee5b56afa19a7f4 [1347/1347] bytedance: nvme-qmap: modify according advise
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-103-20250107 (https://download.01.org/0day-ci/archive/20250107/202501071221.CmfPsaU3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501071221.CmfPsaU3-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/nvme/host/qmap.c:208:8-12: ERROR: invalid reference to the index variable of the iterator on line 202

vim +208 drivers/nvme/host/qmap.c

3a9b973eb8419f dingtao.darren 2024-07-08  196  
3a9b973eb8419f dingtao.darren 2024-07-08  197  struct nvme_qmap *nvme_qmap_get_qmap_from_ndev(struct nvme_dev *ndev)
3a9b973eb8419f dingtao.darren 2024-07-08  198  {
3a9b973eb8419f dingtao.darren 2024-07-08  199  	struct nvme_qmap *qmap = NULL;
3a9b973eb8419f dingtao.darren 2024-07-08  200  
6e74a414cbefd3 dingtao.darren 2024-07-16  201  	down_read(&qmap_list.list_rwsem);
6e74a414cbefd3 dingtao.darren 2024-07-16 @202  	list_for_each_entry(qmap, &qmap_list.qmap_head, qmap_entry) {
3a9b973eb8419f dingtao.darren 2024-07-08  203  		if (qmap->nvme_dev == ndev)
6e74a414cbefd3 dingtao.darren 2024-07-16  204  			break;
3a9b973eb8419f dingtao.darren 2024-07-08  205  	}
6e74a414cbefd3 dingtao.darren 2024-07-16  206  	up_read(&qmap_list.list_rwsem);
6e74a414cbefd3 dingtao.darren 2024-07-16  207  
6e74a414cbefd3 dingtao.darren 2024-07-16 @208  	return qmap;
3a9b973eb8419f dingtao.darren 2024-07-08  209  }
3a9b973eb8419f dingtao.darren 2024-07-08  210  EXPORT_SYMBOL_GPL(nvme_qmap_get_qmap_from_ndev);
3a9b973eb8419f dingtao.darren 2024-07-08  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
