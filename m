Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4E71EB46
	for <oe-kbuild@lists.linux.dev>; Mon, 20 May 2024 16:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716222704; cv=none; b=Wqytnrf749N79DAxmp4bK4dbHc6HZPnd4IDnq9SH3AUp4HSe0fNeoPExG69YK7JgZ6JWaKrX3Zhags+DPER0frgfrw7IRDKho+UjRtRqlbRWU8Bphpiqm19OtBUFTp/4oNcFqaGibW3JHqRrVT6MJQAOuP36SvBX900rxDVSaf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716222704; c=relaxed/simple;
	bh=jV6cKyEUFzubHauk4fOXbKQGigMbTZkNLGmqAwoQiiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JBaMlBRSe8ANvoIM3vLdxsWEBvK2Bm+Bf0UXaPlUSAT+Q388Qx5YkBvj5BoUm0OcH8nbmGgJVZPjxMLSyLjvY5wZtfWH7dq/tVsVRwd0yygYDZq0Nrpdf46lS+hloFykscay3Ggf0/DIvX+Mr0dfBd5fzbjaiXAnXwO9p3Sdgb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flDY0vrS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flDY0vrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716222703; x=1747758703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jV6cKyEUFzubHauk4fOXbKQGigMbTZkNLGmqAwoQiiQ=;
  b=flDY0vrSegr0+ASWKoyuRhdVo1S8o+7Ir09NMp1bdFL74M1boAAD8jS4
   nudLgSlOFrhP2g0Afoc6gG2yW39jD6U5/hzH8yYjEjLwieaqiL+LSlZHy
   vRcLpRyYmLtFAiPUfSmmc5Ej4Yu2EhN2c1YPENQDeluHrIidCV69zIFoP
   iFwgbgCmdjbp+hH7MRgzvqDKnKtX0zqbACtSPOCxZpT8N8I8fBw/srzQe
   3P5rVlvlzN51UCFyoyEhKrb2yl6K5I5DZEIxhMvCc++JNZRcMjZv9o+BJ
   PCfPn9s5xaQ1RPjbP8TZN1+qh1n+giNkfZLT22P+DMJIbMx2UUrNcrUo6
   w==;
X-CSE-ConnectionGUID: zpspqrJnQpKTwJlWJnsTqQ==
X-CSE-MsgGUID: 0Zc0mclmTZ2YA/tpBXWTgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="22969502"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="22969502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 09:31:42 -0700
X-CSE-ConnectionGUID: iXzAgo92RFa+VEdWte1Vsg==
X-CSE-MsgGUID: 3h8of14ZRMqTEF2LF95FrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="32503162"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 May 2024 09:31:41 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s95vG-0004y7-1l;
	Mon, 20 May 2024 16:31:38 +0000
Date: Tue, 21 May 2024 00:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 09/10] ext4: temporarily elevate commit thread priority
Message-ID: <202405210026.5LpHV4Sn-lkp@intel.com>
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
In-Reply-To: <20240520055153.136091-10-harshadshirwadkar@gmail.com>
References: <20240520055153.136091-10-harshadshirwadkar@gmail.com>
TO: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
TO: linux-ext4@vger.kernel.org
CC: tytso@mit.edu
CC: saukad@google.com
CC: harshads@google.com
CC: Harshad Shirwadkar <harshadshirwadkar@gmail.com>

