Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACE854765
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Jan 2025 22:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737413953; cv=none; b=c6FQ0/OsjG9b7HAk3OC6pdP125hJl/C7nFdLLbAedUEVKvgFJ7d/XQ7vZ0trNYLe5XA+qcxOONSldu4pQOY4JyoCmGRYWjoVZe3JiECZ6qYv7BsWl5TlMtT/m40XXU4pLwkyBqNEf+a15dU6M5L31SQIps6dpGQoUT+f2x34EMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737413953; c=relaxed/simple;
	bh=jW3RnjYRKhgqVGRJLePF42Ed2x5XJc7RKAeVz0Hd6ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=coj1G7OSbzZ9ntq1YtRhqLxHcVoATt+2cp/t1vYGKcoWW2ket3x2U12b7mnQXN35fJYexEcZMNN/j46dG1FSrmlgOxH9H979YpmPC+vpkxfVe6h2sFT3vUJ05T4aXmxS7ZoXT5pE41xjPvx/KnXTdWj7/MD5SlMy3TXtBfRZfaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=arPDIApZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="arPDIApZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737413952; x=1768949952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jW3RnjYRKhgqVGRJLePF42Ed2x5XJc7RKAeVz0Hd6ng=;
  b=arPDIApZ6rsD3GyTLv07twYcPjvuUp9VchDE1e2/YVMglvHgbzIPfNX8
   aovo2xnq+L9H3fNFl+3+cJ8kPe91GsTD95ICqKT+SU5peDrVZYNH4P/rC
   JOWJNdde1WHcAhoJ5xd3ccPVhhJQFMbTZ1cUrjOZ7vaOJLFdEJZUk4y1m
   TRynldVRFZbRLMeXk/IneZ5uDg6JyxVPP1CsSueLwqnsu2tUcCt6a7VlS
   nKx58H3sDT7P7KQY50rGaDkM9ieak/onkVOpXk/mcn9si9poHyTyagCHL
   Gm6hPR72zGOm4Bb1lpngb6ii9SkoETlX23Y3Kw0kBJz9oCgcowBQ7Knqq
   g==;
X-CSE-ConnectionGUID: eRAuanqXTBGELGub+mo/tQ==
X-CSE-MsgGUID: HHVFBrqKQFmi0TXP9PptkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48405425"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="48405425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 14:59:11 -0800
X-CSE-ConnectionGUID: /lG1wPJxQCiV/j58+rwaxw==
X-CSE-MsgGUID: DDe1g5+VTNaXKgeBmbIHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111262164"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jan 2025 14:59:10 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta0jb-000XK7-1Y;
	Mon, 20 Jan 2025 22:59:07 +0000
Date: Tue, 21 Jan 2025 06:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9665/10024] drivers/mtd/ubi/cdev.c:871
 ubi_get_ec_info() warn: potential spectre issue 'ubi->lookuptbl' [r]
