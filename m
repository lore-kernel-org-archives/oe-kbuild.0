Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9B45945
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jan 2024 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iu0rq1sy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704720970; x=1736256970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVJrKhEZPwoXHvVPNSw0Ang2pZ4qhRjW4c1raIQN8hI=;
  b=iu0rq1syrhQyMyn9e75iqRVelwqQixR85kR0UKyMKZsCInNCLgaPhPig
   sGQNNPilo9DBI0VZJEjKdcfuL1n1yWaOPxDoSZN78W2AMZRwbArSKR13c
   Ml2zwHBWGTXs2fss9cg1Pm2rsE+xQ5nnHcOYcX/SQDC0MFK5Plpphi/GM
   8SRwEotPR+WB3fBTyRoX7PcEOnyteAf6aBzwNqfU+qtLSolwr+Rb13+jv
   lvYeRaFbrbADD1i+vJ25QLR6S0gh8qettgEFmnkPzy3/VJs7A58cqEvya
   B+UgkmfgKKeBc6/HP4dVNMHB/FHY9QdoGTLqjAfdroTGJqrII3tTWU5nr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4636766"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="4636766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 05:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="900375038"
X-IronPort-AV: E=Sophos;i="6.04,341,1695711600"; 
   d="scan'208";a="900375038"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2024 05:36:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMpnN-0004jg-0C;
	Mon, 08 Jan 2024 13:36:05 +0000
Date: Mon, 8 Jan 2024 21:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] f2fs: fix max open zone constraints
Message-ID: <202401082140.ax5H7boF-lkp@intel.com>
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
In-Reply-To: <20240106123935.586-1-qwjhust@gmail.com>
References: <20240106123935.586-1-qwjhust@gmail.com>
TO: Wenjie <qwjhust@gmail.com>
TO: jaegeuk@kernel.org
TO: chao@kernel.org
TO: linux-f2fs-devel@lists.sourceforge.net
TO: linux-kernel@vger.kernel.org
CC: hustqwj@hust.edu.cn
CC: Wenjie Qi <qwjhust@gmail.com>

