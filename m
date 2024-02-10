Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660023D0A0
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Feb 2024 11:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707565463; cv=none; b=c8ryaDSEzVhrbDlKw5X13vRFn1jA2uWhNzajQNS2WyBVpeRizuhU5DG30CBpSiBTDxfb8UqzJqaGmyRrNv98+j9K4OZS5xvx6cRUNrtL3tnd3JwXYjRFPzvZ1s/0mxAnChMLr1VcIEmIXyKuTgXx/11MVe9LXQeaUFwJJD63SCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707565463; c=relaxed/simple;
	bh=rnHPS0lAYnsh0LU+/xjzDLWg+n1gx/N/mwOFwD5oRIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QGPqlG9uTwTl+cE1us+zD6G20DSoNGWst3NkSg/T+3tWH1oxmdn0jXG1jNYVd5vl1y8Ccg/rBGbCnz4BfwIQbTMSexOLWaYRq42FgqlKOYCyXfR/xoXC62IM5lN37mUiZnGxP1zwMm8nZPN/Vp8KukUgCELH9gPuu/kDxqQorGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aCip56oK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCip56oK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707565459; x=1739101459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnHPS0lAYnsh0LU+/xjzDLWg+n1gx/N/mwOFwD5oRIQ=;
  b=aCip56oK2cB5uaaiU+rfyUxiBVc1efwyi+XLlUjBrQgtlf1NJIbdtQRz
   z7OE/jBJP5kpFmvAYE1B7lBjBUaxe/ArlnbLkn+81P/0u6n7Jg4KZoNUM
   jZdQ+ZF17S7AUtbx4JVITC9ZdGNK1QQm6/tX4Bc9TVJ1biDp+I22S7TVW
   dIitjFdx8dxAiaf73vxJj+WWSuK1k4ZYEet3t1QnGAptLmEU1JFu7oaYP
   lWjo1h1hbdPMF5mnZAdaeyY1suC/SY1RK+Y5xm7sfzQEnZYmrt0iwtuIL
   tW06MriKMcSMPS/UwZfNL4yMUF/cQfitML1nSUEOdGCwUUbWWDh4r8qnY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1700373"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1700373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 03:44:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="39600394"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2024 03:44:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYlmJ-0005cI-2K;
	Sat, 10 Feb 2024 11:44:15 +0000
Date: Sat, 10 Feb 2024 19:43:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-nonmm-unstable 98/98] fs/locks.c:1191 posix_lock_inode()
 warn: iterator used outside loop: 'fl'
