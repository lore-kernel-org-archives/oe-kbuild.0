Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFC3DB620
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963413; cv=none; b=etwm7O2HauGTTaVE1lgODDTilJZ6IHoP+PwNEjXx+GIqzAN35TJ1v/jTjOvH8xXAZBrlY95LTwl0Mpm3dSIelGsKFCdf2MxE/esOHZdmhpWcPETqXZBzbxJ2R+bdUnVs73SoCBs4vHXVuwRrzj3BGq88w7nVYM8O6Q04gn+bR7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963413; c=relaxed/simple;
	bh=38MRrrTvCzwWnWPJwHFtrdr3BVgEf16t70er+LGt1ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ao/Y+LwI7YUHavSbE1nA9R0o/emn0gBiP4Hr4GfU9XTK4dyTyrbBM441QstTh7NTYMtLH4t+8llXHFM1JTJeqPTS4Em7AKso/2jEJWx1vOsl4YD9do++TGqoE3dzb0NCPe8mBH6Vm1QDqhP95JsvPnYnf7HBv+7ijFlyrieJwD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QL0eXjx6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QL0eXjx6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785963410; x=1817499410;
  h=date:from:to:cc:subject:message-id;
  bh=38MRrrTvCzwWnWPJwHFtrdr3BVgEf16t70er+LGt1ng=;
  b=QL0eXjx6VOy/L+4Y5dOkLv66ZV1jNso6irIPucMyw7bW3B1cmQoD41pq
   RdKfQVJ+V7CgDtRqHGGvAUAK2Gdm5MXjoXyHvxjlAI7PBmzyMZ0cxondj
   USHqCT7RviKeGJVmpJeTdfvageF7q1xQ6uJgT658s9upo3ZYIp/tGBD6c
   B6gAjFDfUqE1k9kLmEKqhYweceBklaGUdIIGKSgI5OXxgL2kddbI/LAkn
   vNKmJa5woDjc2cn+df2UnAsGGCdhlBj1GiG7Sz7CLtG/6fMbQuU4+bME8
   KgURznIs1BOkzKwYvu8838ee+yXuNY09BWXUA6AHNKINY+w6rqwZqrW5v
   g==;
X-CSE-ConnectionGUID: zkiPi5toRam4/jnQTP8n7A==
X-CSE-MsgGUID: OevmZMjaQKa1Uuc7GR4ClQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="96899122"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="96899122"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 13:56:49 -0700
X-CSE-ConnectionGUID: 160XcfTaT9q8OFiBBBZ/5w==
X-CSE-MsgGUID: whEW7+PySiqyJh3AM1kCLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="258577186"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Aug 2026 13:56:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrifN-00000000DQf-28rG;
	Wed, 05 Aug 2026 20:56:45 +0000
Date: Thu, 06 Aug 2026 04:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11978/13093] fs/ntfs/iomap.c:150
 ntfs_read_iomap_begin_resident() warn: inconsistent returns
 '&base_ni->mrec_lock'.
Message-ID: <202608060449.0hsSZtkQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hyeontae Lee <wonju345@naver.com>
CC: Namjae Jeon <linkinjeon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1701fda2f58e345c050f4309971bdc07cd6146ba
commit: 9cf6ac617e8e9d95fd71081fe12a77c381520bda [11978/13093] ntfs: serialize resident iomap reads with mrec_lock
:::::: branch date: 5 hours ago
:::::: commit date: 30 hours ago
config: i386-randconfig-141-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060449.0hsSZtkQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608060449.0hsSZtkQ-lkp@intel.com/

smatch warnings:
fs/ntfs/iomap.c:150 ntfs_read_iomap_begin_resident() warn: inconsistent returns '&base_ni->mrec_lock'.

vim +150 fs/ntfs/iomap.c

