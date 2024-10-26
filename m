Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8831C7B7F
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Oct 2024 11:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729942444; cv=none; b=plcl1yvxZLvPJak1c1lRFnTD507sh2DKYXep2WO08yrfi6lLx7z4n7vwf8Z/FDHK+XiO0gLgBkBmpUz//RV6W3rGLpjwRwhlui5rtMF9vjGEy4t3hEHgvdvzkNm1UICii0TXSziZkjjmfzsN2CCrv2DcF6GwruI6MLe/5qi7dIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729942444; c=relaxed/simple;
	bh=8YPtGxwk6cMGGuktBBaLRsf+A7+VfSkLVL25GVCKLY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JONecUXkiVD/pAaqm8onm8eLfS2O4Un2m6qa41mus4NycEcVou0XrxpTa5VIMoMnsiASz8BP8IAyxAHF62fbaSeXlAKmK2oMycf2R85nH8EqEeP4NN6jICZlcn41noiT9e4d11r3PRxtFQ/8bAidOMgH9Gq+p4647Xp4W0/scUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aar7wQeH; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aar7wQeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729942441; x=1761478441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YPtGxwk6cMGGuktBBaLRsf+A7+VfSkLVL25GVCKLY4=;
  b=aar7wQeH3XLUVIWk8rCZ7VXrqpelBpIW60JAVq01BjF6ZK5vSx6xU/6X
   1ND5VZyxwMd6sS+VVMm4eWcSbuOeiMN+Ac3UBp595OP0JFuDHCr3Nhhkl
   ZHY6FCmNotRPXjGW/h7L8+FCJSFVluaSNqZAa0RXr3Tedo2wDzCfZAzGD
   6YlW7wnMZb5PY9NbRARf1t+C4/ZxFT8q8j822JOD2GV9OvkXUn5d8xbkF
   cGOe9i7HchD+THI+kUIAvvJzaq2xLfO9/AH1EuKSWNC/KWkYgUib2fi/2
   63XhXf7Ng32X+XSGG0Cskxy4X+V7Ao0jfiXcbM167QpG20qJrEyEDCtgd
   Q==;
X-CSE-ConnectionGUID: ZXuBZLsHSz2T+nZRM4d2gA==
X-CSE-MsgGUID: KwNYu+8nQkiZzlr11KgzpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29792010"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29792010"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 04:34:00 -0700
X-CSE-ConnectionGUID: 9jRbfhhMQU6sZLq7XMweuw==
X-CSE-MsgGUID: c7inyOqqSHKGHObE88vcmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,234,1725346800"; 
   d="scan'208";a="86290409"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Oct 2024 04:33:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4f3M-000ZZo-1n;
	Sat, 26 Oct 2024 11:33:56 +0000
Date: Sat, 26 Oct 2024 19:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 08/12] nilfs2: convert checkpoint file to be folio-based
Message-ID: <202410261934.HqwZEx2G-lkp@intel.com>
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
In-Reply-To: <20241024092602.13395-9-konishi.ryusuke@gmail.com>
References: <20241024092602.13395-9-konishi.ryusuke@gmail.com>
TO: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Hi Ryusuke,

kernel test robot noticed the following build warnings:

