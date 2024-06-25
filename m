Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667441E494
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Jun 2024 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719278380; cv=none; b=lyiB0BCZ3GosR9JHuDPe3ew/bmgzsgCI/cj1WDxE10Is+Yf9/9N+eCvYrtgXvcpDc9Gd44xy6wa/7F5OWJsp0csJ2e0NJu0w/1FoACJTXrjE1BANA25GGEiybvfRnIIWTv/4gbWUVBvh6fYttTyBxRVO0fORzelJn/yCWBk2tBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719278380; c=relaxed/simple;
	bh=ojx7BzNk76ODt32b0VYcow6k4KvphLI4z3VtrQ5opbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcPJyxKwxSVCW1bHxmlsDHP0DqBZd3icvovJ+Beubhm8jjYZMz6C1xnNeKbWc8/VVWUs+OwguhkE88nmGPOr8yONsqhCthx+gj/++p3VDM0tSZna7JKlMuug8371KfQJE9dRGWir7POkz3PmgtL+9TvdhZCo9bmdq7/U1fbw4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcP6ps4a; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcP6ps4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719278378; x=1750814378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ojx7BzNk76ODt32b0VYcow6k4KvphLI4z3VtrQ5opbI=;
  b=bcP6ps4axLz1jUbOqVK4tLtJKEbbMFdKIGzh/p7AaJVQhGgbN1rBXMlc
   m7OkfJthE2xvPlc4cxH6DZToAyHAKXO4mj1YgQTjC32VsWiY70J9t5vhL
   gGPfJxzWAezjzUTXdaaCAMKkIC4Y7mYynoMi/AAag6Olhn7rn4WXsp9oL
   cvk3853YuOPJ4G2Uq0RlkcZ4mxEl2TV9twMKglre70yCiYRfi+WycJna6
   NvQspYEYOuvugHDLoMeCAm+nzSIEKzNVAC4lAnWAbKRKONOVW1EHSlXs3
   YK98kKW7YlgFWGw/1wm4owe/VUPVi9VE2BT2pWZKDA+Yfa3ducD3OGkAt
   Q==;
X-CSE-ConnectionGUID: wB8xAViRTEm/mASIKEpcgQ==
X-CSE-MsgGUID: +nIXt0vQR3qT1sI83mLAYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20087335"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="20087335"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 18:19:37 -0700
X-CSE-ConnectionGUID: T5EARf0STrWMAow03icOyg==
X-CSE-MsgGUID: 9rIMApZzQuW1E2E7Ncn6Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43289414"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 Jun 2024 18:19:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLuqL-000DtS-2s;
	Tue, 25 Jun 2024 01:19:33 +0000
Date: Tue, 25 Jun 2024 09:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/gfs2/log.c:1158 gfs2_log_flush() error: we previously assumed
 'sdp->sd_jdesc' could be null (see line 1111)
Message-ID: <202406250943.QhOuua0F-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   55027e689933ba2e64f3d245fb1ff185b3e7fc81
commit: 35264909e9d1973ab9aaa2a1b07cda70f12bb828 gfs2: Fix NULL pointer dereference in gfs2_log_flush
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r071-20240623 (https://download.01.org/0day-ci/archive/20240625/202406250943.QhOuua0F-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406250943.QhOuua0F-lkp@intel.com/

smatch warnings:
fs/gfs2/log.c:1158 gfs2_log_flush() error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1111)

vim +1158 fs/gfs2/log.c