Message-ID: <202501210618.kl2ErUR7-lkp@intel.com>
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
TO: Rickard Andersson <rickard.andersson@axis.com>
CC: Richard Weinberger <richard@nod.at>
CC: Zhihao Cheng <chengzhihao1@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1573c8d4cb206a2d1454ff711e79f8df2353290b
commit: 01099f635a4c68b8574d350a972ba062dd5142e9 [9665/10024] ubi: Implement ioctl for detailed erase counters
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250120 (https://download.01.org/0day-ci/archive/20250121/202501210618.kl2ErUR7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501210618.kl2ErUR7-lkp@intel.com/

smatch warnings:
drivers/mtd/ubi/cdev.c:871 ubi_get_ec_info() warn: potential spectre issue 'ubi->lookuptbl' [r]
drivers/mtd/ubi/cdev.c:872 ubi_get_ec_info() warn: possible spectre second half.  'wl'

vim +871 drivers/mtd/ubi/cdev.c

f40ac9cdf69912 Artem Bityutskiy  2008-07-13  830  
01099f635a4c68 Rickard Andersson 2024-12-16  831  static int ubi_get_ec_info(struct ubi_device *ubi, struct ubi_ecinfo_req __user *ureq)
01099f635a4c68 Rickard Andersson 2024-12-16  832  {
01099f635a4c68 Rickard Andersson 2024-12-16  833  	struct ubi_ecinfo_req req;
01099f635a4c68 Rickard Andersson 2024-12-16  834  	struct ubi_wl_entry *wl;
01099f635a4c68 Rickard Andersson 2024-12-16  835  	int read_cnt;
01099f635a4c68 Rickard Andersson 2024-12-16  836  	int peb;
01099f635a4c68 Rickard Andersson 2024-12-16  837  	int end_peb;
01099f635a4c68 Rickard Andersson 2024-12-16  838  
01099f635a4c68 Rickard Andersson 2024-12-16  839  	/* Copy the input arguments */
01099f635a4c68 Rickard Andersson 2024-12-16  840  	if (copy_from_user(&req, ureq, sizeof(struct ubi_ecinfo_req)))
01099f635a4c68 Rickard Andersson 2024-12-16  841  		return -EFAULT;
01099f635a4c68 Rickard Andersson 2024-12-16  842  
01099f635a4c68 Rickard Andersson 2024-12-16  843  	/* Check input arguments */
01099f635a4c68 Rickard Andersson 2024-12-16  844  	if (req.length <= 0 || req.start < 0 || req.start >= ubi->peb_count)
01099f635a4c68 Rickard Andersson 2024-12-16  845  		return -EINVAL;
01099f635a4c68 Rickard Andersson 2024-12-16  846  
01099f635a4c68 Rickard Andersson 2024-12-16  847  	if (check_add_overflow(req.start, req.length, &end_peb))
01099f635a4c68 Rickard Andersson 2024-12-16  848  		return -EINVAL;
01099f635a4c68 Rickard Andersson 2024-12-16  849  
01099f635a4c68 Rickard Andersson 2024-12-16  850  	if (end_peb > ubi->peb_count)
01099f635a4c68 Rickard Andersson 2024-12-16  851  		end_peb = ubi->peb_count;
01099f635a4c68 Rickard Andersson 2024-12-16  852  
01099f635a4c68 Rickard Andersson 2024-12-16  853  	/* Check access rights before filling erase_counters array */
01099f635a4c68 Rickard Andersson 2024-12-16  854  	if (!access_ok(ureq->erase_counters, (end_peb-req.start) * sizeof(int32_t)))
01099f635a4c68 Rickard Andersson 2024-12-16  855  		return -EFAULT;
01099f635a4c68 Rickard Andersson 2024-12-16  856  
01099f635a4c68 Rickard Andersson 2024-12-16  857  	/* Fill erase counter array */
01099f635a4c68 Rickard Andersson 2024-12-16  858  	read_cnt = 0;
01099f635a4c68 Rickard Andersson 2024-12-16  859  	for (peb = req.start; peb < end_peb; read_cnt++, peb++) {
01099f635a4c68 Rickard Andersson 2024-12-16  860  		int ec;
01099f635a4c68 Rickard Andersson 2024-12-16  861  
01099f635a4c68 Rickard Andersson 2024-12-16  862  		if (ubi_io_is_bad(ubi, peb)) {
01099f635a4c68 Rickard Andersson 2024-12-16  863  			if (__put_user(UBI_UNKNOWN, ureq->erase_counters+read_cnt))
01099f635a4c68 Rickard Andersson 2024-12-16  864  				return -EFAULT;
01099f635a4c68 Rickard Andersson 2024-12-16  865  
01099f635a4c68 Rickard Andersson 2024-12-16  866  			continue;
01099f635a4c68 Rickard Andersson 2024-12-16  867  		}
01099f635a4c68 Rickard Andersson 2024-12-16  868  
01099f635a4c68 Rickard Andersson 2024-12-16  869  		spin_lock(&ubi->wl_lock);
01099f635a4c68 Rickard Andersson 2024-12-16  870  
01099f635a4c68 Rickard Andersson 2024-12-16 @871  		wl = ubi->lookuptbl[peb];
01099f635a4c68 Rickard Andersson 2024-12-16 @872  		if (wl)
01099f635a4c68 Rickard Andersson 2024-12-16  873  			ec = wl->ec;
01099f635a4c68 Rickard Andersson 2024-12-16  874  		else
01099f635a4c68 Rickard Andersson 2024-12-16  875  			ec = UBI_UNKNOWN;
01099f635a4c68 Rickard Andersson 2024-12-16  876  
01099f635a4c68 Rickard Andersson 2024-12-16  877  		spin_unlock(&ubi->wl_lock);
01099f635a4c68 Rickard Andersson 2024-12-16  878  
01099f635a4c68 Rickard Andersson 2024-12-16  879  		if (__put_user(ec, ureq->erase_counters+read_cnt))
01099f635a4c68 Rickard Andersson 2024-12-16  880  			return -EFAULT;
01099f635a4c68 Rickard Andersson 2024-12-16  881  
01099f635a4c68 Rickard Andersson 2024-12-16  882  	}
01099f635a4c68 Rickard Andersson 2024-12-16  883  
01099f635a4c68 Rickard Andersson 2024-12-16  884  	/* Return actual read length */
01099f635a4c68 Rickard Andersson 2024-12-16  885  	req.read_length = read_cnt;
01099f635a4c68 Rickard Andersson 2024-12-16  886  
01099f635a4c68 Rickard Andersson 2024-12-16  887  	/* Copy everything except erase counter array */
01099f635a4c68 Rickard Andersson 2024-12-16  888  	if (copy_to_user(ureq, &req, sizeof(struct ubi_ecinfo_req)))
01099f635a4c68 Rickard Andersson 2024-12-16  889  		return -EFAULT;
01099f635a4c68 Rickard Andersson 2024-12-16  890  
01099f635a4c68 Rickard Andersson 2024-12-16  891  	return 0;
01099f635a4c68 Rickard Andersson 2024-12-16  892  }
01099f635a4c68 Rickard Andersson 2024-12-16  893  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
