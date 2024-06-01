Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B52CCB7
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 23:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717285544; cv=none; b=mlba55eQb0bUnZpJH8IZ6aZqa987rO/XGOq4F5NofbEWgB7xZClCJdKKv7OcLOi8cV3srraUYl/n7dbtvP9yvnTITviX9OQ/AIJjSLuxmCo7KIWNI7ycmkJ/PqhoQYeyH3s7qhj2Byz9qFkyU0oXq21RsT3cb6+AhGjZO7GR3l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717285544; c=relaxed/simple;
	bh=xtggjrTFMs92IkucmzPAcXD5RB16irpdjcKU4PBFhpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N5dfq2XHe0xGT+OaSrUBibFtd9SuGHEDPpa8FhOhfSQGEYB1jDUEy0HeTB045Yz6WugD7QyeCHMBNXj0aekDP7bNuLCq2q3d7V4JKo5g2UUZUHCFdGVbgTToogyswRrwaanvrUKFDOj2BJZf1YGnR3GFUQH6Im/nBb++xcSscbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOjOFJLp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOjOFJLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717285542; x=1748821542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtggjrTFMs92IkucmzPAcXD5RB16irpdjcKU4PBFhpg=;
  b=lOjOFJLp+w0k57yPtKCLqBN6caU0P8IBcaTgp/glZa7EwrTzv+7ap8m2
   OXBQ0n2Fso9Qh1I4StyDnVwrR0rI61ghZGi6eFdFHlimLCwgE5+vsC4yX
   lfuyJxMskR3yN8zVI8B48+wJJ22/al/Icwbthbqr60A+8K1F8Xuew+4+w
   2lBcNvly+RcW+6+YHEvLAiZO7xl3MrmEvZ7iTlPBMW5u96mxoUL0cYIrd
   Tkq9kNpa7yusg1nOlcs8xqoZB3sa2hD0Z/1N2acIuYfPZ7iZMvGGgjqFH
   Ozq38D2N9DRwNF+MKv3L9s2b9YvHnix0u8gr2/NNXzH34pzWJfb0eseAe
   w==;
X-CSE-ConnectionGUID: 0uEgzd4RQK2bhG2qpcW09w==
X-CSE-MsgGUID: /VwqTn7cTyCMKmAPaUdQuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13656336"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="13656336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 16:45:41 -0700
X-CSE-ConnectionGUID: OUWlUTJSTDq6cmJoBeEDCw==
X-CSE-MsgGUID: YgOajzQZRayHNeil6WPAiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="41437511"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Jun 2024 16:45:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDYPn-000JUx-1V;
	Sat, 01 Jun 2024 23:45:35 +0000
Date: Sun, 2 Jun 2024 07:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V3] ext4: check hash version and filesystem casefolded
 consistent