[auto build test WARNING on konis-nilfs2/upstream]
[also build test WARNING on linus/master v6.12-rc4 next-20241025]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryusuke-Konishi/nilfs2-convert-segment-buffer-to-be-folio-based/20241024-173025
base:   https://github.com/konis/nilfs2 upstream
patch link:    https://lore.kernel.org/r/20241024092602.13395-9-konishi.ryusuke%40gmail.com
patch subject: [PATCH 08/12] nilfs2: convert checkpoint file to be folio-based
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241026 (https://download.01.org/0day-ci/archive/20241026/202410261934.HqwZEx2G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410261934.HqwZEx2G-lkp@intel.com/

New smatch warnings:
fs/nilfs2/cpfile.c:662 nilfs_cpfile_do_get_ssinfo() warn: passing freed memory 'bh'

Old smatch warnings:
fs/nilfs2/cpfile.c:687 nilfs_cpfile_do_get_ssinfo() warn: passing freed memory 'bh'

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
02954476a4ce12 Ryusuke Konishi 2024-10-24  633  	size_t offset;
7fa10d20012296 Ryusuke Konishi 2009-04-06  634  	int n = 0, ret;
29619809727a4e Koji Sato       2009-04-06  635  
29619809727a4e Koji Sato       2009-04-06  636  	down_read(&NILFS_MDT(cpfile)->mi_sem);
29619809727a4e Koji Sato       2009-04-06  637  
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  638  	if (curr == 0) {
29619809727a4e Koji Sato       2009-04-06  639  		ret = nilfs_cpfile_get_header_block(cpfile, &bh);
29619809727a4e Koji Sato       2009-04-06  640  		if (ret < 0)
29619809727a4e Koji Sato       2009-04-06  641  			goto out;
02954476a4ce12 Ryusuke Konishi 2024-10-24  642  		header = kmap_local_folio(bh->b_folio, 0);
29619809727a4e Koji Sato       2009-04-06  643  		curr = le64_to_cpu(header->ch_snapshot_list.ssl_next);
02954476a4ce12 Ryusuke Konishi 2024-10-24  644  		kunmap_local(header);
29619809727a4e Koji Sato       2009-04-06  645  		brelse(bh);
29619809727a4e Koji Sato       2009-04-06  646  		if (curr == 0) {
29619809727a4e Koji Sato       2009-04-06  647  			ret = 0;
29619809727a4e Koji Sato       2009-04-06  648  			goto out;
29619809727a4e Koji Sato       2009-04-06  649  		}
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  650  	} else if (unlikely(curr == ~(__u64)0)) {
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  651  		ret = 0;
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  652  		goto out;
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  653  	}
b028fcfc4cd198 Ryusuke Konishi 2009-04-06  654  
29619809727a4e Koji Sato       2009-04-06  655  	curr_blkoff = nilfs_cpfile_get_blkoff(cpfile, curr);
29619809727a4e Koji Sato       2009-04-06  656  	ret = nilfs_cpfile_get_checkpoint_block(cpfile, curr, 0, &bh);
7fa10d20012296 Ryusuke Konishi 2009-04-06  657  	if (unlikely(ret < 0)) {
7fa10d20012296 Ryusuke Konishi 2009-04-06  658  		if (ret == -ENOENT)
7fa10d20012296 Ryusuke Konishi 2009-04-06  659  			ret = 0; /* No snapshots (started from a hole block) */
29619809727a4e Koji Sato       2009-04-06  660  		goto out;
7fa10d20012296 Ryusuke Konishi 2009-04-06  661  	}
02954476a4ce12 Ryusuke Konishi 2024-10-24 @662  	offset = nilfs_cpfile_checkpoint_offset(cpfile, curr, bh);
02954476a4ce12 Ryusuke Konishi 2024-10-24  663  	cp = kmap_local_folio(bh->b_folio, offset);
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
02954476a4ce12 Ryusuke Konishi 2024-10-24  676  		kunmap_local(cp);
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
02954476a4ce12 Ryusuke Konishi 2024-10-24  687  		offset = nilfs_cpfile_checkpoint_offset(cpfile, next, bh);
02954476a4ce12 Ryusuke Konishi 2024-10-24  688  		cp = kmap_local_folio(bh->b_folio, offset);
29619809727a4e Koji Sato       2009-04-06  689  		curr = next;
29619809727a4e Koji Sato       2009-04-06  690  		curr_blkoff = next_blkoff;
29619809727a4e Koji Sato       2009-04-06  691  	}
02954476a4ce12 Ryusuke Konishi 2024-10-24  692  	kunmap_local(cp);
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