Message-ID: <202402101903.iiZjUTlB-lkp@intel.com>
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
TO: Wei Yang <richard.weiyang@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   3ecfe35aea92fbe3fb5dbb680daa91365c87a7b2
commit: 231ff099a7527929783cc949e07879ba55ea6cb5 [98/98] list: leverage list_is_head() for list_entry_is_head()
:::::: branch date: 11 hours ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r081-20240209 (https://download.01.org/0day-ci/archive/20240210/202402101903.iiZjUTlB-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402101903.iiZjUTlB-lkp@intel.com/

New smatch warnings:
fs/locks.c:1191 posix_lock_inode() warn: iterator used outside loop: 'fl'
drivers/media/v4l2-core/v4l2-ctrls-api.c:1091 v4l2_query_ext_ctrl() warn: iterator used outside loop: 'ref'
kernel/power/snapshot.c:643 create_mem_extents() warn: iterator used outside loop: 'ext'

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +/fl +1191 fs/locks.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  1092  
b4d629a39e104a Jeff Layton     2016-01-07  1093  static int posix_lock_inode(struct inode *inode, struct file_lock *request,
b4d629a39e104a Jeff Layton     2016-01-07  1094  			    struct file_lock *conflock)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1095  {
bd61e0a9c852de Jeff Layton     2015-01-16  1096  	struct file_lock *fl, *tmp;
39005d022ad221 Miklos Szeredi  2006-06-23  1097  	struct file_lock *new_fl = NULL;
39005d022ad221 Miklos Szeredi  2006-06-23  1098  	struct file_lock *new_fl2 = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1099  	struct file_lock *left = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1100  	struct file_lock *right = NULL;
bd61e0a9c852de Jeff Layton     2015-01-16  1101  	struct file_lock_context *ctx;
b9746ef80fa696 Jeff Layton     2013-06-21  1102  	int error;
b9746ef80fa696 Jeff Layton     2013-06-21  1103  	bool added = false;
ed9814d85810c2 Jeff Layton     2014-08-11  1104  	LIST_HEAD(dispose);
2443da2259e976 Dai Ngo         2022-05-02  1105  	void *owner;
2443da2259e976 Dai Ngo         2022-05-02  1106  	void (*func)(void);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1107  
5c1c669a1b2435 Jeff Layton     2015-04-03  1108  	ctx = locks_get_lock_context(inode, request->fl_type);
bd61e0a9c852de Jeff Layton     2015-01-16  1109  	if (!ctx)
5c1c669a1b2435 Jeff Layton     2015-04-03  1110  		return (request->fl_type == F_UNLCK) ? 0 : -ENOMEM;
bd61e0a9c852de Jeff Layton     2015-01-16  1111  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1112  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1113  	 * We may need two file_lock structures for this operation,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1114  	 * so we get them in advance to avoid races.
39005d022ad221 Miklos Szeredi  2006-06-23  1115  	 *
39005d022ad221 Miklos Szeredi  2006-06-23  1116  	 * In some cases we can be sure, that no new locks will be needed
^1da177e4c3f41 Linus Torvalds  2005-04-16  1117  	 */
39005d022ad221 Miklos Szeredi  2006-06-23  1118  	if (!(request->fl_flags & FL_ACCESS) &&
39005d022ad221 Miklos Szeredi  2006-06-23  1119  	    (request->fl_type != F_UNLCK ||
39005d022ad221 Miklos Szeredi  2006-06-23  1120  	     request->fl_start != 0 || request->fl_end != OFFSET_MAX)) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1121  		new_fl = locks_alloc_lock();
^1da177e4c3f41 Linus Torvalds  2005-04-16  1122  		new_fl2 = locks_alloc_lock();
39005d022ad221 Miklos Szeredi  2006-06-23  1123  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1124  
2443da2259e976 Dai Ngo         2022-05-02  1125  retry:
02e525b2aff1d6 Peter Zijlstra  2019-02-21  1126  	percpu_down_read(&file_rwsem);
6109c85037e534 Jeff Layton     2015-01-16  1127  	spin_lock(&ctx->flc_lock);
1cb360125966cb Jeff Layton     2013-06-21  1128  	/*
1cb360125966cb Jeff Layton     2013-06-21  1129  	 * New lock request. Walk all POSIX locks and look for conflicts. If
1cb360125966cb Jeff Layton     2013-06-21  1130  	 * there are any, either return error or put the request on the
48f74186546cd5 Jeff Layton     2013-06-21  1131  	 * blocker's list of waiters and the global blocked_hash.
1cb360125966cb Jeff Layton     2013-06-21  1132  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1133  	if (request->fl_type != F_UNLCK) {
bd61e0a9c852de Jeff Layton     2015-01-16  1134  		list_for_each_entry(fl, &ctx->flc_posix, fl_list) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1135  			if (!posix_locks_conflict(request, fl))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1136  				continue;
2443da2259e976 Dai Ngo         2022-05-02  1137  			if (fl->fl_lmops && fl->fl_lmops->lm_lock_expirable
2443da2259e976 Dai Ngo         2022-05-02  1138  				&& (*fl->fl_lmops->lm_lock_expirable)(fl)) {
2443da2259e976 Dai Ngo         2022-05-02  1139  				owner = fl->fl_lmops->lm_mod_owner;
2443da2259e976 Dai Ngo         2022-05-02  1140  				func = fl->fl_lmops->lm_expire_lock;
2443da2259e976 Dai Ngo         2022-05-02  1141  				__module_get(owner);
2443da2259e976 Dai Ngo         2022-05-02  1142  				spin_unlock(&ctx->flc_lock);
2443da2259e976 Dai Ngo         2022-05-02  1143  				percpu_up_read(&file_rwsem);
2443da2259e976 Dai Ngo         2022-05-02  1144  				(*func)();
2443da2259e976 Dai Ngo         2022-05-02  1145  				module_put(owner);
2443da2259e976 Dai Ngo         2022-05-02  1146  				goto retry;
2443da2259e976 Dai Ngo         2022-05-02  1147  			}
5842add2f3b519 Andy Adamson    2006-03-26  1148  			if (conflock)
3fe0fff18fe87c Kinglong Mee    2014-08-22  1149  				locks_copy_conflock(conflock, fl);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1150  			error = -EAGAIN;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1151  			if (!(request->fl_flags & FL_SLEEP))
^1da177e4c3f41 Linus Torvalds  2005-04-16  1152  				goto out;
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1153  			/*
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1154  			 * Deadlock detection and insertion into the blocked
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1155  			 * locks list must be done while holding the same lock!
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1156  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1157  			error = -EDEADLK;
7b2296afb392bc Jeff Layton     2013-06-21  1158  			spin_lock(&blocked_lock_lock);
945ab8f6de9443 Jeff Layton     2019-03-25  1159  			/*
945ab8f6de9443 Jeff Layton     2019-03-25  1160  			 * Ensure that we don't find any locks blocked on this
945ab8f6de9443 Jeff Layton     2019-03-25  1161  			 * request during deadlock detection.
945ab8f6de9443 Jeff Layton     2019-03-25  1162  			 */
945ab8f6de9443 Jeff Layton     2019-03-25  1163  			__locks_wake_up_blocks(request);
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1164  			if (likely(!posix_locks_deadlock(request, fl))) {
bde74e4bc64415 Miklos Szeredi  2008-07-25  1165  				error = FILE_LOCK_DEFERRED;
fd7732e033e30b NeilBrown       2018-11-30  1166  				__locks_insert_block(fl, request,
fd7732e033e30b NeilBrown       2018-11-30  1167  						     posix_locks_conflict);
1c8c601a8c0dc5 Jeff Layton     2013-06-21  1168  			}
7b2296afb392bc Jeff Layton     2013-06-21  1169  			spin_unlock(&blocked_lock_lock);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1170  			goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1171  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1172  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1173  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1174  	/* If we're just looking for a conflict, we're done. */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1175  	error = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1176  	if (request->fl_flags & FL_ACCESS)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1177  		goto out;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1178  
bd61e0a9c852de Jeff Layton     2015-01-16  1179  	/* Find the first old lock with the same owner as the new lock */
bd61e0a9c852de Jeff Layton     2015-01-16  1180  	list_for_each_entry(fl, &ctx->flc_posix, fl_list) {
bd61e0a9c852de Jeff Layton     2015-01-16  1181  		if (posix_same_owner(request, fl))
bd61e0a9c852de Jeff Layton     2015-01-16  1182  			break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1183  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1184  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1185  	/* Process locks with this owner. */
bd61e0a9c852de Jeff Layton     2015-01-16  1186  	list_for_each_entry_safe_from(fl, tmp, &ctx->flc_posix, fl_list) {
bd61e0a9c852de Jeff Layton     2015-01-16  1187  		if (!posix_same_owner(request, fl))
bd61e0a9c852de Jeff Layton     2015-01-16  1188  			break;
bd61e0a9c852de Jeff Layton     2015-01-16  1189  
bd61e0a9c852de Jeff Layton     2015-01-16  1190  		/* Detect adjacent or overlapping regions (if same lock type) */
^1da177e4c3f41 Linus Torvalds  2005-04-16 @1191  		if (request->fl_type == fl->fl_type) {
449231d6ddf50c Olaf Kirch      2005-08-25  1192  			/* In all comparisons of start vs end, use
449231d6ddf50c Olaf Kirch      2005-08-25  1193  			 * "start - 1" rather than "end + 1". If end
449231d6ddf50c Olaf Kirch      2005-08-25  1194  			 * is OFFSET_MAX, end + 1 will become negative.
449231d6ddf50c Olaf Kirch      2005-08-25  1195  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1196  			if (fl->fl_end < request->fl_start - 1)
bd61e0a9c852de Jeff Layton     2015-01-16  1197  				continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1198  			/* If the next lock in the list has entirely bigger
^1da177e4c3f41 Linus Torvalds  2005-04-16  1199  			 * addresses than the new one, insert the lock here.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1200  			 */
449231d6ddf50c Olaf Kirch      2005-08-25  1201  			if (fl->fl_start - 1 > request->fl_end)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1202  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1203  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1204  			/* If we come here, the new and old lock are of the
^1da177e4c3f41 Linus Torvalds  2005-04-16  1205  			 * same type and adjacent or overlapping. Make one
^1da177e4c3f41 Linus Torvalds  2005-04-16  1206  			 * lock yielding from the lower start address of both
^1da177e4c3f41 Linus Torvalds  2005-04-16  1207  			 * locks to the higher end address.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1208  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1209  			if (fl->fl_start > request->fl_start)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1210  				fl->fl_start = request->fl_start;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1211  			else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1212  				request->fl_start = fl->fl_start;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1213  			if (fl->fl_end < request->fl_end)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1214  				fl->fl_end = request->fl_end;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1215  			else
^1da177e4c3f41 Linus Torvalds  2005-04-16  1216  				request->fl_end = fl->fl_end;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1217  			if (added) {
e084c1bd409269 Jeff Layton     2015-02-16  1218  				locks_delete_lock_ctx(fl, &dispose);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1219  				continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1220  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1221  			request = fl;
b9746ef80fa696 Jeff Layton     2013-06-21  1222  			added = true;
bd61e0a9c852de Jeff Layton     2015-01-16  1223  		} else {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1224  			/* Processing for different lock types is a bit
^1da177e4c3f41 Linus Torvalds  2005-04-16  1225  			 * more complex.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1226  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1227  			if (fl->fl_end < request->fl_start)
bd61e0a9c852de Jeff Layton     2015-01-16  1228  				continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1229  			if (fl->fl_start > request->fl_end)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1230  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1231  			if (request->fl_type == F_UNLCK)
b9746ef80fa696 Jeff Layton     2013-06-21  1232  				added = true;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1233  			if (fl->fl_start < request->fl_start)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1234  				left = fl;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1235  			/* If the next lock in the list has a higher end
^1da177e4c3f41 Linus Torvalds  2005-04-16  1236  			 * address than the new one, insert the new one here.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1237  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1238  			if (fl->fl_end > request->fl_end) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1239  				right = fl;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1240  				break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1241  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1242  			if (fl->fl_start >= request->fl_start) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1243  				/* The new lock completely replaces an old
^1da177e4c3f41 Linus Torvalds  2005-04-16  1244  				 * one (This may happen several times).
^1da177e4c3f41 Linus Torvalds  2005-04-16  1245  				 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1246  				if (added) {
e084c1bd409269 Jeff Layton     2015-02-16  1247  					locks_delete_lock_ctx(fl, &dispose);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1248  					continue;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1249  				}
b84d49f9440b2b Jeff Layton     2014-08-12  1250  				/*
b84d49f9440b2b Jeff Layton     2014-08-12  1251  				 * Replace the old lock with new_fl, and
b84d49f9440b2b Jeff Layton     2014-08-12  1252  				 * remove the old one. It's safe to do the
b84d49f9440b2b Jeff Layton     2014-08-12  1253  				 * insert here since we know that we won't be
b84d49f9440b2b Jeff Layton     2014-08-12  1254  				 * using new_fl later, and that the lock is
b84d49f9440b2b Jeff Layton     2014-08-12  1255  				 * just replacing an existing lock.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1256  				 */
b84d49f9440b2b Jeff Layton     2014-08-12  1257  				error = -ENOLCK;
b84d49f9440b2b Jeff Layton     2014-08-12  1258  				if (!new_fl)
b84d49f9440b2b Jeff Layton     2014-08-12  1259  					goto out;
b84d49f9440b2b Jeff Layton     2014-08-12  1260  				locks_copy_lock(new_fl, request);
5ef15968130962 yangerkun       2020-06-01  1261  				locks_move_blocks(new_fl, request);
b84d49f9440b2b Jeff Layton     2014-08-12  1262  				request = new_fl;
b84d49f9440b2b Jeff Layton     2014-08-12  1263  				new_fl = NULL;
e084c1bd409269 Jeff Layton     2015-02-16  1264  				locks_insert_lock_ctx(request, &fl->fl_list);
e084c1bd409269 Jeff Layton     2015-02-16  1265  				locks_delete_lock_ctx(fl, &dispose);
b9746ef80fa696 Jeff Layton     2013-06-21  1266  				added = true;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1267  			}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1268  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1269  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1270  
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1271  	/*
1cb360125966cb Jeff Layton     2013-06-21  1272  	 * The above code only modifies existing locks in case of merging or
1cb360125966cb Jeff Layton     2013-06-21  1273  	 * replacing. If new lock(s) need to be inserted all modifications are
1cb360125966cb Jeff Layton     2013-06-21  1274  	 * done below this, so it's safe yet to bail out.
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1275  	 */
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1276  	error = -ENOLCK; /* "no luck" */
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1277  	if (right && left == right && !new_fl2)
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1278  		goto out;
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1279  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1280  	error = 0;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1281  	if (!added) {
f475ae957db666 Trond Myklebust 2006-06-29  1282  		if (request->fl_type == F_UNLCK) {
f475ae957db666 Trond Myklebust 2006-06-29  1283  			if (request->fl_flags & FL_EXISTS)
f475ae957db666 Trond Myklebust 2006-06-29  1284  				error = -ENOENT;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1285  			goto out;
f475ae957db666 Trond Myklebust 2006-06-29  1286  		}
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1287  
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1288  		if (!new_fl) {
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1289  			error = -ENOLCK;
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1290  			goto out;
0d9a490abe1f69 Miklos Szeredi  2006-06-23  1291  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1292  		locks_copy_lock(new_fl, request);
5946c4319ebb39 NeilBrown       2018-11-30  1293  		locks_move_blocks(new_fl, request);
e084c1bd409269 Jeff Layton     2015-02-16  1294  		locks_insert_lock_ctx(new_fl, &fl->fl_list);
2e2f756f81edd7 Jeff Layton     2015-02-17  1295  		fl = new_fl;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1296  		new_fl = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1297  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1298  	if (right) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1299  		if (left == right) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1300  			/* The new lock breaks the old one in two pieces,
^1da177e4c3f41 Linus Torvalds  2005-04-16  1301  			 * so we have to use the second new lock.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1302  			 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1303  			left = new_fl2;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1304  			new_fl2 = NULL;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1305  			locks_copy_lock(left, right);
e084c1bd409269 Jeff Layton     2015-02-16  1306  			locks_insert_lock_ctx(left, &fl->fl_list);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1307  		}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1308  		right->fl_start = request->fl_end + 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1309  		locks_wake_up_blocks(right);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1310  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1311  	if (left) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  1312  		left->fl_end = request->fl_start - 1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1313  		locks_wake_up_blocks(left);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1314  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1315   out:
6109c85037e534 Jeff Layton     2015-01-16  1316  	spin_unlock(&ctx->flc_lock);
02e525b2aff1d6 Peter Zijlstra  2019-02-21  1317  	percpu_up_read(&file_rwsem);
74f6f5912693ce Will Shiu       2023-07-21  1318  	trace_posix_lock_inode(inode, request, error);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1319  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  1320  	 * Free any unused locks.
^1da177e4c3f41 Linus Torvalds  2005-04-16  1321  	 */
^1da177e4c3f41 Linus Torvalds  2005-04-16  1322  	if (new_fl)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1323  		locks_free_lock(new_fl);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1324  	if (new_fl2)
^1da177e4c3f41 Linus Torvalds  2005-04-16  1325  		locks_free_lock(new_fl2);
ed9814d85810c2 Jeff Layton     2014-08-11  1326  	locks_dispose_list(&dispose);
1890910fd06fef Jeff Layton     2016-01-06  1327  
^1da177e4c3f41 Linus Torvalds  2005-04-16  1328  	return error;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1329  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1330  

:::::: The code at line 1191 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