Hi Wenjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.7 next-20240108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wenjie/f2fs-fix-max-open-zone-constraints/20240106-204230
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240106123935.586-1-qwjhust%40gmail.com
patch subject: [PATCH] f2fs: fix max open zone constraints
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240108 (https://download.01.org/0day-ci/archive/20240108/202401082140.ax5H7boF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401082140.ax5H7boF-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:1109 f2fs_submit_page_write() error: we previously assumed 'io->bio' could be null (see line 1073)

Old smatch warnings:
fs/f2fs/data.c:2294 f2fs_read_multi_pages() warn: missing error code 'ret'

vim +1109 fs/f2fs/data.c

e067dc3c6b9c41 Daeho Jeong       2023-05-03  1038  
fb830fc5cfc90b Chao Yu           2017-05-19  1039  next:
fb830fc5cfc90b Chao Yu           2017-05-19  1040  	if (fio->in_list) {
fb830fc5cfc90b Chao Yu           2017-05-19  1041  		spin_lock(&io->io_lock);
fb830fc5cfc90b Chao Yu           2017-05-19  1042  		if (list_empty(&io->io_list)) {
fb830fc5cfc90b Chao Yu           2017-05-19  1043  			spin_unlock(&io->io_lock);
fe16efe6a7952f Chao Yu           2018-05-28  1044  			goto out;
fb830fc5cfc90b Chao Yu           2017-05-19  1045  		}
fb830fc5cfc90b Chao Yu           2017-05-19  1046  		fio = list_first_entry(&io->io_list,
fb830fc5cfc90b Chao Yu           2017-05-19  1047  						struct f2fs_io_info, list);
fb830fc5cfc90b Chao Yu           2017-05-19  1048  		list_del(&fio->list);
fb830fc5cfc90b Chao Yu           2017-05-19  1049  		spin_unlock(&io->io_lock);
fb830fc5cfc90b Chao Yu           2017-05-19  1050  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1051  
93770ab7a6e963 Chao Yu           2019-04-15  1052  	verify_fio_blkaddr(fio);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1053  
4c8ff7095bef64 Chao Yu           2019-11-01  1054  	if (fio->encrypted_page)
4c8ff7095bef64 Chao Yu           2019-11-01  1055  		bio_page = fio->encrypted_page;
4c8ff7095bef64 Chao Yu           2019-11-01  1056  	else if (fio->compressed_page)
4c8ff7095bef64 Chao Yu           2019-11-01  1057  		bio_page = fio->compressed_page;
4c8ff7095bef64 Chao Yu           2019-11-01  1058  	else
4c8ff7095bef64 Chao Yu           2019-11-01  1059  		bio_page = fio->page;
36951b38d13ac7 Chao Yu           2016-11-16  1060  
ebf7c522fdc2ec Thomas Meyer      2017-10-07  1061  	/* set submitted = true as a return value */
2eae077e6e46f9 Chao Yu           2023-02-02  1062  	fio->submitted = 1;
d68f735b3bc934 Jaegeuk Kim       2017-02-03  1063  
36951b38d13ac7 Chao Yu           2016-11-16  1064  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
36951b38d13ac7 Chao Yu           2016-11-16  1065  
27aacd28ea3b89 Satya Tangirala   2020-07-02  1066  	if (io->bio &&
27aacd28ea3b89 Satya Tangirala   2020-07-02  1067  	    (!io_is_mergeable(sbi, io->bio, io, fio, io->last_block_in_bio,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1068  			      fio->new_blkaddr) ||
27aacd28ea3b89 Satya Tangirala   2020-07-02  1069  	     !f2fs_crypt_mergeable_bio(io->bio, fio->page->mapping->host,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1070  				       bio_page->index, fio)))
458e6197c37de5 Jaegeuk Kim       2013-12-11  1071  		__submit_merged_bio(io);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1072  alloc_new:
93dfe2ac516250 Jaegeuk Kim       2013-11-30 @1073  	if (io->bio == NULL) {
8223ecc456d079 Chao Yu           2019-08-28  1074  		if (F2FS_IO_ALIGNED(sbi) &&
8223ecc456d079 Chao Yu           2019-08-28  1075  				(fio->type == DATA || fio->type == NODE) &&
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1076  				fio->new_blkaddr & F2FS_IO_SIZE_MASK(sbi)) {
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1077  			dec_page_count(sbi, WB_DATA_TYPE(bio_page));
2eae077e6e46f9 Chao Yu           2023-02-02  1078  			fio->retry = 1;
fe16efe6a7952f Chao Yu           2018-05-28  1079  			goto skip;
0a595ebaaa6b53 Jaegeuk Kim       2016-12-14  1080  		}
a8affc03a9b375 Christoph Hellwig 2021-03-11  1081  		io->bio = __bio_alloc(fio, BIO_MAX_VECS);
27aacd28ea3b89 Satya Tangirala   2020-07-02  1082  		f2fs_set_bio_crypt_ctx(io->bio, fio->page->mapping->host,
27aacd28ea3b89 Satya Tangirala   2020-07-02  1083  				       bio_page->index, fio, GFP_NOIO);
458e6197c37de5 Jaegeuk Kim       2013-12-11  1084  		io->fio = *fio;
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1085  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1086  
a912b54d3aaa01 Jaegeuk Kim       2017-05-10  1087  	if (bio_add_page(io->bio, bio_page, PAGE_SIZE, 0) < PAGE_SIZE) {
458e6197c37de5 Jaegeuk Kim       2013-12-11  1088  		__submit_merged_bio(io);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1089  		goto alloc_new;
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1090  	}
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1091  
578c647879f74c Yufen Yu          2018-01-09  1092  	if (fio->io_wbc)
844545c51a5b2a Eric Biggers      2023-02-02  1093  		wbc_account_cgroup_owner(fio->io_wbc, fio->page, PAGE_SIZE);
578c647879f74c Yufen Yu          2018-01-09  1094  
7a9d75481b85d5 Chao Yu           2016-02-22  1095  	io->last_block_in_bio = fio->new_blkaddr;
fb830fc5cfc90b Chao Yu           2017-05-19  1096  
fb830fc5cfc90b Chao Yu           2017-05-19  1097  	trace_f2fs_submit_page_write(fio->page, fio);
fe16efe6a7952f Chao Yu           2018-05-28  1098  skip:
fb830fc5cfc90b Chao Yu           2017-05-19  1099  	if (fio->in_list)
fb830fc5cfc90b Chao Yu           2017-05-19  1100  		goto next;
fe16efe6a7952f Chao Yu           2018-05-28  1101  out:
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1102  #ifdef CONFIG_BLK_DEV_ZONED
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1103  	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1104  			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
4e0fe634a865bd Wenjie Qi         2024-01-06  1105  		spin_lock_bh(&sbi->available_active_zones_lock);
4e0fe634a865bd Wenjie Qi         2024-01-06  1106  		if (sbi->available_active_zones > 0) {
4e0fe634a865bd Wenjie Qi         2024-01-06  1107  			sbi->available_active_zones--;
4e0fe634a865bd Wenjie Qi         2024-01-06  1108  			spin_unlock_bh(&sbi->available_active_zones_lock);
4e0fe634a865bd Wenjie Qi         2024-01-06 @1109  			io->bio->bi_end_io = f2fs_zone_write_end_io_nowait;
4e0fe634a865bd Wenjie Qi         2024-01-06  1110  		} else {
4e0fe634a865bd Wenjie Qi         2024-01-06  1111  			spin_unlock_bh(&sbi->available_active_zones_lock);
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1112  			bio_get(io->bio);
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1113  			reinit_completion(&io->zone_wait);
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1114  			io->bi_private = io->bio->bi_private;
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1115  			io->bio->bi_private = io;
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1116  			io->bio->bi_end_io = f2fs_zone_write_end_io;
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1117  			io->zone_pending_bio = io->bio;
4e0fe634a865bd Wenjie Qi         2024-01-06  1118  		}
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1119  		__submit_merged_bio(io);
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1120  	}
e067dc3c6b9c41 Daeho Jeong       2023-05-03  1121  #endif
4354994f097d06 Daniel Rosenberg  2018-08-20  1122  	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
00e09c0bccc718 Chao Yu           2019-08-23  1123  				!f2fs_is_checkpoint_ready(sbi))
5ce805869cbed9 Jaegeuk Kim       2018-09-06  1124  		__submit_merged_bio(io);
e4544b63a7ee49 Tim Murray        2022-01-07  1125  	f2fs_up_write(&io->io_rwsem);
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1126  }
93dfe2ac516250 Jaegeuk Kim       2013-11-30  1127  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
