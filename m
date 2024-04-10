Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462A01552EA
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Apr 2024 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712742819; cv=none; b=H16HWo3wOXb7AiMYMw8hRQD9/4OZ727PnzRQKgJZOVa44KW0V6405QslpppgOYewic5rKZSWHOh+3+5TiuxQgF+VEjx79JMI+9j9sGiVDDjj0ycIDKdJNumvWn7dkuCz7nWKp1i0oeE7dnkgpLGmsnMHwsSs3+yy5v7v3dk2geo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712742819; c=relaxed/simple;
	bh=YH10yozjloAWaYNmRKGgS/92B0CU4UkkjdTFe9KhMZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1PSzujJcu/aXZL+Ve1lTQmDtAkBthp5f8BVStZMHyj7sTzp9nAu8WQg7EzjtXGkmufDNA5RBWUZwdhbN6SlB8aZhkwVMAoraAfdINuCENQB1TyMdg1TiXPAKhKeKLYyNrQttMQhu+Tida6XOold36DcgjQ2j4E52VTw3eWCt0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Asy9Re4m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Asy9Re4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712742817; x=1744278817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YH10yozjloAWaYNmRKGgS/92B0CU4UkkjdTFe9KhMZA=;
  b=Asy9Re4m1eDsGMS1qujA2AmHVlqdAd66b0IPBI4kRtULN91Z20IHIBKs
   PJ8dlqCEr/XiCyjHdzfgikklAkc26RJ0sPfAWiDlR5ZzGVk8CxwQzfxzH
   sDWtUVqfABIPJTxir+7vWibhLgI+D3rgR0hgg34gFmAkZ2saRhfs74jZd
   FBTh5vfx3QKpdom/OqAEtA2nrjy7Ied+6HfKrHGDP163rEt3ogo+f41x6
   2lt5ylCqjVlGZsp274eqiZzGDA4uEtvjTx1o/X8KqHXANlK5kEXtqVuoQ
   I0KAMEuwnYoyU/wk4g0PK8by3MNTBTS0TZ1rtvYOhoU21In4oU27JL7GH
   g==;
X-CSE-ConnectionGUID: 7X+wxJblS8Gsjq1mqq5gDQ==
X-CSE-MsgGUID: B8XmhwTjRIiADBvmCG4yJQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11061699"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11061699"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 02:53:34 -0700
X-CSE-ConnectionGUID: 4ihoVHkPRoiMFnynWDwdWA==
X-CSE-MsgGUID: Sg5wuBGRT4eGiDL/y6qFiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20985394"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Apr 2024 02:53:33 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruUe2-0007BW-1m;
	Wed, 10 Apr 2024 09:53:30 +0000
Date: Wed, 10 Apr 2024 17:52:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4646/5042] fs/exfat/file.c:554
 exfat_extend_valid_size() error: uninitialized symbol 'err'.
Message-ID: <202404101738.kyon9qo2-lkp@intel.com>
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
TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ebf211bb11dfc004a2ff73a9de5386fa309c430
commit: 6397cc21e5c05f35a69e4aca247337a8d97cbbd4 [4646/5042] exfat: move extend valid_size into ->page_mkwrite()
:::::: branch date: 5 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20240410 (https://download.01.org/0day-ci/archive/20240410/202404101738.kyon9qo2-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404101738.kyon9qo2-lkp@intel.com/

smatch warnings:
fs/exfat/file.c:554 exfat_extend_valid_size() error: uninitialized symbol 'err'.

vim +/err +554 fs/exfat/file.c

5267456e953fd8 Sungjong Seo 2020-06-18  524  
6397cc21e5c05f Yuezhang Mo  2024-03-08  525  static int exfat_extend_valid_size(struct file *file, loff_t start, loff_t end)
11a347fb6cef62 Yuezhang Mo  2023-03-13  526  {
11a347fb6cef62 Yuezhang Mo  2023-03-13  527  	int err;
11a347fb6cef62 Yuezhang Mo  2023-03-13  528  	struct inode *inode = file_inode(file);
11a347fb6cef62 Yuezhang Mo  2023-03-13  529  	struct address_space *mapping = inode->i_mapping;
11a347fb6cef62 Yuezhang Mo  2023-03-13  530  	const struct address_space_operations *ops = mapping->a_ops;
11a347fb6cef62 Yuezhang Mo  2023-03-13  531  
11a347fb6cef62 Yuezhang Mo  2023-03-13  532  	while (start < end) {
6397cc21e5c05f Yuezhang Mo  2024-03-08  533  		u32 len;
11a347fb6cef62 Yuezhang Mo  2023-03-13  534  		struct page *page = NULL;
11a347fb6cef62 Yuezhang Mo  2023-03-13  535  
6397cc21e5c05f Yuezhang Mo  2024-03-08  536  		len = PAGE_SIZE - (start & (PAGE_SIZE - 1));
11a347fb6cef62 Yuezhang Mo  2023-03-13  537  		if (start + len > end)
11a347fb6cef62 Yuezhang Mo  2023-03-13  538  			len = end - start;
11a347fb6cef62 Yuezhang Mo  2023-03-13  539  
11a347fb6cef62 Yuezhang Mo  2023-03-13  540  		err = ops->write_begin(file, mapping, start, len, &page, NULL);
11a347fb6cef62 Yuezhang Mo  2023-03-13  541  		if (err)
11a347fb6cef62 Yuezhang Mo  2023-03-13  542  			goto out;
11a347fb6cef62 Yuezhang Mo  2023-03-13  543  
11a347fb6cef62 Yuezhang Mo  2023-03-13  544  		err = ops->write_end(file, mapping, start, len, len, page, NULL);
11a347fb6cef62 Yuezhang Mo  2023-03-13  545  		if (err < 0)
11a347fb6cef62 Yuezhang Mo  2023-03-13  546  			goto out;
11a347fb6cef62 Yuezhang Mo  2023-03-13  547  		start += len;
11a347fb6cef62 Yuezhang Mo  2023-03-13  548  
11a347fb6cef62 Yuezhang Mo  2023-03-13  549  		balance_dirty_pages_ratelimited(mapping);
11a347fb6cef62 Yuezhang Mo  2023-03-13  550  		cond_resched();
11a347fb6cef62 Yuezhang Mo  2023-03-13  551  	}
11a347fb6cef62 Yuezhang Mo  2023-03-13  552  
11a347fb6cef62 Yuezhang Mo  2023-03-13  553  out:
11a347fb6cef62 Yuezhang Mo  2023-03-13 @554  	return err;
11a347fb6cef62 Yuezhang Mo  2023-03-13  555  }
11a347fb6cef62 Yuezhang Mo  2023-03-13  556  

:::::: The code at line 554 was first introduced by commit
:::::: 11a347fb6cef62ce47e84b97c45f2b2497c7593b exfat: change to get file size from DataLength

:::::: TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