Hi Harshad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.9 next-20240520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshad-Shirwadkar/ext4-convert-i_fc_lock-to-spinlock/20240520-135501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20240520055153.136091-10-harshadshirwadkar%40gmail.com
patch subject: [PATCH 09/10] ext4: temporarily elevate commit thread priority
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-141-20240520 (https://download.01.org/0day-ci/archive/20240521/202405210026.5LpHV4Sn-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405210026.5LpHV4Sn-lkp@intel.com/

smatch warnings:
fs/ext4/fast_commit.c:1280 ext4_fc_commit() error: uninitialized symbol 'old_ioprio'.

vim +/old_ioprio +1280 fs/ext4/fast_commit.c

0915e464cb2746 Harshad Shirwadkar 2021-12-23  1193  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1194  /*
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1195   * The main commit entry point. Performs a fast commit for transaction
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1196   * commit_tid if needed. If it's not possible to perform a fast commit
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1197   * due to various reasons, we fall back to full commit. Returns 0
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1198   * on success, error otherwise.
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1199   */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1200  int ext4_fc_commit(journal_t *journal, tid_t commit_tid)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1201  {
c30365b90ab26f Yu Zhe             2022-04-01  1202  	struct super_block *sb = journal->j_private;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1203  	struct ext4_sb_info *sbi = EXT4_SB(sb);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1204  	int nblks = 0, ret, bsize = journal->j_blocksize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1205  	int subtid = atomic_read(&sbi->s_fc_subtid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1206  	int status = EXT4_FC_STATUS_OK, fc_bufs_before = 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1207  	ktime_t start_time, commit_time;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1208  	int old_ioprio, journal_ioprio;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1209  
7f142440847480 Ritesh Harjani     2022-03-12  1210  	if (!test_opt2(sb, JOURNAL_FAST_COMMIT))
7f142440847480 Ritesh Harjani     2022-03-12  1211  		return jbd2_complete_transaction(journal, commit_tid);
7f142440847480 Ritesh Harjani     2022-03-12  1212  
5641ace54471cb Ritesh Harjani     2022-03-12  1213  	trace_ext4_fc_commit_start(sb, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1214  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1215  	start_time = ktime_get();
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1216  
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1217  restart_fc:
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1218  	ret = jbd2_fc_begin_commit(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1219  	if (ret == -EALREADY) {
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1220  		/* There was an ongoing commit, check if we need to restart */
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1221  		if (atomic_read(&sbi->s_fc_subtid) <= subtid &&
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1222  			commit_tid > journal->j_commit_sequence)
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1223  			goto restart_fc;
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1224  		ext4_fc_update_stats(sb, EXT4_FC_STATUS_SKIPPED, 0, 0,
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1225  				commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1226  		return 0;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1227  	} else if (ret) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1228  		/*
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1229  		 * Commit couldn't start. Just update stats and perform a
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1230  		 * full commit.
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1231  		 */
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1232  		ext4_fc_update_stats(sb, EXT4_FC_STATUS_FAILED, 0, 0,
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1233  				commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1234  		return jbd2_complete_transaction(journal, commit_tid);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1235  	}
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1236  
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1237  	/*
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1238  	 * After establishing journal barrier via jbd2_fc_begin_commit(), check
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1239  	 * if we are fast commit ineligible.
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1240  	 */
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1241  	if (ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIBLE)) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1242  		status = EXT4_FC_STATUS_INELIGIBLE;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1243  		goto fallback;
7bbbe241ec7ce0 Harshad Shirwadkar 2021-12-23  1244  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1245  
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1246  	/*
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1247  	 * Now that we know that this thread is going to do a fast commit,
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1248  	 * elevate the priority to match that of the journal thread.
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1249  	 */
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1250  	if (journal->j_task->io_context)
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1251  		journal_ioprio = sbi->s_journal->j_task->io_context->ioprio;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1252  	else
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1253  		journal_ioprio = EXT4_DEF_JOURNAL_IOPRIO;
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1254  	old_ioprio = get_current_ioprio();
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1255  	set_task_ioprio(current, journal_ioprio);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1256  	fc_bufs_before = (sbi->s_fc_bytes + bsize - 1) / bsize;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1257  	ret = ext4_fc_perform_commit(journal);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1258  	if (ret < 0) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1259  		status = EXT4_FC_STATUS_FAILED;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1260  		goto fallback;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1261  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1262  	nblks = (sbi->s_fc_bytes + bsize - 1) / bsize - fc_bufs_before;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1263  	ret = jbd2_fc_wait_bufs(journal, nblks);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1264  	if (ret < 0) {
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1265  		status = EXT4_FC_STATUS_FAILED;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1266  		goto fallback;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1267  	}
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1268  	atomic_inc(&sbi->s_fc_subtid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1269  	ret = jbd2_fc_end_commit(journal);
c3b2c196d67585 Harshad Shirwadkar 2024-05-20  1270  	set_task_ioprio(current, old_ioprio);
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1271  	/*
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1272  	 * weight the commit time higher than the average time so we
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1273  	 * don't react too strongly to vast changes in the commit time
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1274  	 */
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1275  	commit_time = ktime_to_ns(ktime_sub(ktime_get(), start_time));
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1276  	ext4_fc_update_stats(sb, status, commit_time, nblks, commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1277  	return ret;
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1278  
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1279  fallback:
c3b2c196d67585 Harshad Shirwadkar 2024-05-20 @1280  	set_task_ioprio(current, old_ioprio);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1281  	ret = jbd2_fc_end_commit_fallback(journal);
d9bf099cb980d6 Ritesh Harjani     2022-03-12  1282  	ext4_fc_update_stats(sb, status, 0, 0, commit_tid);
0915e464cb2746 Harshad Shirwadkar 2021-12-23  1283  	return ret;
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1284  }
aa75f4d3daaeb1 Harshad Shirwadkar 2020-10-15  1285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
