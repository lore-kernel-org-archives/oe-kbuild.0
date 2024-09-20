Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7761382
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726798611; cv=none; b=oZnqyKhhfpl52QOqUKc7Xc3swS6bZWcXqqrM4MUnYcjJoqHrsWzqBbSArjCB2Cn+6fXX87eemnCqs54YM/KwtzUIATTGYvZDhU1bxYyyqWDfXOb6GhTDpYK+O+yGRaOVmpodppCRYufGyb/13QWk1tiJzfh6/9ZV4QQSBh1jtEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726798611; c=relaxed/simple;
	bh=5JwVQVE9kZoiGxTic1QG6PuA6lsYfkavmhj/yohgKBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoCZkwzjO53Y2mTZHV9tQ4k1PToBhnwne0iSzkGuZHhLyKzBg3WahPtKyRGI+OvYAm3ROaLUjLfugln0JI8xABDprflHIPZ3HuDng8Qb2DMy9pP1j9KG1Pjvyp81/WzivYHQIsDoLLwLx41xT80gTVvtGfRal6KIsu7tr3QT2vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cm//Ov2U; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cm//Ov2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726798609; x=1758334609;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5JwVQVE9kZoiGxTic1QG6PuA6lsYfkavmhj/yohgKBg=;
  b=Cm//Ov2UJYKmHk6Htgn0NdJCLbFXW2M9qP4Z3/3qVXAswwRP2By75GhT
   OfoVRAYBelpd2IynpxAzgOl76dtaSx1abMNlGADkNhPRMckniOey91Isv
   XschsdFjSgg4nvk+RLwMZadX+XKSpMcRIINfv6pg3MJq0s4My5g5TFscB
   BORof/vCaPZQgEq3kQPMvKDQLQwzCvYxXUp9snmI/BK1TwBtTnj++0WHU
   fCN7lwT7ZFW/yWuFbULPLS8ZBD5WCE2RkK+LNp02B7c9ZpU6nKGb2fDZk
   YeK78VeDElno72USQJxfhW35ei35Pp3oAk6zXr/KegJmwi2EO/oUfGF2/
   w==;
X-CSE-ConnectionGUID: uVvP3wfiTfOSxOLlwWTwHA==
X-CSE-MsgGUID: lBu7wp5aRmqeza97CGIcRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="13601906"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="13601906"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 19:16:49 -0700
X-CSE-ConnectionGUID: Kx5RGmLuQhGhIfFhDKr/mA==
X-CSE-MsgGUID: hHlsGy9qSheDuzc0yhlebA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74671058"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2024 19:16:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srTCN-000Dsj-1F;
	Fri, 20 Sep 2024 02:16:43 +0000
Date: Fri, 20 Sep 2024 10:16:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12115/12440] fs/exfat/file.c:569
 exfat_extend_valid_size() error: uninitialized symbol 'err'.
Message-ID: <202409201055.kVi9wnoh-lkp@intel.com>
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
head:   3621a2c9142bd490af0666c0c02d52d60ce0d2a5
commit: 67ca73f5ddfbc930452094c4974c6ea163b55e72 [12115/12440] exfat: move extend valid_size into ->page_mkwrite()
:::::: branch date: 20 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240919 (https://download.01.org/0day-ci/archive/20240920/202409201055.kVi9wnoh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409201055.kVi9wnoh-lkp@intel.com/

smatch warnings:
fs/exfat/file.c:569 exfat_extend_valid_size() error: uninitialized symbol 'err'.

vim +/err +569 fs/exfat/file.c

5267456e953fd8 Sungjong Seo            2020-06-18  534  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  535  static int exfat_extend_valid_size(struct file *file, loff_t new_valid_size)
11a347fb6cef62 Yuezhang Mo             2023-03-13  536  {
11a347fb6cef62 Yuezhang Mo             2023-03-13  537  	int err;
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  538  	loff_t pos;
11a347fb6cef62 Yuezhang Mo             2023-03-13  539  	struct inode *inode = file_inode(file);
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  540  	struct exfat_inode_info *ei = EXFAT_I(inode);
11a347fb6cef62 Yuezhang Mo             2023-03-13  541  	struct address_space *mapping = inode->i_mapping;
11a347fb6cef62 Yuezhang Mo             2023-03-13  542  	const struct address_space_operations *ops = mapping->a_ops;
11a347fb6cef62 Yuezhang Mo             2023-03-13  543  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  544  	pos = ei->valid_size;
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  545  	while (pos < new_valid_size) {
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  546  		u32 len;
1da86618bdce30 Matthew Wilcox (Oracle  2024-07-15  547) 		struct folio *folio;
11a347fb6cef62 Yuezhang Mo             2023-03-13  548  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  549  		len = PAGE_SIZE - (pos & (PAGE_SIZE - 1));
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  550  		if (pos + len > new_valid_size)
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  551  			len = new_valid_size - pos;
11a347fb6cef62 Yuezhang Mo             2023-03-13  552  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  553  		err = ops->write_begin(file, mapping, pos, len, &folio, NULL);
11a347fb6cef62 Yuezhang Mo             2023-03-13  554  		if (err)
11a347fb6cef62 Yuezhang Mo             2023-03-13  555  			goto out;
11a347fb6cef62 Yuezhang Mo             2023-03-13  556  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  557  		folio_zero_range(folio, offset_in_folio(folio, pos), len);
11a347fb6cef62 Yuezhang Mo             2023-03-13  558  
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  559  		err = ops->write_end(file, mapping, pos, len, len, folio, NULL);
11a347fb6cef62 Yuezhang Mo             2023-03-13  560  		if (err < 0)
11a347fb6cef62 Yuezhang Mo             2023-03-13  561  			goto out;
67ca73f5ddfbc9 Yuezhang Mo             2024-09-17  562  		pos += len;
11a347fb6cef62 Yuezhang Mo             2023-03-13  563  
11a347fb6cef62 Yuezhang Mo             2023-03-13  564  		balance_dirty_pages_ratelimited(mapping);
11a347fb6cef62 Yuezhang Mo             2023-03-13  565  		cond_resched();
11a347fb6cef62 Yuezhang Mo             2023-03-13  566  	}
11a347fb6cef62 Yuezhang Mo             2023-03-13  567  
11a347fb6cef62 Yuezhang Mo             2023-03-13  568  out:
11a347fb6cef62 Yuezhang Mo             2023-03-13 @569  	return err;
11a347fb6cef62 Yuezhang Mo             2023-03-13  570  }
11a347fb6cef62 Yuezhang Mo             2023-03-13  571  

:::::: The code at line 569 was first introduced by commit
:::::: 11a347fb6cef62ce47e84b97c45f2b2497c7593b exfat: change to get file size from DataLength

:::::: TO: Yuezhang Mo <Yuezhang.Mo@sony.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
