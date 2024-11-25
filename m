Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4971C07F0
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 21:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732571020; cv=none; b=Gw1PvdW6FcKo+k7kt+jvpRHzmR1+6KS/ArU5Wb8ypDrWOtmTiccqFg9tViopoISl4wDuzp4u3aM5BV3zTA5sCq7APzQMDV2jNpjG/nm4b0z3MDaT7p6PkjungMY9daqFDJ1jh+WD1Ap1/nL1Y74r4umhMaGG0CwyReMepyLWemc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732571020; c=relaxed/simple;
	bh=AbM6/l86/TqEENe1kgFEAiK0sdXx5yGhFxtJpzEQlgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IPJs1BkfXR54w+yD60/+oyw1yKeDArKnUafQ9IG09R0uOb2MNmJ6ZfMA520QYlS4klBLBXswR6YRLtirrZ8PbAmpRIf4h6vNMBRPnKYyliCnvYviuzHzZBMwALiVHeND8pM6Wwl48E11DzoBlHY42tk1j5jkM/eXrJ71bcFe2nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O21FnZGD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O21FnZGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732571018; x=1764107018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AbM6/l86/TqEENe1kgFEAiK0sdXx5yGhFxtJpzEQlgo=;
  b=O21FnZGDISdWt0IAAC43YkPmlnhaBuofN579MxA54+FQmQD/hl0TJIbS
   i/QfAPNdJDRagM3boZnUfRpRsLI6ySehuNt/zo/be97v7TPBsS0nAsPPg
   GFe/ShYmK+WOSTQPXuwzSbsfnBtwBNAddH6xH4t8yPWcyZQLXSUMPD6hg
   1S4loi4t3lfR4C+x7lJDNEEeD7REOe2ZIeKwXxyaXmaXnzu+7g3pua4Vj
   3q8T4ocuutUeYiW5N8foGhZ6bkgX7Fa8m+g0T0JPA1Tp31YBXRde8XoJe
   1vRzpdB4JT0ijowU9yCgF8I4/D3YlxxKUqPNBg/8oQ7pb/dVd0GL62uYN
   g==;
X-CSE-ConnectionGUID: SsxOuP8fSK2CODqOtNWh1Q==
X-CSE-MsgGUID: 9dgSIPuwTZWUac6Q3lhWxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="43363422"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="43363422"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 13:43:38 -0800
X-CSE-ConnectionGUID: uA2hQZfFS9OdYohXhQn9Xg==
X-CSE-MsgGUID: ySKXOElgRc68BeRsps7H+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="95817249"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2024 13:43:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFgrm-0006pB-0i;
	Mon, 25 Nov 2024 21:43:34 +0000
Date: Tue, 26 Nov 2024 05:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8716/12684] fs/nilfs2/cpfile.c:662
 nilfs_cpfile_do_get_ssinfo() warn: passing freed memory 'bh' (line 652)
Message-ID: <202411260556.IdtIvxQ9-lkp@intel.com>
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
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85a2dd7d7c8152cb125712a1ecae1d0a6ccac250
commit: a6cb5b1e9c707c3a43ede691c7faee45e796458b [8716/12684] nilfs2: convert checkpoint file to be folio-based
:::::: branch date: 17 hours ago
:::::: commit date: 3 weeks ago
config: hexagon-randconfig-r072-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260556.IdtIvxQ9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411260556.IdtIvxQ9-lkp@intel.com/

New smatch warnings:
fs/nilfs2/cpfile.c:662 nilfs_cpfile_do_get_ssinfo() warn: passing freed memory 'bh' (line 652)

Old smatch warnings:
fs/nilfs2/cpfile.c:687 nilfs_cpfile_do_get_ssinfo() warn: passing freed memory 'bh' (line 684)

vim +/bh +662 fs/nilfs2/cpfile.c

