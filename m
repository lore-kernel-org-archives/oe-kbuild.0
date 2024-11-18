Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F711A0B0C
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 15:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942530; cv=none; b=ASLfFUzWW/8eIZcVlDn2b34CHUpqUQXRvJQLcvto93eAJKTczmzamhaYAQMpr2mvSivEM3De0QQMOK7GuDVOrUUgIJbyPEueUCEzj0dFPiMw88JYNd3ku81+sZw19a8yoKhCHy2zOIJMmLWWQ5mvFgkTJb635TGQA4dDZmKt/wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942530; c=relaxed/simple;
	bh=3kAYp1tkCIbCCQYkHpbnosGihCKK8ADFY4Y9QLxYRqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIrFARnf/0DgSFcVbNcStGvWaomqGibIDeb/bWrhGVIaJ8MMUPMnButYOPrLnaM7DF5Vp39O54JXDAkuguBUw7OZx5fDeBvK+mL51fo79Xl/oVmoFx+1fNcrYlIjMerNkGqqSN6J9y6Ge97u/om8F4M2lcvyzrS1paPyDjTyRas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5Rx/xRD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5Rx/xRD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731942528; x=1763478528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3kAYp1tkCIbCCQYkHpbnosGihCKK8ADFY4Y9QLxYRqA=;
  b=D5Rx/xRDJmuxsuICKF++RcQSjQWYaFaDf9WqJRF8p6UuX29A1wFAXIL0
   VhCcbInjotcBi/cJRArImOZj2Q2f/FNo7riT7Sw6YfdnkHrh4ssnk2Hlb
   sAXh6H2TgH98K0IJyp3v7FMn+vT0DclEJsTdzfQ31KhRNuvM0kQfl/ajr
   WEbK9Ln0uOCEXTP5aVZ7VHA+y6Oty/mFWapBZFapkbSQiYT6AK8eXOIQK
   KZNq7ho9qyGLbb/32TpP7Coab+6TKe2Ucc932FhIvG27E8okwVZmd3Epp
   rEjW/GgDYclRShveSKuhf/Hz3xFv2S+gwsq5UQ6CUCi6vJBqiMdXVz0Kt
   Q==;
X-CSE-ConnectionGUID: /UtMdFKlRVGDgBjyDt7ECA==
X-CSE-MsgGUID: ORxwtJV+RxCj2d7rdtfmYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="42534735"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="42534735"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 07:08:47 -0800
X-CSE-ConnectionGUID: a7ESY+tUR86jh3kOBBxwpw==
X-CSE-MsgGUID: gOHWvMV8RtmWBSasoq2+bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93328845"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 07:08:46 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD3Mp-0002UZ-32;
	Mon, 18 Nov 2024 15:08:43 +0000
Date: Mon, 18 Nov 2024 23:08:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid
 reference to the index variable of the iterator on line 1219
Message-ID: <202411182345.toGcRvhZ-lkp@intel.com>
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
head:   adc218676eef25575469234709c2d87185ca223a
commit: 30ad1938326bf9303ca38090339d948975a626f5 fanotify: allow "weak" fsid when watching a single filesystem
date:   12 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-054-20241118 (https://download.01.org/0day-ci/archive/20241118/202411182345.toGcRvhZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411182345.toGcRvhZ-lkp@intel.com/

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