Message-ID: <202406020752.Ii2MU4KP-lkp@intel.com>
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
In-Reply-To: <20240531085647.2918240-1-lizhi.xu@windriver.com>
References: <20240531085647.2918240-1-lizhi.xu@windriver.com>
TO: Lizhi Xu <lizhi.xu@windriver.com>
TO: ebiggers@kernel.org
CC: adilger.kernel@dilger.ca
CC: coreteam@netfilter.org
CC: davem@davemloft.net
CC: fw@strlen.de
CC: jaegeuk@kernel.org
CC: kadlec@netfilter.org
CC: kuba@kernel.org
CC: linux-ext4@vger.kernel.org
CC: linux-fscrypt@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: lizhi.xu@windriver.com
CC: netdev@vger.kernel.org
CC: netfilter-devel@vger.kernel.org
CC: pablo@netfilter.org
CC: syzbot+340581ba9dceb7e06fb3@syzkaller.appspotmail.com
CC: syzkaller-bugs@googlegroups.com
CC: tytso@mit.edu

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/ext4-check-hash-version-and-filesystem-casefolded-consistent/20240531-170046
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20240531085647.2918240-1-lizhi.xu%40windriver.com
patch subject: [PATCH V3] ext4: check hash version and filesystem casefolded consistent
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240601 (https://download.01.org/0day-ci/archive/20240602/202406020752.Ii2MU4KP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406020752.Ii2MU4KP-lkp@intel.com/

smatch warnings:
fs/ext4/super.c:5287 __ext4_fill_super() warn: missing error code 'err'

vim +/err +5287 fs/ext4/super.c

107d2be90116a17 Jason Yan               2023-03-23  5199  
a7a79c292ac3776 Jason Yan               2022-09-16  5200  static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
a7a79c292ac3776 Jason Yan               2022-09-16  5201  {
a7a79c292ac3776 Jason Yan               2022-09-16  5202  	struct ext4_super_block *es = NULL;
a7a79c292ac3776 Jason Yan               2022-09-16  5203  	struct ext4_sb_info *sbi = EXT4_SB(sb);
a7a79c292ac3776 Jason Yan               2022-09-16  5204  	ext4_fsblk_t logical_sb_block;
a7a79c292ac3776 Jason Yan               2022-09-16  5205  	struct inode *root;
107d2be90116a17 Jason Yan               2023-03-23  5206  	int needs_recovery;
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5207  	int err;
a7a79c292ac3776 Jason Yan               2022-09-16  5208  	ext4_group_t first_not_zeroed;
a7a79c292ac3776 Jason Yan               2022-09-16  5209  	struct ext4_fs_context *ctx = fc->fs_private;
a7a79c292ac3776 Jason Yan               2022-09-16  5210  	int silent = fc->sb_flags & SB_SILENT;
a7a79c292ac3776 Jason Yan               2022-09-16  5211  
a7a79c292ac3776 Jason Yan               2022-09-16  5212  	/* Set defaults for the variables that will be set during parsing */
a7a79c292ac3776 Jason Yan               2022-09-16  5213  	if (!(ctx->spec & EXT4_SPEC_JOURNAL_IOPRIO))
a7a79c292ac3776 Jason Yan               2022-09-16  5214  		ctx->journal_ioprio = DEFAULT_JOURNAL_IOPRIO;
a7a79c292ac3776 Jason Yan               2022-09-16  5215  
a7a79c292ac3776 Jason Yan               2022-09-16  5216  	sbi->s_inode_readahead_blks = EXT4_DEF_INODE_READAHEAD_BLKS;
a7a79c292ac3776 Jason Yan               2022-09-16  5217  	sbi->s_sectors_written_start =
a7a79c292ac3776 Jason Yan               2022-09-16  5218  		part_stat_read(sb->s_bdev, sectors[STAT_WRITE]);
a7a79c292ac3776 Jason Yan               2022-09-16  5219  
a7a79c292ac3776 Jason Yan               2022-09-16  5220  	err = ext4_load_super(sb, &logical_sb_block, silent);
a7a79c292ac3776 Jason Yan               2022-09-16  5221  	if (err)
a7a79c292ac3776 Jason Yan               2022-09-16  5222  		goto out_fail;
a7a79c292ac3776 Jason Yan               2022-09-16  5223  
a7a79c292ac3776 Jason Yan               2022-09-16  5224  	es = sbi->s_es;
afc32f7ee9febc0 Theodore Ts'o           2009-02-28  5225  	sbi->s_kbytes_written = le64_to_cpu(es->s_kbytes_written);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5226  
b26458d151019ec Jason Yan               2022-09-16  5227  	err = ext4_init_metadata_csum(sb, es);
b26458d151019ec Jason Yan               2022-09-16  5228  	if (err)
a5fc51193507e10 Jason Yan               2022-09-16  5229  		goto failed_mount;
a9c4731780544d5 Darrick J. Wong         2012-04-29  5230  
5f6d662d12b889a Jason Yan               2022-09-16  5231  	ext4_set_def_opts(sb, es);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5232  
08cefc7ab839cf3 Eric W. Biederman       2012-02-07  5233  	sbi->s_resuid = make_kuid(&init_user_ns, le16_to_cpu(es->s_def_resuid));
08cefc7ab839cf3 Eric W. Biederman       2012-02-07  5234  	sbi->s_resgid = make_kgid(&init_user_ns, le16_to_cpu(es->s_def_resgid));
30773840c19cea6 Theodore Ts'o           2009-01-03  5235  	sbi->s_commit_interval = JBD2_DEFAULT_MAX_COMMIT_AGE * HZ;
30773840c19cea6 Theodore Ts'o           2009-01-03  5236  	sbi->s_min_batch_time = EXT4_DEF_MIN_BATCH_TIME;
30773840c19cea6 Theodore Ts'o           2009-01-03  5237  	sbi->s_max_batch_time = EXT4_DEF_MAX_BATCH_TIME;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5238  
51ce65115642b77 Lukas Czerner           2011-05-20  5239  	/*
51ce65115642b77 Lukas Czerner           2011-05-20  5240  	 * set default s_li_wait_mult for lazyinit, for the case there is
51ce65115642b77 Lukas Czerner           2011-05-20  5241  	 * no mount option specified.
51ce65115642b77 Lukas Czerner           2011-05-20  5242  	 */
51ce65115642b77 Lukas Czerner           2011-05-20  5243  	sbi->s_li_wait_mult = EXT4_DEF_LI_WAIT_MULT;
51ce65115642b77 Lukas Czerner           2011-05-20  5244  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5245  	err = ext4_inode_info_init(sb, es);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5246  	if (err)
9803387c55f7d2c Theodore Ts'o           2019-12-15  5247  		goto failed_mount;
9803387c55f7d2c Theodore Ts'o           2019-12-15  5248  
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5249  	err = parse_apply_sb_mount_options(sb, ctx);
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5250  	if (err < 0)
5aee0f8a3f42c94 Theodore Ts'o           2016-11-18  5251  		goto failed_mount;
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5252  
5a916be1b31de9e Theodore Ts'o           2012-03-04  5253  	sbi->s_def_mount_opt = sbi->s_mount_opt;
e3645d72f8865ff Zhang Yi                2023-01-29  5254  	sbi->s_def_mount_opt2 = sbi->s_mount_opt2;
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5255  
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5256  	err = ext4_check_opt_consistency(fc, sb);
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5257  	if (err < 0)
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5258  		goto failed_mount;
7edfd85b1ffd365 Lukas Czerner           2021-10-27  5259  
85456054e10b024 Eric Biggers            2022-05-25  5260  	ext4_apply_options(fc, sb);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5261  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5262  	err = ext4_encoding_init(sb, es);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5263  	if (err)
c83ad55eaa91c8e Gabriel Krisman Bertazi 2019-04-25  5264  		goto failed_mount;
c83ad55eaa91c8e Gabriel Krisman Bertazi 2019-04-25  5265  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5266  	err = ext4_check_journal_data_mode(sb);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5267  	if (err)
923ae0ff9250430 Ross Zwisler            2015-02-16  5268  		goto failed_mount;
56889787cfa77df Theodore Ts'o           2011-09-03  5269  
1751e8a6cb935e5 Linus Torvalds          2017-11-27  5270  	sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
1751e8a6cb935e5 Linus Torvalds          2017-11-27  5271  		(test_opt(sb, POSIX_ACL) ? SB_POSIXACL : 0);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5272  
1ff20307393e17d Jeff Layton             2022-08-24  5273  	/* i_version is always enabled now */
1ff20307393e17d Jeff Layton             2022-08-24  5274  	sb->s_flags |= SB_I_VERSION;
1ff20307393e17d Jeff Layton             2022-08-24  5275  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5276  	err = ext4_check_feature_compatibility(sb, es, silent);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5277  	if (err)
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5278  		goto failed_mount;
a13fb1a4533f26c Eric Sandeen            2009-08-18  5279  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5280  	err = ext4_block_group_meta_init(sb, silent);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5281  	if (err)
0d1ee42f27d30ee Alexandre Ratchov       2006-10-11  5282  		goto failed_mount;
0b8e58a140cae2b Andreas Dilger          2009-06-03  5283  
db9345d9e6f075e Jason Yan               2023-03-23  5284  	ext4_hash_info_init(sb);
66b3f078839bbdb Lizhi Xu                2024-05-31  5285  	if (es->s_def_hash_version == DX_HASH_SIPHASH && 
66b3f078839bbdb Lizhi Xu                2024-05-31  5286  	    !ext4_has_feature_casefold(sb))
66b3f078839bbdb Lizhi Xu                2024-05-31 @5287  		goto failed_mount;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5288  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5289  	err = ext4_handle_clustersize(sb);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5290  	if (err)
281b59959707dfa Theodore Ts'o           2011-09-09  5291  		goto failed_mount;
960fd856fdc3b08 Theodore Ts'o           2013-07-05  5292  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5293  	err = ext4_check_geometry(sb, es);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5294  	if (err)
bfe0a5f47ada40d Theodore Ts'o           2018-06-17  5295  		goto failed_mount;
bfe0a5f47ada40d Theodore Ts'o           2018-06-17  5296  
235699a8f457ede Kees Cook               2017-10-18  5297  	timer_setup(&sbi->s_err_report, print_daily_error_info, 0);
c92dc856848f327 Jan Kara                2020-11-27  5298  	spin_lock_init(&sbi->s_error_lock);
bb15cea20f211e1 Theodore Ts'o           2023-08-22  5299  	INIT_WORK(&sbi->s_sb_upd_work, update_super_work);
0449641130f5652 Tao Ma                  2011-04-05  5300  
172e344e6f82dc2 Ye Bin                  2023-01-19  5301  	err = ext4_group_desc_init(sb, es, logical_sb_block, &first_not_zeroed);
172e344e6f82dc2 Ye Bin                  2023-01-19  5302  	if (err)
172e344e6f82dc2 Ye Bin                  2023-01-19  5303  		goto failed_mount3;
172e344e6f82dc2 Ye Bin                  2023-01-19  5304  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5305  	err = ext4_es_register_shrinker(sbi);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5306  	if (err)
ce7e010aef63dc6 Theodore Ts'o           2010-11-03  5307  		goto failed_mount3;
ce7e010aef63dc6 Theodore Ts'o           2010-11-03  5308  
c9de560ded61faa Alex Tomas              2008-01-29  5309  	sbi->s_stripe = ext4_get_stripe_size(sbi);
c3defd99d58cbdd Kemeng Shi              2023-06-03  5310  	/*
c3defd99d58cbdd Kemeng Shi              2023-06-03  5311  	 * It's hard to get stripe aligned blocks if stripe is not aligned with
c3defd99d58cbdd Kemeng Shi              2023-06-03  5312  	 * cluster, just disable stripe and alert user to simpfy code and avoid
c3defd99d58cbdd Kemeng Shi              2023-06-03  5313  	 * stripe aligned allocation which will rarely successes.
c3defd99d58cbdd Kemeng Shi              2023-06-03  5314  	 */
c3defd99d58cbdd Kemeng Shi              2023-06-03  5315  	if (sbi->s_stripe > 0 && sbi->s_cluster_ratio > 1 &&
c3defd99d58cbdd Kemeng Shi              2023-06-03  5316  	    sbi->s_stripe % sbi->s_cluster_ratio != 0) {
c3defd99d58cbdd Kemeng Shi              2023-06-03  5317  		ext4_msg(sb, KERN_WARNING,
c3defd99d58cbdd Kemeng Shi              2023-06-03  5318  			 "stripe (%lu) is not aligned with cluster size (%u), "
c3defd99d58cbdd Kemeng Shi              2023-06-03  5319  			 "stripe is disabled",
c3defd99d58cbdd Kemeng Shi              2023-06-03  5320  			 sbi->s_stripe, sbi->s_cluster_ratio);
c3defd99d58cbdd Kemeng Shi              2023-06-03  5321  		sbi->s_stripe = 0;
c3defd99d58cbdd Kemeng Shi              2023-06-03  5322  	}
67a5da564f97f31 Zheng Liu               2012-08-17  5323  	sbi->s_extent_max_zeroout_kb = 32;
c9de560ded61faa Alex Tomas              2008-01-29  5324  
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5325  	/*
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5326  	 * set up enough so that it can read an inode
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5327  	 */
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5328  	sb->s_op = &ext4_sops;
617ba13b31fbf50 Mingming Cao            2006-10-11  5329  	sb->s_export_op = &ext4_export_ops;
617ba13b31fbf50 Mingming Cao            2006-10-11  5330  	sb->s_xattr = ext4_xattr_handlers;
643fa9612bf1a29 Chandan Rajendra        2018-12-12  5331  #ifdef CONFIG_FS_ENCRYPTION
a7550b30ab709ff Jaegeuk Kim             2016-07-10  5332  	sb->s_cop = &ext4_cryptops;
ffcc41829ae043d Eric Biggers            2017-10-09  5333  #endif
c93d8f88580921c Eric Biggers            2019-07-22  5334  #ifdef CONFIG_FS_VERITY
c93d8f88580921c Eric Biggers            2019-07-22  5335  	sb->s_vop = &ext4_verityops;
c93d8f88580921c Eric Biggers            2019-07-22  5336  #endif
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5337  #ifdef CONFIG_QUOTA
617ba13b31fbf50 Mingming Cao            2006-10-11  5338  	sb->dq_op = &ext4_quota_operations;
e2b911c53584a92 Darrick J. Wong         2015-10-17  5339  	if (ext4_has_feature_quota(sb))
1fa5efe3622db58 Jan Kara                2014-10-08  5340  		sb->s_qcop = &dquot_quotactl_sysfile_ops;
262b4662f42787b Jan Kara                2013-03-02  5341  	else
262b4662f42787b Jan Kara                2013-03-02  5342  		sb->s_qcop = &ext4_qctl_operations;
689c958cbe6be4f Li Xi                   2016-01-08  5343  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5344  #endif
a4af51ce229b1e1 Kent Overstreet         2024-02-06  5345  	super_set_uuid(sb, es->s_uuid, sizeof(es->s_uuid));
fb092d407262eb4 Kent Overstreet         2024-03-14  5346  	super_set_sysfs_name_bdev(sb);
f2fa2ffc2046fdc Aneesh Kumar K.V        2011-01-29  5347  
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5348  	INIT_LIST_HEAD(&sbi->s_orphan); /* unlinked but open files */
3b9d4ed26680771 Theodore Ts'o           2009-04-25  5349  	mutex_init(&sbi->s_orphan_lock);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5350  
f7314a67322ef04 Jason Yan               2022-09-16  5351  	ext4_fast_commit_init(sb);
aa75f4d3daaeb13 Harshad Shirwadkar      2020-10-15  5352  
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5353  	sb->s_root = NULL;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5354  
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5355  	needs_recovery = (es->s_last_orphan != 0 ||
02f310fcf47fa93 Jan Kara                2021-08-16  5356  			  ext4_has_feature_orphan_present(sb) ||
e2b911c53584a92 Darrick J. Wong         2015-10-17  5357  			  ext4_has_feature_journal_needs_recovery(sb));
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5358  
3b50d5018ed06a6 Theodore Ts'o           2023-04-27  5359  	if (ext4_has_feature_mmp(sb) && !sb_rdonly(sb)) {
3b50d5018ed06a6 Theodore Ts'o           2023-04-27  5360  		err = ext4_multi_mount_protect(sb, le64_to_cpu(es->s_mmp_block));
3b50d5018ed06a6 Theodore Ts'o           2023-04-27  5361  		if (err)
50460fe8c6d1d95 Darrick J. Wong         2014-10-30  5362  			goto failed_mount3a;
3b50d5018ed06a6 Theodore Ts'o           2023-04-27  5363  	}
c5e06d101aaf72f Johann Lombardi         2011-05-24  5364  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5365  	err = -EINVAL;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5366  	/*
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5367  	 * The first inode we look at is the journal inode.  Don't try
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5368  	 * root first: it may be modified in the journal!
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5369  	 */
e2b911c53584a92 Darrick J. Wong         2015-10-17  5370  	if (!test_opt(sb, NOLOAD) && ext4_has_feature_journal(sb)) {
9c1dd22d742249c Jason Yan               2022-09-16  5371  		err = ext4_load_and_init_journal(sb, es, ctx);
4753d8a24d45886 Theodore Ts'o           2017-02-05  5372  		if (err)
50460fe8c6d1d95 Darrick J. Wong         2014-10-30  5373  			goto failed_mount3a;
bc98a42c1f7d0f8 David Howells           2017-07-17  5374  	} else if (test_opt(sb, NOLOAD) && !sb_rdonly(sb) &&
e2b911c53584a92 Darrick J. Wong         2015-10-17  5375  		   ext4_has_feature_journal_needs_recovery(sb)) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5376  		ext4_msg(sb, KERN_ERR, "required journal recovery "
b31e15527a9bb71 Eric Sandeen            2009-06-04  5377  		       "suppressed and not mounted read-only");
43bd6f1b49b61f4 Jason Yan               2022-09-16  5378  		goto failed_mount3a;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5379  	} else {
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5380  		/* Nojournal mode, all journal mount options are illegal */
89481b5fa8c0640 Baokun Li               2022-11-09  5381  		if (test_opt(sb, JOURNAL_ASYNC_COMMIT)) {
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5382  			ext4_msg(sb, KERN_ERR, "can't mount with "
89481b5fa8c0640 Baokun Li               2022-11-09  5383  				 "journal_async_commit, fs mounted w/o journal");
43bd6f1b49b61f4 Jason Yan               2022-09-16  5384  			goto failed_mount3a;
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5385  		}
89481b5fa8c0640 Baokun Li               2022-11-09  5386  
89481b5fa8c0640 Baokun Li               2022-11-09  5387  		if (test_opt2(sb, EXPLICIT_JOURNAL_CHECKSUM)) {
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5388  			ext4_msg(sb, KERN_ERR, "can't mount with "
89481b5fa8c0640 Baokun Li               2022-11-09  5389  				 "journal_checksum, fs mounted w/o journal");
43bd6f1b49b61f4 Jason Yan               2022-09-16  5390  			goto failed_mount3a;
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5391  		}
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5392  		if (sbi->s_commit_interval != JBD2_DEFAULT_MAX_COMMIT_AGE*HZ) {
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5393  			ext4_msg(sb, KERN_ERR, "can't mount with "
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5394  				 "commit=%lu, fs mounted w/o journal",
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5395  				 sbi->s_commit_interval / HZ);
43bd6f1b49b61f4 Jason Yan               2022-09-16  5396  			goto failed_mount3a;
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5397  		}
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5398  		if (EXT4_MOUNT_DATA_FLAGS &
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5399  		    (sbi->s_mount_opt ^ sbi->s_def_mount_opt)) {
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5400  			ext4_msg(sb, KERN_ERR, "can't mount with "
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5401  				 "data=, fs mounted w/o journal");
43bd6f1b49b61f4 Jason Yan               2022-09-16  5402  			goto failed_mount3a;
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5403  		}
50b29d8f033a7c8 Debabrata Banerjee      2019-04-30  5404  		sbi->s_def_mount_opt &= ~EXT4_MOUNT_JOURNAL_CHECKSUM;
1e381f60dad9136 Dmitry Monakhov         2015-10-18  5405  		clear_opt(sb, JOURNAL_CHECKSUM);
fd8c37eccdda211 Theodore Ts'o           2010-12-15  5406  		clear_opt(sb, DATA_FLAGS);
995a3ed67fc8c0e Harshad Shirwadkar      2020-10-15  5407  		clear_opt2(sb, JOURNAL_FAST_COMMIT);
0390131ba84fd3f Frank Mayhar            2009-01-07  5408  		sbi->s_journal = NULL;
0390131ba84fd3f Frank Mayhar            2009-01-07  5409  		needs_recovery = 0;
d4da6c9ccf648f3 Linus Torvalds          2009-11-02  5410  	}
818d276ceb83aa9 Girish Shilamkar        2008-01-28  5411  
cdb7ee4c6327590 Tahsin Erdogan          2017-06-22  5412  	if (!test_opt(sb, NO_MBCACHE)) {
47387409ee2e09d Tahsin Erdogan          2017-06-22  5413  		sbi->s_ea_block_cache = ext4_xattr_create_cache();
47387409ee2e09d Tahsin Erdogan          2017-06-22  5414  		if (!sbi->s_ea_block_cache) {
cdb7ee4c6327590 Tahsin Erdogan          2017-06-22  5415  			ext4_msg(sb, KERN_ERR,
cdb7ee4c6327590 Tahsin Erdogan          2017-06-22  5416  				 "Failed to create ea_block_cache");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5417  			err = -EINVAL;
9c191f701ce9f9b T Makphaibulchoke       2014-03-18  5418  			goto failed_mount_wq;
9c191f701ce9f9b T Makphaibulchoke       2014-03-18  5419  		}
9c191f701ce9f9b T Makphaibulchoke       2014-03-18  5420  
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5421  		if (ext4_has_feature_ea_inode(sb)) {
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5422  			sbi->s_ea_inode_cache = ext4_xattr_create_cache();
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5423  			if (!sbi->s_ea_inode_cache) {
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5424  				ext4_msg(sb, KERN_ERR,
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5425  					 "Failed to create ea_inode_cache");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5426  				err = -EINVAL;
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5427  				goto failed_mount_wq;
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5428  			}
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5429  		}
cdb7ee4c6327590 Tahsin Erdogan          2017-06-22  5430  	}
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5431  
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5432  	/*
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5433  	 * Get the # of file system overhead blocks from the
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5434  	 * superblock if present.
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5435  	 */
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5436  	sbi->s_overhead = le32_to_cpu(es->s_overhead_clusters);
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5437  	/* ignore the precalculated value if it is ridiculous */
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5438  	if (sbi->s_overhead > ext4_blocks_count(es))
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5439  		sbi->s_overhead = 0;
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5440  	/*
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5441  	 * If the bigalloc feature is not enabled recalculating the
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5442  	 * overhead doesn't take long, so we might as well just redo
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5443  	 * it to make sure we are using the correct value.
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5444  	 */
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5445  	if (!ext4_has_feature_bigalloc(sb))
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5446  		sbi->s_overhead = 0;
85d825dbf4899a6 Theodore Ts'o           2022-04-14  5447  	if (sbi->s_overhead == 0) {
07aa2ea13814ea6 Lukas Czerner           2012-11-08  5448  		err = ext4_calculate_overhead(sb);
07aa2ea13814ea6 Lukas Czerner           2012-11-08  5449  		if (err)
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5450  			goto failed_mount_wq;
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5451  	}
952fc18ef9ec707 Theodore Ts'o           2012-07-09  5452  
fd89d5f2030ac83 Tejun Heo               2011-02-01  5453  	/*
fd89d5f2030ac83 Tejun Heo               2011-02-01  5454  	 * The maximum number of concurrent works can be high and
fd89d5f2030ac83 Tejun Heo               2011-02-01  5455  	 * concurrency isn't really necessary.  Limit it to 1.
fd89d5f2030ac83 Tejun Heo               2011-02-01  5456  	 */
2e8fa54e3b48e4c Jan Kara                2013-06-04  5457  	EXT4_SB(sb)->rsv_conversion_wq =
2e8fa54e3b48e4c Jan Kara                2013-06-04  5458  		alloc_workqueue("ext4-rsv-conversion", WQ_MEM_RECLAIM | WQ_UNBOUND, 1);
2e8fa54e3b48e4c Jan Kara                2013-06-04  5459  	if (!EXT4_SB(sb)->rsv_conversion_wq) {
2e8fa54e3b48e4c Jan Kara                2013-06-04  5460  		printk(KERN_ERR "EXT4-fs: failed to create workqueue\n");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5461  		err = -ENOMEM;
2e8fa54e3b48e4c Jan Kara                2013-06-04  5462  		goto failed_mount4;
2e8fa54e3b48e4c Jan Kara                2013-06-04  5463  	}
2e8fa54e3b48e4c Jan Kara                2013-06-04  5464  
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5465  	/*
dab291af8d6307a Mingming Cao            2006-10-11  5466  	 * The jbd2_journal_load will have done any necessary log recovery,
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5467  	 * so we can safely mount the rest of the filesystem now.
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5468  	 */
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5469  
8a363970d1dc38c Theodore Ts'o           2018-12-19  5470  	root = ext4_iget(sb, EXT4_ROOT_INO, EXT4_IGET_SPECIAL);
1d1fe1ee02b9ac2 David Howells           2008-02-07  5471  	if (IS_ERR(root)) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5472  		ext4_msg(sb, KERN_ERR, "get root inode failed");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5473  		err = PTR_ERR(root);
32a9bb57d7c1fd0 Manish Katiyar          2011-02-27  5474  		root = NULL;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5475  		goto failed_mount4;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5476  	}
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5477  	if (!S_ISDIR(root->i_mode) || !root->i_blocks || !root->i_size) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5478  		ext4_msg(sb, KERN_ERR, "corrupt root inode, run e2fsck");
94bf608a18fa442 Al Viro                 2012-01-09  5479  		iput(root);
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5480  		err = -EFSCORRUPTED;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5481  		goto failed_mount4;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5482  	}
b886ee3e778ec2a Gabriel Krisman Bertazi 2019-04-25  5483  
04aa5f4eba49d64 Gabriel Krisman Bertazi 2024-02-21  5484  	generic_set_sb_d_ops(sb);
48fde701aff6625 Al Viro                 2012-01-08  5485  	sb->s_root = d_make_root(root);
1d1fe1ee02b9ac2 David Howells           2008-02-07  5486  	if (!sb->s_root) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5487  		ext4_msg(sb, KERN_ERR, "get root dentry failed");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5488  		err = -ENOMEM;
1d1fe1ee02b9ac2 David Howells           2008-02-07  5489  		goto failed_mount4;
1d1fe1ee02b9ac2 David Howells           2008-02-07  5490  	}
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5491  
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5492  	err = ext4_setup_super(sb, es, sb_rdonly(sb));
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5493  	if (err == -EROFS) {
1751e8a6cb935e5 Linus Torvalds          2017-11-27  5494  		sb->s_flags |= SB_RDONLY;
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5495  	} else if (err)
c89128a00838147 Jaegeuk Kim             2018-05-13  5496  		goto failed_mount4a;
ef7f38359ea8b3e Kalpak Shah             2007-07-18  5497  
b5799018827e678 Theodore Ts'o           2015-09-23  5498  	ext4_set_resv_clusters(sb);
27dd43854227bb0 Lukas Czerner           2013-04-09  5499  
0f5bde1db174f6c Jan Kara                2020-07-28  5500  	if (test_opt(sb, BLOCK_VALIDITY)) {
6fd058f77910876 Theodore Ts'o           2009-05-17  5501  		err = ext4_setup_system_zone(sb);
6fd058f77910876 Theodore Ts'o           2009-05-17  5502  		if (err) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5503  			ext4_msg(sb, KERN_ERR, "failed to initialize system "
fbe845ddf368f77 Curt Wohlgemuth         2010-05-16  5504  				 "zone (%d)", err);
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5505  			goto failed_mount4a;
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5506  		}
0f5bde1db174f6c Jan Kara                2020-07-28  5507  	}
8016e29f4362e28 Harshad Shirwadkar      2020-10-15  5508  	ext4_fc_replay_cleanup(sb);
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5509  
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5510  	ext4_ext_init(sb);
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5511  
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5512  	/*
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5513  	 * Enable optimize_scan if number of groups is > threshold. This can be
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5514  	 * turned off by passing "mb_optimize_scan=0". This can also be
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5515  	 * turned on forcefully by passing "mb_optimize_scan=1".
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5516  	 */
27b38686a3bb601 Ojaswin Mujoo           2022-03-08  5517  	if (!(ctx->spec & EXT4_SPEC_mb_optimize_scan)) {
27b38686a3bb601 Ojaswin Mujoo           2022-03-08  5518  		if (sbi->s_groups_count >= MB_DEFAULT_LINEAR_SCAN_THRESHOLD)
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5519  			set_opt2(sb, MB_OPTIMIZE_SCAN);
27b38686a3bb601 Ojaswin Mujoo           2022-03-08  5520  		else
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5521  			clear_opt2(sb, MB_OPTIMIZE_SCAN);
27b38686a3bb601 Ojaswin Mujoo           2022-03-08  5522  	}
196e402adf2e4cd Harshad Shirwadkar      2021-04-01  5523  
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5524  	err = ext4_mb_init(sb);
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5525  	if (err) {
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5526  		ext4_msg(sb, KERN_ERR, "failed to initialize mballoc (%d)",
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5527  			 err);
dcf2d804ed6ffe5 Tao Ma                  2011-10-06  5528  		goto failed_mount5;
c2774d84fd6cab2 Aneesh Kumar K.V        2008-10-10  5529  	}
c2774d84fd6cab2 Aneesh Kumar K.V        2008-10-10  5530  
027f14f53572796 Theodore Ts'o           2021-01-21  5531  	/*
027f14f53572796 Theodore Ts'o           2021-01-21  5532  	 * We can only set up the journal commit callback once
027f14f53572796 Theodore Ts'o           2021-01-21  5533  	 * mballoc is initialized
027f14f53572796 Theodore Ts'o           2021-01-21  5534  	 */
027f14f53572796 Theodore Ts'o           2021-01-21  5535  	if (sbi->s_journal)
027f14f53572796 Theodore Ts'o           2021-01-21  5536  		sbi->s_journal->j_commit_callback =
027f14f53572796 Theodore Ts'o           2021-01-21  5537  			ext4_journal_commit_callback;
027f14f53572796 Theodore Ts'o           2021-01-21  5538  
d5e72c4e3256335 Theodore Ts'o           2023-04-27  5539  	err = ext4_percpu_param_init(sbi);
d5e72c4e3256335 Theodore Ts'o           2023-04-27  5540  	if (err)
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5541  		goto failed_mount6;
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5542  
e2b911c53584a92 Darrick J. Wong         2015-10-17  5543  	if (ext4_has_feature_flex_bg(sb))
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5544  		if (!ext4_fill_flex_info(sb)) {
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5545  			ext4_msg(sb, KERN_ERR,
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5546  			       "unable to initialize "
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5547  			       "flex_bg meta info!");
d4fab7b28e2f5d7 Theodore Ts'o           2023-04-27  5548  			err = -ENOMEM;
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5549  			goto failed_mount6;
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5550  		}
d5e03cbb0c88cd1 Theodore Ts'o           2014-07-15  5551  
bfff68738f1cb5c Lukas Czerner           2010-10-27  5552  	err = ext4_register_li_request(sb, first_not_zeroed);
bfff68738f1cb5c Lukas Czerner           2010-10-27  5553  	if (err)
dcf2d804ed6ffe5 Tao Ma                  2011-10-06  5554  		goto failed_mount6;
bfff68738f1cb5c Lukas Czerner           2010-10-27  5555  
02f310fcf47fa93 Jan Kara                2021-08-16  5556  	err = ext4_init_orphan_info(sb);
02f310fcf47fa93 Jan Kara                2021-08-16  5557  	if (err)
b4b4fda34e53575 Baokun Li               2024-01-02  5558  		goto failed_mount7;
9b2ff35753c0512 Jan Kara                2013-03-02  5559  #ifdef CONFIG_QUOTA
9b2ff35753c0512 Jan Kara                2013-03-02  5560  	/* Enable quota usage during mount. */
bc98a42c1f7d0f8 David Howells           2017-07-17  5561  	if (ext4_has_feature_quota(sb) && !sb_rdonly(sb)) {
9b2ff35753c0512 Jan Kara                2013-03-02  5562  		err = ext4_enable_quotas(sb);
9b2ff35753c0512 Jan Kara                2013-03-02  5563  		if (err)
b4b4fda34e53575 Baokun Li               2024-01-02  5564  			goto failed_mount8;
9b2ff35753c0512 Jan Kara                2013-03-02  5565  	}
9b2ff35753c0512 Jan Kara                2013-03-02  5566  #endif  /* CONFIG_QUOTA */
9b2ff35753c0512 Jan Kara                2013-03-02  5567  
bc71726c7257672 zhangyi (F              2020-06-20  5568) 	/*
bc71726c7257672 zhangyi (F              2020-06-20  5569) 	 * Save the original bdev mapping's wb_err value which could be
bc71726c7257672 zhangyi (F              2020-06-20  5570) 	 * used to detect the metadata async write error.
bc71726c7257672 zhangyi (F              2020-06-20  5571) 	 */
bc71726c7257672 zhangyi (F              2020-06-20  5572) 	spin_lock_init(&sbi->s_bdev_wb_lock);
bc71726c7257672 zhangyi (F              2020-06-20  5573) 	errseq_check_and_advance(&sb->s_bdev->bd_inode->i_mapping->wb_err,
bc71726c7257672 zhangyi (F              2020-06-20  5574) 				 &sbi->s_bdev_wb_err);
617ba13b31fbf50 Mingming Cao            2006-10-11  5575  	EXT4_SB(sb)->s_mount_state |= EXT4_ORPHAN_FS;
617ba13b31fbf50 Mingming Cao            2006-10-11  5576  	ext4_orphan_cleanup(sb, es);
617ba13b31fbf50 Mingming Cao            2006-10-11  5577  	EXT4_SB(sb)->s_mount_state &= ~EXT4_ORPHAN_FS;
9b6641dd95a0c44 Ye Bin                  2022-05-25  5578  	/*
9b6641dd95a0c44 Ye Bin                  2022-05-25  5579  	 * Update the checksum after updating free space/inode counters and
9b6641dd95a0c44 Ye Bin                  2022-05-25  5580  	 * ext4_orphan_cleanup. Otherwise the superblock can have an incorrect
9b6641dd95a0c44 Ye Bin                  2022-05-25  5581  	 * checksum in the buffer cache until it is written out and
9b6641dd95a0c44 Ye Bin                  2022-05-25  5582  	 * e2fsprogs programs trying to open a file system immediately
9b6641dd95a0c44 Ye Bin                  2022-05-25  5583  	 * after it is mounted can fail.
9b6641dd95a0c44 Ye Bin                  2022-05-25  5584  	 */
9b6641dd95a0c44 Ye Bin                  2022-05-25  5585  	ext4_superblock_csum_set(sb);
0390131ba84fd3f Frank Mayhar            2009-01-07  5586  	if (needs_recovery) {
b31e15527a9bb71 Eric Sandeen            2009-06-04  5587  		ext4_msg(sb, KERN_INFO, "recovery complete");
11215630aada283 Jan Kara                2020-07-10  5588  		err = ext4_mark_recovery_complete(sb, es);
11215630aada283 Jan Kara                2020-07-10  5589  		if (err)
b4b4fda34e53575 Baokun Li               2024-01-02  5590  			goto failed_mount9;
0390131ba84fd3f Frank Mayhar            2009-01-07  5591  	}
0390131ba84fd3f Frank Mayhar            2009-01-07  5592  
70200574cc229f6 Christoph Hellwig       2022-04-15  5593  	if (test_opt(sb, DISCARD) && !bdev_max_discard_sectors(sb->s_bdev))
79add3a3f795e68 Lukas Czerner           2012-11-08  5594  		ext4_msg(sb, KERN_WARNING,
70200574cc229f6 Christoph Hellwig       2022-04-15  5595  			 "mounting with \"discard\" option, but the device does not support discard");
79add3a3f795e68 Lukas Czerner           2012-11-08  5596  
66e61a9e9504f61 Theodore Ts'o           2010-07-27  5597  	if (es->s_error_count)
66e61a9e9504f61 Theodore Ts'o           2010-07-27  5598  		mod_timer(&sbi->s_err_report, jiffies + 300*HZ); /* 5 minutes */
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5599  
efbed4dc5857f84 Theodore Ts'o           2013-10-17  5600  	/* Enable message ratelimiting. Default is 10 messages per 5 secs. */
efbed4dc5857f84 Theodore Ts'o           2013-10-17  5601  	ratelimit_state_init(&sbi->s_err_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f84 Theodore Ts'o           2013-10-17  5602  	ratelimit_state_init(&sbi->s_warning_ratelimit_state, 5 * HZ, 10);
efbed4dc5857f84 Theodore Ts'o           2013-10-17  5603  	ratelimit_state_init(&sbi->s_msg_ratelimit_state, 5 * HZ, 10);
1cf006ed19a887c Dmitry Monakhov         2020-07-25  5604  	atomic_set(&sbi->s_warning_count, 0);
1cf006ed19a887c Dmitry Monakhov         2020-07-25  5605  	atomic_set(&sbi->s_msg_count, 0);
efbed4dc5857f84 Theodore Ts'o           2013-10-17  5606  
b4b4fda34e53575 Baokun Li               2024-01-02  5607  	/* Register sysfs after all initializations are complete. */
b4b4fda34e53575 Baokun Li               2024-01-02  5608  	err = ext4_register_sysfs(sb);
b4b4fda34e53575 Baokun Li               2024-01-02  5609  	if (err)
b4b4fda34e53575 Baokun Li               2024-01-02  5610  		goto failed_mount9;
b4b4fda34e53575 Baokun Li               2024-01-02  5611  
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5612  	return 0;
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5613  
b4b4fda34e53575 Baokun Li               2024-01-02  5614  failed_mount9:
f3c1c42e0c40656 Baokun Li               2023-03-27  5615  	ext4_quotas_off(sb, EXT4_MAXQUOTAS);
b4b4fda34e53575 Baokun Li               2024-01-02  5616  failed_mount8: __maybe_unused
02f310fcf47fa93 Jan Kara                2021-08-16  5617  	ext4_release_orphan_info(sb);
dcf2d804ed6ffe5 Tao Ma                  2011-10-06  5618  failed_mount7:
dcf2d804ed6ffe5 Tao Ma                  2011-10-06  5619  	ext4_unregister_li_request(sb);
dcf2d804ed6ffe5 Tao Ma                  2011-10-06  5620  failed_mount6:
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5621  	ext4_mb_release(sb);
dcbf87589d90e3b Jason Yan               2023-03-23  5622  	ext4_flex_groups_free(sbi);
1f79467c8a6be64 Jason Yan               2023-03-23  5623  	ext4_percpu_param_destroy(sbi);
007649375f6af24 Azat Khuzhin            2014-04-07  5624  failed_mount5:
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5625  	ext4_ext_release(sb);
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5626  	ext4_release_system_zone(sb);
f9ae9cf5d72b392 Theodore Ts'o           2014-07-11  5627  failed_mount4a:
94bf608a18fa442 Al Viro                 2012-01-09  5628  	dput(sb->s_root);
32a9bb57d7c1fd0 Manish Katiyar          2011-02-27  5629  	sb->s_root = NULL;
94bf608a18fa442 Al Viro                 2012-01-09  5630  failed_mount4:
b31e15527a9bb71 Eric Sandeen            2009-06-04  5631  	ext4_msg(sb, KERN_ERR, "mount failed");
2e8fa54e3b48e4c Jan Kara                2013-06-04  5632  	if (EXT4_SB(sb)->rsv_conversion_wq)
2e8fa54e3b48e4c Jan Kara                2013-06-04  5633  		destroy_workqueue(EXT4_SB(sb)->rsv_conversion_wq);
4c0425ff68b1b87 Mingming Cao            2009-09-28  5634  failed_mount_wq:
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5635  	ext4_xattr_destroy_cache(sbi->s_ea_inode_cache);
dec214d00e0d78a Tahsin Erdogan          2017-06-22  5636  	sbi->s_ea_inode_cache = NULL;
50c15df69e062bf Chengguang Xu           2018-12-04  5637  
47387409ee2e09d Tahsin Erdogan          2017-06-22  5638  	ext4_xattr_destroy_cache(sbi->s_ea_block_cache);
47387409ee2e09d Tahsin Erdogan          2017-06-22  5639  	sbi->s_ea_block_cache = NULL;
50c15df69e062bf Chengguang Xu           2018-12-04  5640  
0390131ba84fd3f Frank Mayhar            2009-01-07  5641  	if (sbi->s_journal) {
bb15cea20f211e1 Theodore Ts'o           2023-08-22  5642  		/* flush s_sb_upd_work before journal destroy. */
bb15cea20f211e1 Theodore Ts'o           2023-08-22  5643  		flush_work(&sbi->s_sb_upd_work);
dab291af8d6307a Mingming Cao            2006-10-11  5644  		jbd2_journal_destroy(sbi->s_journal);
47b4a50bebfd34b Jan Kara                2008-07-11  5645  		sbi->s_journal = NULL;
0390131ba84fd3f Frank Mayhar            2009-01-07  5646  	}
50460fe8c6d1d95 Darrick J. Wong         2014-10-30  5647  failed_mount3a:
d3922a777f9b4c4 Zheng Liu               2013-07-01  5648  	ext4_es_unregister_shrinker(sbi);
eb68d0e2fc5a4e5 Zheng Liu               2014-09-01  5649  failed_mount3:
bb15cea20f211e1 Theodore Ts'o           2023-08-22  5650  	/* flush s_sb_upd_work before sbi destroy */
bb15cea20f211e1 Theodore Ts'o           2023-08-22  5651  	flush_work(&sbi->s_sb_upd_work);
2a4ae3bcdf05b86 Jan Kara                2021-03-15  5652  	del_timer_sync(&sbi->s_err_report);
618f003199c6188 Pavel Skripkin          2021-04-30  5653  	ext4_stop_mmpd(sbi);
a4e6a511d7de5d2 Jason Yan               2022-09-16  5654  	ext4_group_desc_free(sbi);
ac27a0ec112a089 Dave Kleikamp           2006-10-11  5655  failed_mount:
0441984a3398970 Darrick J. Wong         2012-04-29  5656  	if (sbi->s_chksum_driver)
0441984a3398970 Darrick J. Wong         2012-04-29  5657  		crypto_free_shash(sbi->s_chksum_driver);
c83ad55eaa91c8e Gabriel Krisman Bertazi 2019-04-25  5658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
