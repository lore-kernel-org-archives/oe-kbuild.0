Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D01183CC5
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Sep 2024 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724275; cv=none; b=RAoPkQTjkHYBflahIv4HryONS+lXaLXLPYAFWgZ1QtirRdl7vI9iTuB4ekaC0Ifq8VzhNJJLp5Qn7M8P1jtxETnmVx57v56ksDKsZCMwe7c8hd6Wxv4qct3a8IzIb2Nzlacr5Kva4722WCW8rNyjFJzTSQTzCXdzYBhHqXJdkYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724275; c=relaxed/simple;
	bh=ekxmvye1tIo/mMhDO/dM9QPKtFE5zqKEyM63r60jfQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dRjQcDblBcND4HIVhPkJQMfo9sDBJIhx9xtOAqDTYjp9a1f4N/B0khXuwoZleJ3wPkC6lpQ3ta5ABmwHbntVYDTgqC/049uI6/pE8Dhyr5ENGB9DD/FBgboWK1kX2xRtbWRAwbNbS8IVJ8sKB0JIHqKHedhXvuFCIiokeQID5KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XxM8cLrI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XxM8cLrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727724273; x=1759260273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ekxmvye1tIo/mMhDO/dM9QPKtFE5zqKEyM63r60jfQ4=;
  b=XxM8cLrIuCvJM4tqjvQJEr1nbbiunxB84IX3QBWMBDRfCVQUR/RfsVCN
   TvqG9bqXc/4rvgbQBKFB8/V9B17iblLUhyMvR2H0Su6GCURffFsvxiOtK
   Mc66I5jXfDyhM/OtOmCjmYraf7g9JE6j5iJ0nh6c/jaHv0J75/bmQuiwP
   YT+V/+ZXyDXLTpgsmQ37JQDuVSjp2UlETuYo1XgSUTO94xhefwIqBBIli
   QApiFRshWoaS/71qnlbbNd48EN44hS8fR8oxp1HE3i4UXyWWpETFqqN/X
   TNMfT2LuKBuDcFeROKQtzxyCqtiCUtcPH9F0luGGteO7QgtI2siN/lmZr
   w==;
X-CSE-ConnectionGUID: 5XoySrE4RjOMalWgUEXWWg==
X-CSE-MsgGUID: QDdnsqFSRC+AdwmjyLrXiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37976907"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="37976907"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 12:24:33 -0700
X-CSE-ConnectionGUID: FYHFn10vSiGAMhENxztKAA==
X-CSE-MsgGUID: PerH35I/R3mSSW2ef2gYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="73814596"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Sep 2024 12:24:32 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svM0T-000PoH-0D;
	Mon, 30 Sep 2024 19:24:29 +0000
Date: Tue, 1 Oct 2024 03:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid
 reference to the index variable of the iterator on line 1219