29619809727a4e Koji Sato       2009-04-06  622  
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  623  static ssize_t nilfs_cpfile_do_get_ssinfo(struct inode *cpfile, __u64 *cnop,
0c6c44cb9f93f7 Ryusuke Konishi 2016-05-23  624  					  void *buf, unsigned int cisz,
0c6c44cb9f93f7 Ryusuke Konishi 2016-05-23  625  					  size_t nci)
29619809727a4e Koji Sato       2009-04-06  626  {
29619809727a4e Koji Sato       2009-04-06  627  	struct buffer_head *bh;
29619809727a4e Koji Sato       2009-04-06  628  	struct nilfs_cpfile_header *header;
29619809727a4e Koji Sato       2009-04-06  629  	struct nilfs_checkpoint *cp;
003ff182fddde0 Ryusuke Konishi 2009-05-12  630  	struct nilfs_cpinfo *ci = buf;
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  631  	__u64 curr = *cnop, next;
29619809727a4e Koji Sato       2009-04-06  632  	unsigned long curr_blkoff, next_blkoff;
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  633  	size_t offset;
7fa10d20012296 Ryusuke Konishi 2009-04-06  634  	int n = 0, ret;
29619809727a4e Koji Sato       2009-04-06  635  
29619809727a4e Koji Sato       2009-04-06  636  	down_read(&NILFS_MDT(cpfile)->mi_sem);
29619809727a4e Koji Sato       2009-04-06  637  
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  638  	if (curr == 0) {
29619809727a4e Koji Sato       2009-04-06  639  		ret = nilfs_cpfile_get_header_block(cpfile, &bh);
29619809727a4e Koji Sato       2009-04-06  640  		if (ret < 0)
29619809727a4e Koji Sato       2009-04-06  641  			goto out;
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  642  		header = kmap_local_folio(bh->b_folio, 0);
29619809727a4e Koji Sato       2009-04-06  643  		curr = le64_to_cpu(header->ch_snapshot_list.ssl_next);
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  644  		kunmap_local(header);
29619809727a4e Koji Sato       2009-04-06  645  		brelse(bh);
29619809727a4e Koji Sato       2009-04-06  646  		if (curr == 0) {
29619809727a4e Koji Sato       2009-04-06  647  			ret = 0;
29619809727a4e Koji Sato       2009-04-06  648  			goto out;
29619809727a4e Koji Sato       2009-04-06  649  		}
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  650  	} else if (unlikely(curr == ~(__u64)0)) {
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  651  		ret = 0;
b028fcfc4cd198 Ryusuke Konishi 2009-04-06 @652  		goto out;
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  653  	}
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  654  
29619809727a4e Koji Sato       2009-04-06  655  	curr_blkoff = nilfs_cpfile_get_blkoff(cpfile, curr);
29619809727a4e Koji Sato       2009-04-06  656  	ret = nilfs_cpfile_get_checkpoint_block(cpfile, curr, 0, &bh);
7fa10d20012296 Ryusuke Konishi 2009-04-06  657  	if (unlikely(ret < 0)) {
7fa10d20012296 Ryusuke Konishi 2009-04-06  658  		if (ret == -ENOENT)
7fa10d20012296 Ryusuke Konishi 2009-04-06  659  			ret = 0; /* No snapshots (started from a hole block) */
29619809727a4e Koji Sato       2009-04-06  660  		goto out;
7fa10d20012296 Ryusuke Konishi 2009-04-06  661  	}
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24 @662  	offset = nilfs_cpfile_checkpoint_offset(cpfile, curr, bh);
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  663  	cp = kmap_local_folio(bh->b_folio, offset);
7fa10d20012296 Ryusuke Konishi 2009-04-06  664  	while (n < nci) {
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  665  		curr = ~(__u64)0; /* Terminator */
7fa10d20012296 Ryusuke Konishi 2009-04-06  666  		if (unlikely(nilfs_checkpoint_invalid(cp) ||
7fa10d20012296 Ryusuke Konishi 2009-04-06  667  			     !nilfs_checkpoint_snapshot(cp)))
29619809727a4e Koji Sato       2009-04-06  668  			break;
003ff182fddde0 Ryusuke Konishi 2009-05-12  669  		nilfs_cpfile_checkpoint_to_cpinfo(cpfile, cp, ci);
003ff182fddde0 Ryusuke Konishi 2009-05-12  670  		ci = (void *)ci + cisz;
003ff182fddde0 Ryusuke Konishi 2009-05-12  671  		n++;
7fa10d20012296 Ryusuke Konishi 2009-04-06  672  		next = le64_to_cpu(cp->cp_snapshot_list.ssl_next);
7fa10d20012296 Ryusuke Konishi 2009-04-06  673  		if (next == 0)
7fa10d20012296 Ryusuke Konishi 2009-04-06  674  			break; /* reach end of the snapshot list */
7fa10d20012296 Ryusuke Konishi 2009-04-06  675  
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  676  		kunmap_local(cp);
29619809727a4e Koji Sato       2009-04-06  677  		next_blkoff = nilfs_cpfile_get_blkoff(cpfile, next);
29619809727a4e Koji Sato       2009-04-06  678  		if (curr_blkoff != next_blkoff) {
29619809727a4e Koji Sato       2009-04-06  679  			brelse(bh);
29619809727a4e Koji Sato       2009-04-06  680  			ret = nilfs_cpfile_get_checkpoint_block(cpfile, next,
29619809727a4e Koji Sato       2009-04-06  681  								0, &bh);
7fa10d20012296 Ryusuke Konishi 2009-04-06  682  			if (unlikely(ret < 0)) {
7fa10d20012296 Ryusuke Konishi 2009-04-06  683  				WARN_ON(ret == -ENOENT);
29619809727a4e Koji Sato       2009-04-06  684  				goto out;
7fa10d20012296 Ryusuke Konishi 2009-04-06  685  			}
29619809727a4e Koji Sato       2009-04-06  686  		}
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  687  		offset = nilfs_cpfile_checkpoint_offset(cpfile, next, bh);
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  688  		cp = kmap_local_folio(bh->b_folio, offset);
29619809727a4e Koji Sato       2009-04-06  689  		curr = next;
29619809727a4e Koji Sato       2009-04-06  690  		curr_blkoff = next_blkoff;
29619809727a4e Koji Sato       2009-04-06  691  	}
a6cb5b1e9c707c Ryusuke Konishi 2024-10-24  692  	kunmap_local(cp);
29619809727a4e Koji Sato       2009-04-06  693  	brelse(bh);
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  694  	*cnop = curr;
29619809727a4e Koji Sato       2009-04-06  695  	ret = n;
29619809727a4e Koji Sato       2009-04-06  696  
29619809727a4e Koji Sato       2009-04-06  697   out:
29619809727a4e Koji Sato       2009-04-06  698  	up_read(&NILFS_MDT(cpfile)->mi_sem);
29619809727a4e Koji Sato       2009-04-06  699  	return ret;
29619809727a4e Koji Sato       2009-04-06  700  }
29619809727a4e Koji Sato       2009-04-06  701  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
