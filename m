Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4917080B
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 18:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733769278; cv=none; b=rsjiIxdp3gQiPvKfwP3i/FRR1MUbL+3q7Jyv96uGAXP7I7T+DdvHku+X7jUm7dHYzmubcbmQsuGR4W3wuLahsNpJaTJSCntQH1YPRPwla3kn2OFlWY7Bl8Pquq+iMB+LAF79pj+q2dj0YNkEPTkKRh/qA8PoatAFf+/RbsTlP78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733769278; c=relaxed/simple;
	bh=xdSlSTNMcxaaSu7Ardys/DOcDvfDagYNPu/sBhTtfVc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aaYWl0KALhCZyybnpf/4lu4Dto9mwhqUQ5CtTib/zlqXVzsS9hteU33ONaNRoA0ZyK3KDngn1X2S8bGyH77gEE5VMXmmhHfwB6TzQvUC+eGSy6v3FEYDLE25iUUmM+B37+tC+WsmJ73gIlA1miTEUX2lSjlCr37DFmWxS1udX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efGtiyij; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efGtiyij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733769277; x=1765305277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xdSlSTNMcxaaSu7Ardys/DOcDvfDagYNPu/sBhTtfVc=;
  b=efGtiyijM6wHNlSBFDy1+/oT4z3qHdXOJVwqJxgVPLl6M6U5sR+JdgmT
   JP4YSyUtVZ/1ztb5QWwWMxk/UelcH5sCBxEETP7ZtIgouXX4KDaggf/4e
   tHIajHd2BskK8Yn5vb7Awkdqu7B050ePdHT+sJath3loIfoofaXZns8Vu
   Tm5vpb/nWu/QxGNEszTagH6PeTG3+zdW0UsPeB98L3Bn9ZnVQ4sl3GGfn
   zvDWsLxgK4x88Z6D75Y8Js4HfH7B30tOW5C9IldrT4NQ8KUaCOQtrdX7v
   2w993NrzN3ZLWPv3/51WtmimHYwdog8sPYVrVi5reCV+1WD3vX+DjJ7mG
   w==;
X-CSE-ConnectionGUID: +FJd7saXR666PTcX0rtXIw==
X-CSE-MsgGUID: GmUf8SJKTnmSgdHEgrlVKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34231148"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34231148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 10:34:36 -0800
X-CSE-ConnectionGUID: Vv9d54VxRret0mziGW6k0Q==
X-CSE-MsgGUID: wAbGM2BnQy6t5B8MQjbTCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="99970595"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Dec 2024 10:34:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKiaW-0004hx-2V;
	Mon, 09 Dec 2024 18:34:32 +0000
Date: Tue, 10 Dec 2024 02:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/notify/fanotify/fanotify_user.c:1233:20-23: ERROR: invalid
 reference to the index variable of the iterator on line 1219
Message-ID: <202412100248.IRl1qnuh-lkp@intel.com>
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
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 30ad1938326bf9303ca38090339d948975a626f5 fanotify: allow "weak" fsid when watching a single filesystem
date:   1 year ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year ago
config: i386-randconfig-053-20241209 (https://download.01.org/0day-ci/archive/20241210/202412100248.IRl1qnuh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412100248.IRl1qnuh-lkp@intel.com/

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