Message-ID: <202410010308.raeIz7Hp-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9852d85ec9d492ebef56dc5f229416c925758edc
commit: 30ad1938326bf9303ca38090339d948975a626f5 fanotify: allow "weak" fsid when watching a single filesystem
date:   10 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 10 months ago
config: nios2-randconfig-r062-20240930 (https://download.01.org/0day-ci/archive/20241001/202410010308.raeIz7Hp-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410010308.raeIz7Hp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid reference to the index variable of the iterator on line 1219

vim +1233 fs/notify/fanotify/fanotify_user.c

30ad1938326bf9 Amir Goldstein 2023-11-30  1200  
30ad1938326bf9 Amir Goldstein 2023-11-30  1201  static int fanotify_set_mark_fsid(struct fsnotify_group *group,
30ad1938326bf9 Amir Goldstein 2023-11-30  1202  				  struct fsnotify_mark *mark,
30ad1938326bf9 Amir Goldstein 2023-11-30  1203  				  struct fan_fsid *fsid)
30ad1938326bf9 Amir Goldstein 2023-11-30  1204  {
30ad1938326bf9 Amir Goldstein 2023-11-30  1205  	struct fsnotify_mark_connector *conn;
30ad1938326bf9 Amir Goldstein 2023-11-30  1206  	struct fsnotify_mark *old;
30ad1938326bf9 Amir Goldstein 2023-11-30  1207  	struct super_block *old_sb = NULL;
30ad1938326bf9 Amir Goldstein 2023-11-30  1208  
30ad1938326bf9 Amir Goldstein 2023-11-30  1209  	FANOTIFY_MARK(mark)->fsid = fsid->id;
30ad1938326bf9 Amir Goldstein 2023-11-30  1210  	mark->flags |= FSNOTIFY_MARK_FLAG_HAS_FSID;
30ad1938326bf9 Amir Goldstein 2023-11-30  1211  	if (fsid->weak)
30ad1938326bf9 Amir Goldstein 2023-11-30  1212  		mark->flags |= FSNOTIFY_MARK_FLAG_WEAK_FSID;
30ad1938326bf9 Amir Goldstein 2023-11-30  1213  
30ad1938326bf9 Amir Goldstein 2023-11-30  1214  	/* First mark added will determine if group is single or multi fsid */
30ad1938326bf9 Amir Goldstein 2023-11-30  1215  	if (list_empty(&group->marks_list))
30ad1938326bf9 Amir Goldstein 2023-11-30  1216  		return 0;
30ad1938326bf9 Amir Goldstein 2023-11-30  1217  
30ad1938326bf9 Amir Goldstein 2023-11-30  1218  	/* Find sb of an existing mark */
30ad1938326bf9 Amir Goldstein 2023-11-30 @1219  	list_for_each_entry(old, &group->marks_list, g_list) {
30ad1938326bf9 Amir Goldstein 2023-11-30  1220  		conn = READ_ONCE(old->connector);
30ad1938326bf9 Amir Goldstein 2023-11-30  1221  		if (!conn)
30ad1938326bf9 Amir Goldstein 2023-11-30  1222  			continue;
30ad1938326bf9 Amir Goldstein 2023-11-30  1223  		old_sb = fsnotify_connector_sb(conn);
30ad1938326bf9 Amir Goldstein 2023-11-30  1224  		if (old_sb)
30ad1938326bf9 Amir Goldstein 2023-11-30  1225  			break;
30ad1938326bf9 Amir Goldstein 2023-11-30  1226  	}
30ad1938326bf9 Amir Goldstein 2023-11-30  1227  
30ad1938326bf9 Amir Goldstein 2023-11-30  1228  	/* Only detached marks left? */
30ad1938326bf9 Amir Goldstein 2023-11-30  1229  	if (!old_sb)
30ad1938326bf9 Amir Goldstein 2023-11-30  1230  		return 0;
30ad1938326bf9 Amir Goldstein 2023-11-30  1231  
30ad1938326bf9 Amir Goldstein 2023-11-30  1232  	/* Do not allow mixing of marks with weak and strong fsid */
30ad1938326bf9 Amir Goldstein 2023-11-30 @1233  	if ((mark->flags ^ old->flags) & FSNOTIFY_MARK_FLAG_WEAK_FSID)
30ad1938326bf9 Amir Goldstein 2023-11-30  1234  		return -EXDEV;
30ad1938326bf9 Amir Goldstein 2023-11-30  1235  
30ad1938326bf9 Amir Goldstein 2023-11-30  1236  	/* Allow mixing of marks with strong fsid from different fs */
30ad1938326bf9 Amir Goldstein 2023-11-30  1237  	if (!fsid->weak)
30ad1938326bf9 Amir Goldstein 2023-11-30  1238  		return 0;
30ad1938326bf9 Amir Goldstein 2023-11-30  1239  
30ad1938326bf9 Amir Goldstein 2023-11-30  1240  	/* Do not allow mixing marks with weak fsid from different fs */
30ad1938326bf9 Amir Goldstein 2023-11-30  1241  	if (old_sb != fsid->sb)
30ad1938326bf9 Amir Goldstein 2023-11-30  1242  		return -EXDEV;
30ad1938326bf9 Amir Goldstein 2023-11-30  1243  
30ad1938326bf9 Amir Goldstein 2023-11-30  1244  	/* Do not allow mixing marks from different btrfs sub-volumes */
30ad1938326bf9 Amir Goldstein 2023-11-30  1245  	if (!fanotify_fsid_equal(&FANOTIFY_MARK(old)->fsid,
30ad1938326bf9 Amir Goldstein 2023-11-30  1246  				 &FANOTIFY_MARK(mark)->fsid))
30ad1938326bf9 Amir Goldstein 2023-11-30  1247  		return -EXDEV;
30ad1938326bf9 Amir Goldstein 2023-11-30  1248  
30ad1938326bf9 Amir Goldstein 2023-11-30  1249  	return 0;
30ad1938326bf9 Amir Goldstein 2023-11-30  1250  }
30ad1938326bf9 Amir Goldstein 2023-11-30  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