b041ca562526b3 Namjae Jeon  2026-02-13   82  
b041ca562526b3 Namjae Jeon  2026-02-13   83  static int ntfs_read_iomap_begin_resident(struct inode *inode, loff_t offset, loff_t length,
9cf6ac617e8e9d Hyeontae Lee 2026-07-31   84  		unsigned int flags, struct iomap *iomap, bool keep_mrec_lock)
b041ca562526b3 Namjae Jeon  2026-02-13   85  {
b041ca562526b3 Namjae Jeon  2026-02-13   86  	struct ntfs_inode *base_ni, *ni = NTFS_I(inode);
b041ca562526b3 Namjae Jeon  2026-02-13   87  	struct ntfs_attr_search_ctx *ctx;
b041ca562526b3 Namjae Jeon  2026-02-13   88  	loff_t i_size;
b041ca562526b3 Namjae Jeon  2026-02-13   89  	u32 attr_len;
b041ca562526b3 Namjae Jeon  2026-02-13   90  	int err = 0;
b041ca562526b3 Namjae Jeon  2026-02-13   91  	char *kattr;
b041ca562526b3 Namjae Jeon  2026-02-13   92  
b041ca562526b3 Namjae Jeon  2026-02-13   93  	if (NInoAttr(ni))
b041ca562526b3 Namjae Jeon  2026-02-13   94  		base_ni = ni->ext.base_ntfs_ino;
b041ca562526b3 Namjae Jeon  2026-02-13   95  	else
b041ca562526b3 Namjae Jeon  2026-02-13   96  		base_ni = ni;
b041ca562526b3 Namjae Jeon  2026-02-13   97  
9cf6ac617e8e9d Hyeontae Lee 2026-07-31   98  	mutex_lock(&base_ni->mrec_lock);
9cf6ac617e8e9d Hyeontae Lee 2026-07-31   99  
b041ca562526b3 Namjae Jeon  2026-02-13  100  	ctx = ntfs_attr_get_search_ctx(base_ni, NULL);
b041ca562526b3 Namjae Jeon  2026-02-13  101  	if (!ctx) {
b041ca562526b3 Namjae Jeon  2026-02-13  102  		err = -ENOMEM;
b041ca562526b3 Namjae Jeon  2026-02-13  103  		goto out;
b041ca562526b3 Namjae Jeon  2026-02-13  104  	}
b041ca562526b3 Namjae Jeon  2026-02-13  105  
b041ca562526b3 Namjae Jeon  2026-02-13  106  	err = ntfs_attr_lookup(ni->type, ni->name, ni->name_len,
b041ca562526b3 Namjae Jeon  2026-02-13  107  			CASE_SENSITIVE, 0, NULL, 0, ctx);
b041ca562526b3 Namjae Jeon  2026-02-13  108  	if (unlikely(err))
b041ca562526b3 Namjae Jeon  2026-02-13  109  		goto out;
b041ca562526b3 Namjae Jeon  2026-02-13  110  
b041ca562526b3 Namjae Jeon  2026-02-13  111  	attr_len = le32_to_cpu(ctx->attr->data.resident.value_length);
b041ca562526b3 Namjae Jeon  2026-02-13  112  	if (unlikely(attr_len > ni->initialized_size))
b041ca562526b3 Namjae Jeon  2026-02-13  113  		attr_len = ni->initialized_size;
b041ca562526b3 Namjae Jeon  2026-02-13  114  	i_size = i_size_read(inode);
b041ca562526b3 Namjae Jeon  2026-02-13  115  
b041ca562526b3 Namjae Jeon  2026-02-13  116  	if (unlikely(attr_len > i_size)) {
b041ca562526b3 Namjae Jeon  2026-02-13  117  		/* Race with shrinking truncate. */
b041ca562526b3 Namjae Jeon  2026-02-13  118  		attr_len = i_size;
b041ca562526b3 Namjae Jeon  2026-02-13  119  	}
b041ca562526b3 Namjae Jeon  2026-02-13  120  
b041ca562526b3 Namjae Jeon  2026-02-13  121  	if (offset >= attr_len) {
b041ca562526b3 Namjae Jeon  2026-02-13  122  		if (flags & IOMAP_REPORT)
b041ca562526b3 Namjae Jeon  2026-02-13  123  			err = -ENOENT;
b041ca562526b3 Namjae Jeon  2026-02-13  124  		else {
b041ca562526b3 Namjae Jeon  2026-02-13  125  			iomap->type = IOMAP_HOLE;
b041ca562526b3 Namjae Jeon  2026-02-13  126  			iomap->offset = offset;
b041ca562526b3 Namjae Jeon  2026-02-13  127  			iomap->length = length;
b041ca562526b3 Namjae Jeon  2026-02-13  128  		}
b041ca562526b3 Namjae Jeon  2026-02-13  129  		goto out;
b041ca562526b3 Namjae Jeon  2026-02-13  130  	}
b041ca562526b3 Namjae Jeon  2026-02-13  131  
b041ca562526b3 Namjae Jeon  2026-02-13  132  	kattr = (u8 *)ctx->attr + le16_to_cpu(ctx->attr->data.resident.value_offset);
b041ca562526b3 Namjae Jeon  2026-02-13  133  
b041ca562526b3 Namjae Jeon  2026-02-13  134  	iomap->type = IOMAP_INLINE;
5aec1efb11ab2a Namjae Jeon  2026-06-09  135  	iomap->inline_data = kattr;
b041ca562526b3 Namjae Jeon  2026-02-13  136  	iomap->offset = 0;
b041ca562526b3 Namjae Jeon  2026-02-13  137  	iomap->length = attr_len;
b041ca562526b3 Namjae Jeon  2026-02-13  138  
b041ca562526b3 Namjae Jeon  2026-02-13  139  out:
b041ca562526b3 Namjae Jeon  2026-02-13  140  	if (ctx)
b041ca562526b3 Namjae Jeon  2026-02-13  141  		ntfs_attr_put_search_ctx(ctx);
b041ca562526b3 Namjae Jeon  2026-02-13  142  
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  143  	if (!err && keep_mrec_lock && iomap->type == IOMAP_INLINE) {
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  144  		iomap->private = base_ni;
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  145  		return 0;
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  146  	}
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  147  
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  148  	mutex_unlock(&base_ni->mrec_lock);
9cf6ac617e8e9d Hyeontae Lee 2026-07-31  149  
b041ca562526b3 Namjae Jeon  2026-02-13 @150  	return err;
b041ca562526b3 Namjae Jeon  2026-02-13  151  }
b041ca562526b3 Namjae Jeon  2026-02-13  152  

:::::: The code at line 150 was first introduced by commit
:::::: b041ca562526b3c4a71b41b80ba5e520eac636ad ntfs: update iomap and address space operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