462582b99b6079 Bob Peterson        2020-08-21  1031  
b3b94faa5fe596 David Teigland      2006-01-16  1032  /**
b09e593d799560 Steven Whitehouse   2006-04-07  1033   * gfs2_log_flush - flush incore transaction(s)
c551f66c5dfefd Lee Jones           2021-03-30  1034   * @sdp: The filesystem
b3b94faa5fe596 David Teigland      2006-01-16  1035   * @gl: The glock structure to flush.  If NULL, flush the whole incore log
805c090750a315 Bob Peterson        2018-01-08  1036   * @flags: The log header flags: GFS2_LOG_HEAD_FLUSH_* and debug flags
b3b94faa5fe596 David Teigland      2006-01-16  1037   *
b3b94faa5fe596 David Teigland      2006-01-16  1038   */
b3b94faa5fe596 David Teigland      2006-01-16  1039  
c1696fb85d3319 Bob Peterson        2018-01-17  1040  void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
b3b94faa5fe596 David Teigland      2006-01-16  1041  {
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1042  	struct gfs2_trans *tr = NULL;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1043  	unsigned int reserved_blocks = 0, used_blocks = 0;
5432af15f8772d Andreas Gruenbacher 2022-08-18  1044  	bool frozen = test_bit(SDF_FROZEN, &sdp->sd_flags);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1045  	unsigned int first_log_head;
2129b4288852cf Andreas Gruenbacher 2020-12-17  1046  	unsigned int reserved_revokes = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1047  
484adff8a06cb5 Steven Whitehouse   2006-03-29  1048  	down_write(&sdp->sd_log_flush_lock);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1049  	trace_gfs2_log_flush(sdp, 1, flags);
b3b94faa5fe596 David Teigland      2006-01-16  1050  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1051  repeat:
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1052  	/*
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1053  	 * Do this check while holding the log_flush_lock to prevent new
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1054  	 * buffers from being added to the ail via gfs2_pin()
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1055  	 */
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1056  	if (gfs2_withdrawing_or_withdrawn(sdp) ||
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1057  	    !test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1058  		goto out;
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1059  
2bcd610d2fdea6 Steven Whitehouse   2007-11-08  1060  	/* Log might have been flushed while we waited for the flush lock */
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1061  	if (gl && !test_bit(GLF_LFLUSH, &gl->gl_flags))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1062  		goto out;
f55ab26a8f92a2 Steven Whitehouse   2006-02-21  1063  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1064  	first_log_head = sdp->sd_log_head;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1065  	sdp->sd_log_flush_head = first_log_head;
400ac52e805bb6 Benjamin Marzinski  2015-12-09  1066  
16ca9412d80181 Benjamin Marzinski  2013-04-05  1067  	tr = sdp->sd_log_tr;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1068  	if (tr || sdp->sd_log_num_revoke) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1069  		if (reserved_blocks)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1070  			gfs2_log_release(sdp, reserved_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1071  		reserved_blocks = sdp->sd_log_blks_reserved;
2129b4288852cf Andreas Gruenbacher 2020-12-17  1072  		reserved_revokes = sdp->sd_log_num_revoke;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1073  		if (tr) {
16ca9412d80181 Benjamin Marzinski  2013-04-05  1074  			sdp->sd_log_tr = NULL;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1075  			tr->tr_first = first_log_head;
5432af15f8772d Andreas Gruenbacher 2022-08-18  1076  			if (unlikely(frozen)) {
ca399c96e96e3f Bob Peterson        2020-01-08  1077  				if (gfs2_assert_withdraw_delayed(sdp,
ca399c96e96e3f Bob Peterson        2020-01-08  1078  				       !tr->tr_num_buf_new && !tr->tr_num_databuf_new))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1079  					goto out_withdraw;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1080  			}
2129b4288852cf Andreas Gruenbacher 2020-12-17  1081  		}
fe3e397668775e Andreas Gruenbacher 2020-12-10  1082  	} else if (!reserved_blocks) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1083  		unsigned int taboo_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1084  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1085  		reserved_blocks = GFS2_LOG_FLUSH_MIN_BLOCKS;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1086  		if (current == sdp->sd_logd_process)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1087  			taboo_blocks = 0;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1088  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1089  		if (!__gfs2_log_try_reserve(sdp, reserved_blocks, taboo_blocks)) {
fe3e397668775e Andreas Gruenbacher 2020-12-10  1090  			up_write(&sdp->sd_log_flush_lock);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1091  			__gfs2_log_reserve(sdp, reserved_blocks, taboo_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1092  			down_write(&sdp->sd_log_flush_lock);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1093  			goto repeat;
fe3e397668775e Andreas Gruenbacher 2020-12-10  1094  		}
2129b4288852cf Andreas Gruenbacher 2020-12-17  1095  		BUG_ON(sdp->sd_log_num_revoke);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1096  	}
fe3e397668775e Andreas Gruenbacher 2020-12-10  1097  
fe3e397668775e Andreas Gruenbacher 2020-12-10  1098  	if (flags & GFS2_LOG_HEAD_FLUSH_SHUTDOWN)
fe3e397668775e Andreas Gruenbacher 2020-12-10  1099  		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
f55ab26a8f92a2 Steven Whitehouse   2006-02-21  1100  
5432af15f8772d Andreas Gruenbacher 2022-08-18  1101  	if (unlikely(frozen))
2129b4288852cf Andreas Gruenbacher 2020-12-17  1102  		if (gfs2_assert_withdraw_delayed(sdp, !reserved_revokes))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1103  			goto out_withdraw;
b3b94faa5fe596 David Teigland      2006-01-16  1104  
d7b616e252b125 Steven Whitehouse   2007-09-02  1105  	gfs2_ordered_write(sdp);
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1106  	if (gfs2_withdrawing_or_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1107  		goto out_withdraw;
d69a3c6561362a Steven Whitehouse   2014-02-21  1108  	lops_before_commit(sdp, tr);
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1109  	if (gfs2_withdrawing_or_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1110  		goto out_withdraw;
35264909e9d197 Andreas Gruenbacher 2024-03-11 @1111  	if (sdp->sd_jdesc)
82218943058d5e Bob Peterson        2021-01-21  1112  		gfs2_log_submit_bio(&sdp->sd_jdesc->jd_log_bio, REQ_OP_WRITE);
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1113  	if (gfs2_withdrawing_or_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1114  		goto out_withdraw;
d7b616e252b125 Steven Whitehouse   2007-09-02  1115  
34cc1781c2ae92 Steven Whitehouse   2012-03-09  1116  	if (sdp->sd_log_head != sdp->sd_log_flush_head) {
c1696fb85d3319 Bob Peterson        2018-01-17  1117  		log_write_header(sdp, flags);
5cb738b5fbd2f3 Andreas Gruenbacher 2020-12-19  1118  	} else if (sdp->sd_log_tail != sdp->sd_log_flush_tail && !sdp->sd_log_idle) {
c1696fb85d3319 Bob Peterson        2018-01-17  1119  		log_write_header(sdp, flags);
2332c4435bb733 Robert Peterson     2007-06-18  1120  	}
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1121  	if (gfs2_withdrawing_or_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1122  		goto out_withdraw;
16ca9412d80181 Benjamin Marzinski  2013-04-05  1123  	lops_after_commit(sdp, tr);
b09e593d799560 Steven Whitehouse   2006-04-07  1124  
fe1a698ffef5af Steven Whitehouse   2006-10-11  1125  	gfs2_log_lock(sdp);
faa31ce85f626d Steven Whitehouse   2006-09-13  1126  	sdp->sd_log_blks_reserved = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1127  
d6a079e82efd5f Dave Chinner        2011-03-11  1128  	spin_lock(&sdp->sd_ail_lock);
16ca9412d80181 Benjamin Marzinski  2013-04-05  1129  	if (tr && !list_empty(&tr->tr_ail1_list)) {
16ca9412d80181 Benjamin Marzinski  2013-04-05  1130  		list_add(&tr->tr_list, &sdp->sd_ail1_list);
16ca9412d80181 Benjamin Marzinski  2013-04-05  1131  		tr = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1132  	}
d6a079e82efd5f Dave Chinner        2011-03-11  1133  	spin_unlock(&sdp->sd_ail_lock);
b3b94faa5fe596 David Teigland      2006-01-16  1134  	gfs2_log_unlock(sdp);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1135  
c1696fb85d3319 Bob Peterson        2018-01-17  1136  	if (!(flags & GFS2_LOG_HEAD_FLUSH_NORMAL)) {
24972557b12ce8 Benjamin Marzinski  2014-05-01  1137  		if (!sdp->sd_log_idle) {
d5dc3d9677394d Bob Peterson        2020-05-22  1138  			empty_ail1_list(sdp);
4d927b03a68846 Andreas Gruenbacher 2023-12-20  1139  			if (gfs2_withdrawing_or_withdrawn(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1140  				goto out_withdraw;
c1696fb85d3319 Bob Peterson        2018-01-17  1141  			log_write_header(sdp, flags);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1142  		}
c1696fb85d3319 Bob Peterson        2018-01-17  1143  		if (flags & (GFS2_LOG_HEAD_FLUSH_SHUTDOWN |
c1696fb85d3319 Bob Peterson        2018-01-17  1144  			     GFS2_LOG_HEAD_FLUSH_FREEZE))
24972557b12ce8 Benjamin Marzinski  2014-05-01  1145  			gfs2_log_shutdown(sdp);
24972557b12ce8 Benjamin Marzinski  2014-05-01  1146  	}
24972557b12ce8 Benjamin Marzinski  2014-05-01  1147  
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1148  out_end:
fe3e397668775e Andreas Gruenbacher 2020-12-10  1149  	used_blocks = log_distance(sdp, sdp->sd_log_flush_head, first_log_head);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1150  	reserved_revokes += atomic_read(&sdp->sd_log_revokes_available);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1151  	atomic_set(&sdp->sd_log_revokes_available, sdp->sd_ldptrs);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1152  	gfs2_assert_withdraw(sdp, reserved_revokes % sdp->sd_inptrs == sdp->sd_ldptrs);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1153  	if (reserved_revokes > sdp->sd_ldptrs)
2129b4288852cf Andreas Gruenbacher 2020-12-17  1154  		reserved_blocks += (reserved_revokes - sdp->sd_ldptrs) / sdp->sd_inptrs;
30fe70a85a909a Bob Peterson        2019-11-13  1155  out:
2129b4288852cf Andreas Gruenbacher 2020-12-17  1156  	if (used_blocks != reserved_blocks) {
2129b4288852cf Andreas Gruenbacher 2020-12-17  1157  		gfs2_assert_withdraw_delayed(sdp, used_blocks < reserved_blocks);
fe3e397668775e Andreas Gruenbacher 2020-12-10 @1158  		gfs2_log_release(sdp, reserved_blocks - used_blocks);
2129b4288852cf Andreas Gruenbacher 2020-12-17  1159  	}
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1160  	up_write(&sdp->sd_log_flush_lock);
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1161  	gfs2_trans_free(sdp, tr);
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1162  	if (gfs2_withdrawing(sdp))
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1163  		gfs2_withdraw(sdp);
fe3e397668775e Andreas Gruenbacher 2020-12-10  1164  	trace_gfs2_log_flush(sdp, 0, flags);
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1165  	return;
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1166  
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1167  out_withdraw:
462582b99b6079 Bob Peterson        2020-08-21  1168  	trans_drain(tr);
58e08e8d83ab03 Bob Peterson        2020-06-09  1169  	/**
58e08e8d83ab03 Bob Peterson        2020-06-09  1170  	 * If the tr_list is empty, we're withdrawing during a log
58e08e8d83ab03 Bob Peterson        2020-06-09  1171  	 * flush that targets a transaction, but the transaction was
58e08e8d83ab03 Bob Peterson        2020-06-09  1172  	 * never queued onto any of the ail lists. Here we add it to
58e08e8d83ab03 Bob Peterson        2020-06-09  1173  	 * ail1 just so that ail_drain() will find and free it.
58e08e8d83ab03 Bob Peterson        2020-06-09  1174  	 */
58e08e8d83ab03 Bob Peterson        2020-06-09  1175  	spin_lock(&sdp->sd_ail_lock);
58e08e8d83ab03 Bob Peterson        2020-06-09  1176  	if (tr && list_empty(&tr->tr_list))
58e08e8d83ab03 Bob Peterson        2020-06-09  1177  		list_add(&tr->tr_list, &sdp->sd_ail1_list);
58e08e8d83ab03 Bob Peterson        2020-06-09  1178  	spin_unlock(&sdp->sd_ail_lock);
2ca0c2fbf3ed7f Bob Peterson        2019-11-13  1179  	tr = NULL;
5a61ae1402f152 Andreas Gruenbacher 2020-08-28  1180  	goto out_end;
b3b94faa5fe596 David Teigland      2006-01-16  1181  }
b3b94faa5fe596 David Teigland      2006-01-16  1182  

:::::: The code at line 1158 was first introduced by commit
:::::: fe3e397668775e20ad0962459733158838b926af gfs2: Rework the log space allocation logic

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
