Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA322BB13
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078479; cv=none; b=Yu0hXSdkUB5FuDJRT9vGvZBjudUvOAWqmVlwSX3W0cbjFDVGUfCWhDposOsA6e4Z9mPFUoqA1tVQb69s1Bg5k8oFBiEoYX8Kc1MxseBagBhmYOphU24/Ec9BnvcXP6OyUV2qSspaaMcdFyIQhnA2Uhip13D/gglVjXTaEvDl1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078479; c=relaxed/simple;
	bh=8+MAD0ST5ktFUSCgyFIZ8xF4UGyHVed3/OQ1qvZgNbg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f1Ox2OQlioK/guHuM5wZ2KF+QQvSuchpqbFs6fFLdjU0bNce/QlF+GTWugLf8oFwwanrv9N+oYkegZZiMdNAFOz3E7KybN2/IRUxdg0MA1Kg6gwcfCL/fISfMUFnksIlV1KUNNpZGS8TkweDsKWunh6QqgymFNX8inj7BDVvo1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndrqybDe; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndrqybDe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785078477; x=1816614477;
  h=date:from:to:cc:subject:message-id;
  bh=8+MAD0ST5ktFUSCgyFIZ8xF4UGyHVed3/OQ1qvZgNbg=;
  b=ndrqybDeYBLMKSiQ1WjJRQv+kgrJRR3qRplrtO73OYA7Lmt4uID+dhMN
   CXBD5bh0r7B9K44jFJXr4NASKywZPfQ9prxwV5KAn8dtg39t1bo7a84MO
   3Nqrtitv0EyhUbnPK/K22J3Ts4bnN5RSf9vRwcP//n8rUJ2SuYRLbwHwC
   6Qghj25zweZVse2VKd4MfNv3C1MLPpgl8w+a49bkluMbLmFADurU7T6qU
   4FJL4R86D2C7dOXJdr+BQ/JdI1Fzr3q9WdgPAE5RtUgsu8FkzkhXsaTsb
   MTe02ctj0aaSnRTN12VomR2DIx0AP6yAUhO+mLTdPCF8fRaUi8cbu/czu
   w==;
X-CSE-ConnectionGUID: lzho3ComTXSFOdGXGfy4iA==
X-CSE-MsgGUID: SWzCfsgWSD6qENQbPme/vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="89556411"
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="89556411"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 08:07:57 -0700
X-CSE-ConnectionGUID: OCtcCeIVQqO9Y8qvHMcR7Q==
X-CSE-MsgGUID: cqZL7X6cTVeb8ODEangFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,186,1779174000"; 
   d="scan'208";a="255256673"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jul 2026 08:07:54 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wo0SG-00000000cZU-0n4W;
	Sun, 26 Jul 2026 15:07:52 +0000
Date: Sun, 26 Jul 2026 23:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/gfs2/log.c:1181 __gfs2_log_flush() error: we previously
 assumed 'sdp->sd_jdesc' could be null (see line 1134)
Message-ID: <202607262345.5i3TSq9Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: fe2c8d051150b90b3ccb85f89e3b1d636cb88ec8 gfs2: add some missing log locking
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-161-20260723 (https://download.01.org/0day-ci/archive/20260726/202607262345.5i3TSq9Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fe2c8d051150 ("gfs2: add some missing log locking")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607262345.5i3TSq9Q-lkp@intel.com/

New smatch warnings:
fs/gfs2/log.c:1181 __gfs2_log_flush() error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1134)

Old smatch warnings:
fs/gfs2/log.c:1044 gfs2_remove_from_journal() error: dereferencing freed memory 'bh' (line 1035)
fs/gfs2/log.c:1051 gfs2_remove_from_journal() warn: passing freed memory 'bh' (line 1035)

vim +1181 fs/gfs2/log.c

