Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A764641C98
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 20:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705695439; cv=none; b=cfeVO/eLGxh9Yj7ES9gq7cy4Vm2QWcD2ROMBl/omhj6WnyzJUhlWYSX04ec0naxR1SHz8dlgp1LoslYBmQti83IZ4h74L2LQrYKdkYKQCqxXKnVXGXQSAEk4QsRLmGA3+IF5CiQAUo3hAtrIwXtKhYJB1Y8yjk/roKaRcOFDhxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705695439; c=relaxed/simple;
	bh=hWY39SFGz5hz2n06wYnne3IcRVX9gpJMwDd8gwWfgqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSI8S9sqM5l+eZphZ8aQs3XWZu4o0FDOqjgl8bqfHr6lBaQ9TO4m2LzPU72X69KDjY8eOYwnEp5Vi8YpHovLWxmppGTjdamSi+neWWkRyMgNAKZlzJt0PD+w+bIxRJrMLGdhX0Lt8EBjU1e1FqZPhjBWPX9Hp3zpGmQPZ3lUZuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK2Cele0; arc=none smtp.client-ip=134.134.136.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK2Cele0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705695436; x=1737231436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hWY39SFGz5hz2n06wYnne3IcRVX9gpJMwDd8gwWfgqM=;
  b=ZK2Cele0gqf6b05mRICi4B7YuFrrGuTgRfkzQqn5LLvVUfezA/E3WlM3
   0h4tEdIWcBDXMnE0n/Dvh6usGesopeKS7npzzq+k6mlW+y6to8VC111mU
   mbLAOhQAyK1xiFOsdBz9vBxq/vF4+w4fgjZuEGTvc/1juTxC44czTJcfp
   ALeYr6/MWOVmXvAaFKbw65uADpRlJyUeTvqB0q3sv0GzPhbaqP05lWu5J
   VPfqyYB2YQ9W/dsCIFTgx2wznHsN4NbT6iHguXXedHxrKY6YU0M4mxJ+K
   Ww8x06Miqzyt5DcjeJ6nRwQoLxv0qOpVsGOJIHb82H23HndhKokxv2lnf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="467201723"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="467201723"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 12:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="747005"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jan 2024 12:17:14 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQvIe-0004PA-0y;
	Fri, 19 Jan 2024 20:17:12 +0000
Date: Sat, 20 Jan 2024 04:16:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid
 reference to the index variable of the iterator on line 1219
