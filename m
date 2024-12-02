Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60431C32
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Dec 2024 03:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733109347; cv=none; b=q2VY7twKY9N79lWRjChxLMCGA19JPAcZF6ST6KS8a+F5lf6XL/mQ4XBwyg9ppfBgZB4j73yJZdP70LOghOHGupr5YvgSMxCi+aGrJcBsaAUwsH7W4svL0ixevNzFJzZicakiKpsO0Vu7scA+YBPTLpd4d9gYTSmpZJxyg6AQHIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733109347; c=relaxed/simple;
	bh=71Tp+4GDuM+wayW/w4YVvYpxjqttNd9KKf5Y2nKgYw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RHMBWoOqyzNLQ3fk+urb9Wi2crCM5SLu0cAOaaQNTeKuRBVKDpI9tqs2IILrRNdYlOm2jguROY8kbkbJx1FHmg7LBbf3lBw8sNrVinB6nVig51dxFXmPxjgqYcvr36B79c1DrOytvMBkMpFFZHAnn6r61iPYYpOvJsl56c53PF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7GS20nj; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7GS20nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733109345; x=1764645345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=71Tp+4GDuM+wayW/w4YVvYpxjqttNd9KKf5Y2nKgYw0=;
  b=D7GS20njeXVAbJx11uEC1Z8b084URROtX9VVuecC6DjNC/PZ+xN77adM
   Y/vEG235SpW5r7bZ7fOyGymJZODMRC1vV3/DPBe+3eEK/baYZIz/7nws9
   msnE3kvVPwZlse3uNnWy9e+TDg29sj3j3ePAtZvJQPSVyPbwn7P4A/D/Q
   lmNyJ633sHk0Vhn7XAoTrbAiUXySKKMEVdm5lYSa8OdWBcuArQpa0cvfc
   osVglUGenh0/8GC0z+hjq23KJ0Vw6tlkFDWzbq83Gv+5ZYUR/7kthg6x8
   UY41QuW+2dBp08I7C99utmit4z+RKmQZoKe2AHgN825w1z2whq33cgTLQ
   g==;
X-CSE-ConnectionGUID: 11gfwYfrRaOgu7gJIRc4Xw==
X-CSE-MsgGUID: wv+dnGnhR2+9BJW3uw2C8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="43747224"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="43747224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 19:15:44 -0800
X-CSE-ConnectionGUID: oPEzD+UzRkq8CZIW6h9Hyg==
X-CSE-MsgGUID: YBA1PJuATbCe3INKEy6i4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="92891198"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2024 19:15:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHwuF-00022n-1Y;
	Mon, 02 Dec 2024 03:15:36 +0000
Date: Mon, 2 Dec 2024 11:14:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid
 reference to the index variable of the iterator on line 1219
Message-ID: <202412021154.5uFNariI-lkp@intel.com>
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
head:   40384c840ea1944d7c5a392e8975ed088ecf0b37
commit: 30ad1938326bf9303ca38090339d948975a626f5 fanotify: allow "weak" fsid when watching a single filesystem
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: i386-randconfig-054-20241118 (https://download.01.org/0day-ci/archive/20241202/202412021154.5uFNariI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412021154.5uFNariI-lkp@intel.com/

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