10866892c79159 Andreas Gruenbacher 2026-03-13  1054  
b3b94faa5fe596 David Teigland      2006-01-16  1055  /**
fe2c8d051150b9 Andreas Gruenbacher 2026-03-31  1056   * __gfs2_log_flush - flush incore transaction(s)
c551f66c5dfefd Lee Jones           2021-03-30  1057   * @sdp: The filesystem
b3b94faa5fe596 David Teigland      2006-01-16  1058   * @gl: The glock structure to flush.  If NULL, flush the whole incore log
805c090750a315 Bob Peterson        2018-01-08  1059   * @flags: The log header flags: GFS2_LOG_HEAD_FLUSH_* and debug flags
b3b94faa5fe596 David Teigland      2006-01-16  1060   *
b3b94faa5fe596 David Teigland      2006-01-16  1061   */
b3b94faa5fe596 David Teigland      2006-01-16  1062  
fe2c8d051150b9 Andreas Gruenbacher 2026-03-31  1063  static void __gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl,
fe2c8d051150b9 Andreas Gruenbacher 2026-03-31  1064  			     u32 flags)
b3b94faa5fe596 David Teigland      2006-01-16  1065  {
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1066  	struct gfs2_trans *tr = NULL;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1067  	unsigned int reserved_blocks = 0, used_blocks = 0;
5432af15f8772d Andreas Gruenbacher 2022-08-18  1068  	bool frozen = test_bit(SDF_FROZEN, &sdp->sd_flags);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1069  	unsigned int first_log_head;
2129b4288852cf Andreas Gruenbacher 2020-12-17  1070  	unsigned int reserved_revokes = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1071  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1072  	trace_gfs2_log_flush(sdp, 1, flags);
b3b94faa5fe596 David Teigland      2006-01-16  1073  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1074  repeat:
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1075  	/*
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1076  	 * Do this check while holding the log_flush_lock to prevent new
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1077  	 * buffers from being added to the ail via gfs2_pin()
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1078  	 */
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1079  	if (gfs2_withdrawn(sdp) ||
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1080  	    !test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1081  		goto out;
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1082  
2bcd610d2fdea6 Steven Whitehouse   2007-11-08  1083  	/* Log might have been flushed while we waited for the flush lock */
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1084  	if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1085  		goto out;
f55ab26a8f92a2 Steven Whitehouse   2006-02-21  1086  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1087  	first_log_head = sdp->sd_log_head;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1088  	sdp->sd_log_flush_head = first_log_head;
400ac52e805bb6 Benjamin Marzinski  2015-12-09  1089  
16ca9412d80181 Benjamin Marzinski  2013-04-05  1090  	tr = sdp->sd_log_tr;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1091  	if (tr || sdp->sd_log_num_revoke) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1092  		if (reserved_blocks)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1093  			gfs2_log_release(sdp, reserved_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1094  		reserved_blocks = sdp->sd_log_blks_reserved;
2129b4288852cf Andreas Gruenbacher 2020-12-17  1095  		reserved_revokes = sdp->sd_log_num_revoke;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1096  		if (tr) {
16ca9412d80181 Benjamin Marzinski  2013-04-05  1097  			sdp->sd_log_tr = NULL;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1098  			tr->tr_first = first_log_head;
5432af15f8772d Andreas Gruenbacher 2022-08-18  1099  			if (unlikely(frozen)) {
8daf6c2b3d8cee Andreas Gruenbacher 2025-08-05  1100  				if (gfs2_assert_withdraw(sdp,
ca399c96e96e3f Bob Peterson        2020-01-08  1101  				       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1102  					goto out_withdraw;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1103  			}
2129b4288852cf Andreas Gruenbacher 2020-12-17  1104  		}
fe3e397668775e Andreas Gruenbacher 2020-12-10  1105  	} else if (!reserved_blocks) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1106  		unsigned int taboo_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1107  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1108  		reserved_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1109  		if (current == sdp->sd_logd_process)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1110  			taboo_blocks = 0;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1111  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1112  		if (!__gfs2_log_try_reserve(sdp, reserved_blocks, taboo_blocks)) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1113  			up_write(&sdp->sd_log_flush_lock);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1114  			__gfs2_log_reserve(sdp, reserved_blocks, taboo_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1115  			down_write(&sdp->sd_log_flush_lock);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1116  			goto repeat;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1117  		}
2129b4288852cf Andreas Gruenbacher 2020-12-17  1118  		BUG_ON(sdp->sd_log_num_revoke);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1119  	}
fe3e397668775e Andreas Gruenbacher 2020-12-10  1120  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1121  	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1122  		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
f55ab26a8f92a2 Steven Whitehouse   2006-02-21  1123  
5432af15f8772d Andreas Gruenbacher 2022-08-18  1124  	if (unlikely(frozen))
8daf6c2b3d8cee Andreas Gruenbacher 2025-08-05  1125  		if (gfs2_assert_withdraw(sdp, !reserved_revokes))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1126  			goto out_withdraw;
b3b94faa5fe596 David Teigland      2006-01-16  1127  
d7b616e252b125 Steven Whitehouse   2007-09-02  1128  	gfs2_ordered_write(sdp);
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1129  	if (gfs2_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1130  		goto out_withdraw;
d69a3c6561362a Steven Whitehouse   2014-02-21  1131  	lops_before_commit(sdp, tr);
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1132  	if (gfs2_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1133  		goto out_withdraw;
35264909e9d197 Andreas Gruenbacher 2024-03-11 @1134  	if (sdp->sd_jdesc)
4a94f052e09827 Andreas Gruenbacher 2025-12-11  1135  		gfs2_log_submit_write(&sdp->sd_jdesc->jd_log_bio);
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1136  	if (gfs2_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1137  		goto out_withdraw;
d7b616e252b125 Steven Whitehouse   2007-09-02  1138  
34cc1781c2ae92 Steven Whitehouse   2012-03-09  1139  	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
c1696fb85d3319 Bob Peterson        2018-01-17  1140  		log_write_header(sdp, flags);
5cb738b5fbd2f3 Andreas Gruenbacher 2020-12-19  1141  	} else if (sdp->sd_log_tail != sdp->sd_log_flush_tail && !sdp->sd_log_idle) {
c1696fb85d3319 Bob Peterson        2018-01-17  1142  		log_write_header(sdp, flags);
2332c4435bb733 Robert Peterson     2007-06-18  1143  	}
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1144  	if (gfs2_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1145  		goto out_withdraw;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1146  	lops_after_commit(sdp, tr);
b09e593d799560 Steven Whitehouse   2006-04-07  1147  
5a15907f99e5d9 Andreas Gruenbacher 2026-03-20  1148  	spin_lock(&sdp->sd_log_lock);
faa31ce85f626d Steven Whitehouse   2006-09-13  1149  	sdp->sd_log_blks_reserved = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1150  
d6a079e82efd5f Dave Chinner        2011-03-11  1151  	spin_lock(&sdp->sd_ail_lock);
16ca9412d80181 Benjamin Marzinski  2013-04-05  1152  	if (tr && !list_empty(&tr->tr_ail1_list)) {
16ca9412d80181 Benjamin Marzinski  2013-04-05  1153  		list_add(&tr->tr_list, &sdp->sd_ail1_list);
16ca9412d80181 Benjamin Marzinski  2013-04-05  1154  		tr = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1155  	}
d6a079e82efd5f Dave Chinner        2011-03-11  1156  	spin_unlock(&sdp->sd_ail_lock);
5a15907f99e5d9 Andreas Gruenbacher 2026-03-20  1157  	spin_unlock(&sdp->sd_log_lock);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1158  
c1696fb85d3319 Bob Peterson        2018-01-17  1159  	if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
24972557b12ce8 Benjamin Marzinski  2014-05-01  1160  		if (!sdp->sd_log_idle) {
d5dc3d9677394d Bob Peterson        2020-05-22  1161  			empty_ail1_list(sdp);
1b7d498dcab489 Andreas Gruenbacher 2025-08-06  1162  			if (gfs2_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1163  				goto out_withdraw;
c1696fb85d3319 Bob Peterson        2018-01-17  1164  			log_write_header(sdp, flags);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1165  		}
c1696fb85d3319 Bob Peterson        2018-01-17  1166  		if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
c1696fb85d3319 Bob Peterson        2018-01-17  1167  			     GFS2_LOG_HEAD_FLUSH_FREEZE))
24972557b12ce8 Benjamin Marzinski  2014-05-01  1168  			gfs2_log_shutdown(sdp);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1169  	}
24972557b12ce8 Benjamin Marzinski  2014-05-01  1170  
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1171  out_end:
fe3e397668775e Andreas Gruenbacher 2020-12-10  1172  	used_blocks = log_distance(sdp, sdp->sd_log_flush_head, first_log_head);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1173  	reserved_revokes += atomic_read(&sdp->sd_log_revokes_available);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1174  	atomic_set(&sdp->sd_log_revokes_available, sdp->sd_ldptrs);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1175  	gfs2_assert_withdraw(sdp, reserved_revokes % sdp->sd_inptrs == sdp->sd_ldptrs);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1176  	if (reserved_revokes > sdp->sd_ldptrs)
2129b4288852cf Andreas Gruenbacher 2020-12-17  1177  		reserved_blocks += (reserved_revokes - sdp->sd_ldptrs) / sdp->sd_inptrs;
30fe70a85a909a Bob Peterson        2019-11-13  1178  out:
2129b4288852cf Andreas Gruenbacher 2020-12-17  1179  	if (used_blocks != reserved_blocks) {
8daf6c2b3d8cee Andreas Gruenbacher 2025-08-05  1180  		gfs2_assert_withdraw(sdp, used_blocks < reserved_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10 @1181  		gfs2_log_release(sdp, reserved_blocks - used_blocks);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1182  	}
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1183  	gfs2_trans_free(sdp, tr);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1184  	trace_gfs2_log_flush(sdp, 0, flags);
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1185  	return;
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1186  
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1187  out_withdraw:
9e34adb1cc582b Andreas Gruenbacher 2026-03-19  1188  	gfs2_trans_drain(tr);
58e08e8d83ab03 Bob Peterson        2020-06-09  1189  	/**
58e08e8d83ab03 Bob Peterson        2020-06-09  1190  	 * If the tr_list is empty, we're withdrawing during a log
58e08e8d83ab03 Bob Peterson        2020-06-09  1191  	 * flush that targets a transaction, but the transaction was
58e08e8d83ab03 Bob Peterson        2020-06-09  1192  	 * never queued onto any of the ail lists. Here we add it to
58e08e8d83ab03 Bob Peterson        2020-06-09  1193  	 * ail1 just so that ail_drain() will find and free it.
58e08e8d83ab03 Bob Peterson        2020-06-09  1194  	 */
58e08e8d83ab03 Bob Peterson        2020-06-09  1195  	spin_lock(&sdp->sd_ail_lock);
58e08e8d83ab03 Bob Peterson        2020-06-09  1196  	if (tr && list_empty(&tr->tr_list))
58e08e8d83ab03 Bob Peterson        2020-06-09  1197  		list_add(&tr->tr_list, &sdp->sd_ail1_list);
58e08e8d83ab03 Bob Peterson        2020-06-09  1198  	spin_unlock(&sdp->sd_ail_lock);
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1199  	tr = NULL;
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1200  	goto out_end;
b3b94faa5fe596 David Teigland      2006-01-16  1201  }
b3b94faa5fe596 David Teigland      2006-01-16  1202  

:::::: The code at line 1181 was first introduced by commit
:::::: fe3e397668775e20ad0962459733158838b926af gfs2: Rework the log space allocation logic

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