Message-ID: <202401200402.hYIvCgSX-lkp@intel.com>
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
head:   556e2d17cae620d549c5474b1ece053430cd50bc
commit: 30ad1938326bf9303ca38090339d948975a626f5 fanotify: allow "weak" fsid when watching a single filesystem
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
config: hexagon-randconfig-r061-20240117 (https://download.01.org/0day-ci/archive/20240120/202401200402.hYIvCgSX-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401200402.hYIvCgSX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid reference to the index variable of the iterator on line 1219

vim +1233 fs/notify/fanotify/fanotify_user.c

30ad1938326bf93 Amir Goldstein 2023-11-30  1200  
30ad1938326bf93 Amir Goldstein 2023-11-30  1201  static int fanotify_set_mark_fsid(struct fsnotify_group *group,
30ad1938326bf93 Amir Goldstein 2023-11-30  1202  				  struct fsnotify_mark *mark,
30ad1938326bf93 Amir Goldstein 2023-11-30  1203  				  struct fan_fsid *fsid)
30ad1938326bf93 Amir Goldstein 2023-11-30  1204  {
30ad1938326bf93 Amir Goldstein 2023-11-30  1205  	struct fsnotify_mark_connector *conn;
30ad1938326bf93 Amir Goldstein 2023-11-30  1206  	struct fsnotify_mark *old;
30ad1938326bf93 Amir Goldstein 2023-11-30  1207  	struct super_block *old_sb = NULL;
30ad1938326bf93 Amir Goldstein 2023-11-30  1208  
30ad1938326bf93 Amir Goldstein 2023-11-30  1209  	FANOTIFY_MARK(mark)->fsid = fsid->id;
30ad1938326bf93 Amir Goldstein 2023-11-30  1210  	mark->flags |= FSNOTIFY_MARK_FLAG_HAS_FSID;
30ad1938326bf93 Amir Goldstein 2023-11-30  1211  	if (fsid->weak)
30ad1938326bf93 Amir Goldstein 2023-11-30  1212  		mark->flags |= FSNOTIFY_MARK_FLAG_WEAK_FSID;
30ad1938326bf93 Amir Goldstein 2023-11-30  1213  
30ad1938326bf93 Amir Goldstein 2023-11-30  1214  	/* First mark added will determine if group is single or multi fsid */
30ad1938326bf93 Amir Goldstein 2023-11-30  1215  	if (list_empty(&group->marks_list))
30ad1938326bf93 Amir Goldstein 2023-11-30  1216  		return 0;
30ad1938326bf93 Amir Goldstein 2023-11-30  1217  
30ad1938326bf93 Amir Goldstein 2023-11-30  1218  	/* Find sb of an existing mark */
30ad1938326bf93 Amir Goldstein 2023-11-30 @1219  	list_for_each_entry(old, &group->marks_list, g_list) {
30ad1938326bf93 Amir Goldstein 2023-11-30  1220  		conn = READ_ONCE(old->connector);
30ad1938326bf93 Amir Goldstein 2023-11-30  1221  		if (!conn)
30ad1938326bf93 Amir Goldstein 2023-11-30  1222  			continue;
30ad1938326bf93 Amir Goldstein 2023-11-30  1223  		old_sb = fsnotify_connector_sb(conn);
30ad1938326bf93 Amir Goldstein 2023-11-30  1224  		if (old_sb)
30ad1938326bf93 Amir Goldstein 2023-11-30  1225  			break;
30ad1938326bf93 Amir Goldstein 2023-11-30  1226  	}
30ad1938326bf93 Amir Goldstein 2023-11-30  1227  
30ad1938326bf93 Amir Goldstein 2023-11-30  1228  	/* Only detached marks left? */
30ad1938326bf93 Amir Goldstein 2023-11-30  1229  	if (!old_sb)
30ad1938326bf93 Amir Goldstein 2023-11-30  1230  		return 0;
30ad1938326bf93 Amir Goldstein 2023-11-30  1231  
30ad1938326bf93 Amir Goldstein 2023-11-30  1232  	/* Do not allow mixing of marks with weak and strong fsid */
30ad1938326bf93 Amir Goldstein 2023-11-30 @1233  	if ((mark->flags ^ old->flags) & FSNOTIFY_MARK_FLAG_WEAK_FSID)
30ad1938326bf93 Amir Goldstein 2023-11-30  1234  		return -EXDEV;
30ad1938326bf93 Amir Goldstein 2023-11-30  1235  
30ad1938326bf93 Amir Goldstein 2023-11-30  1236  	/* Allow mixing of marks with strong fsid from different fs */
30ad1938326bf93 Amir Goldstein 2023-11-30  1237  	if (!fsid->weak)
30ad1938326bf93 Amir Goldstein 2023-11-30  1238  		return 0;
30ad1938326bf93 Amir Goldstein 2023-11-30  1239  
30ad1938326bf93 Amir Goldstein 2023-11-30  1240  	/* Do not allow mixing marks with weak fsid from different fs */
30ad1938326bf93 Amir Goldstein 2023-11-30  1241  	if (old_sb != fsid->sb)
30ad1938326bf93 Amir Goldstein 2023-11-30  1242  		return -EXDEV;
30ad1938326bf93 Amir Goldstein 2023-11-30  1243  
30ad1938326bf93 Amir Goldstein 2023-11-30  1244  	/* Do not allow mixing marks from different btrfs sub-volumes */
30ad1938326bf93 Amir Goldstein 2023-11-30  1245  	if (!fanotify_fsid_equal(&FANOTIFY_MARK(old)->fsid,
30ad1938326bf93 Amir Goldstein 2023-11-30  1246  				 &FANOTIFY_MARK(mark)->fsid))
30ad1938326bf93 Amir Goldstein 2023-11-30  1247  		return -EXDEV;
30ad1938326bf93 Amir Goldstein 2023-11-30  1248  
30ad1938326bf93 Amir Goldstein 2023-11-30  1249  	return 0;
30ad1938326bf93 Amir Goldstein 2023-11-30  1250  }
30ad1938326bf93 Amir Goldstein 2023-11-30  1251  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
