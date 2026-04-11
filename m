Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F0929BD88
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892316; cv=none; b=Zb2jPBKSr8aB3OMZsj4nh4pEN9Ims6PKKmQGhU1Mzj1/Sd/GfgKsrwRtNJE48ZFGueJ23/UHIucbLkMebQ6v81ZQH/eYT0DYEOPaZjP5sESnFLYcIiWAn6+V/TOgdTJq8oHZDlDhd8DIpNzTtRzue6gZ6Xrz46TbtoruqKL2fF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892316; c=relaxed/simple;
	bh=ScKR3UOCjlonoSdYLT6uXGxRKGcaHqkEa76M+oQ7nhU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k6Q9vuTIXytjwmNpvBWUbiTBT1dBRWDLIk9TUMfiOfDd5EI6eCtQJkH99QvryCnPH65/761qJm6U7f4vNV+zv2Pr63E8WbPmNGQQWOgQNwUBmhUOfnhKzK54wELwM8pAwri7Rv3DG9s/H8AneMJ6pLPRjZb8Hxi2tmcCdIa1jiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbwJjF9M; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbwJjF9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775892314; x=1807428314;
  h=date:from:to:cc:subject:message-id;
  bh=ScKR3UOCjlonoSdYLT6uXGxRKGcaHqkEa76M+oQ7nhU=;
  b=gbwJjF9MmTr/qEjE/WJ6W7gDArgPb7smrnQTFtMg/f8PgN0UQkShR8my
   CBnCc4s1FY5tYPQqOVl05pQ//ikIvWOsOtsmrJ4kMPY4x219tx0Hgoudz
   mD7c56OBeFlH1HhQXfNM5HDzzw8iN9qOLLrzxfhVW1GP6Baq/qHv+/b+n
   YzCPJxcFKceDv6WX02hWfnZhsBXeFEJxJ4V4B83DWczZrU1FiBHAqmbcm
   TTwpex4Mk/JUeH2DfQu3Z94udN3WTeOtxZrqXUuK7d6VHoVJWb6WfwJX0
   yMF5mJlAp6+j+NBJW0BhbwlPRud23SUYiPm5grNDhP/AUjuu+WSoAW9Ev
   g==;
X-CSE-ConnectionGUID: ArSUllZ0SFS9tblsCAkcFA==
X-CSE-MsgGUID: /Jvy0akmRtOCAju6dVZm/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88292472"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="88292472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 00:25:13 -0700
X-CSE-ConnectionGUID: sF+0XWHpRmCzwmHOYUiLSA==
X-CSE-MsgGUID: Jo2qJJzVRqOAWXeG7NFU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229214858"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2026 00:25:12 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBSiL-000000000wv-2v8d;
	Sat, 11 Apr 2026 07:25:09 +0000
Date: Sat, 11 Apr 2026 15:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [net-next:main 37/39]
 drivers/net/dsa/mxl862xx/mxl862xx.c:942 mxl862xx_vf_del_vid() warn: iterator
 used outside loop: 'last_ve'
Message-ID: <202604111508.AZWFGSvb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: netdev@vger.kernel.org
TO: Daniel Golle <daniel@makrotopia.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git main
head:   3f3a2aefbc661b837c8e344f944982d61c2ae037
commit: d587f9b6dcc98c1e8aeb5c189a7bfac60d6d29ac [37/39] net: dsa: mxl862xx: implement VLAN functionality
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-161-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111508.AZWFGSvb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604111508.AZWFGSvb-lkp@intel.com/

smatch warnings:
drivers/net/dsa/mxl862xx/mxl862xx.c:942 mxl862xx_vf_del_vid() warn: iterator used outside loop: 'last_ve'

vim +/last_ve +942 drivers/net/dsa/mxl862xx/mxl862xx.c

d587f9b6dcc98c Daniel Golle 2026-04-07  904  
d587f9b6dcc98c Daniel Golle 2026-04-07  905  static int mxl862xx_vf_del_vid(struct mxl862xx_priv *priv,
d587f9b6dcc98c Daniel Golle 2026-04-07  906  			       struct mxl862xx_vf_block *vf, u16 vid)
d587f9b6dcc98c Daniel Golle 2026-04-07  907  {
d587f9b6dcc98c Daniel Golle 2026-04-07  908  	struct mxl862xx_vf_vid *ve, *last_ve;
d587f9b6dcc98c Daniel Golle 2026-04-07  909  	u16 gap, last;
d587f9b6dcc98c Daniel Golle 2026-04-07  910  	int ret;
d587f9b6dcc98c Daniel Golle 2026-04-07  911  
d587f9b6dcc98c Daniel Golle 2026-04-07  912  	ve = mxl862xx_vf_find_vid(vf, vid);
d587f9b6dcc98c Daniel Golle 2026-04-07  913  	if (!ve)
d587f9b6dcc98c Daniel Golle 2026-04-07  914  		return 0;
d587f9b6dcc98c Daniel Golle 2026-04-07  915  
d587f9b6dcc98c Daniel Golle 2026-04-07  916  	if (!vf->allocated) {
d587f9b6dcc98c Daniel Golle 2026-04-07  917  		/* Software-only state -- just remove the tracking entry */
d587f9b6dcc98c Daniel Golle 2026-04-07  918  		list_del(&ve->list);
d587f9b6dcc98c Daniel Golle 2026-04-07  919  		kfree(ve);
d587f9b6dcc98c Daniel Golle 2026-04-07  920  		vf->active_count--;
d587f9b6dcc98c Daniel Golle 2026-04-07  921  		return 0;
d587f9b6dcc98c Daniel Golle 2026-04-07  922  	}
d587f9b6dcc98c Daniel Golle 2026-04-07  923  
d587f9b6dcc98c Daniel Golle 2026-04-07  924  	gap = ve->index;
d587f9b6dcc98c Daniel Golle 2026-04-07  925  	last = vf->active_count - 1;
d587f9b6dcc98c Daniel Golle 2026-04-07  926  
d587f9b6dcc98c Daniel Golle 2026-04-07  927  	if (vf->active_count == 1) {
d587f9b6dcc98c Daniel Golle 2026-04-07  928  		/* Last VID -- restore DISCARD sentinel at index 0 */
d587f9b6dcc98c Daniel Golle 2026-04-07  929  		ret = mxl862xx_vf_entry_discard(priv, vf->block_id, 0);
d587f9b6dcc98c Daniel Golle 2026-04-07  930  		if (ret)
d587f9b6dcc98c Daniel Golle 2026-04-07  931  			return ret;
d587f9b6dcc98c Daniel Golle 2026-04-07  932  	} else if (gap < last) {
d587f9b6dcc98c Daniel Golle 2026-04-07  933  		/* Swap: move the last ALLOW entry into the gap */
d587f9b6dcc98c Daniel Golle 2026-04-07  934  		list_for_each_entry(last_ve, &vf->vids, list)
d587f9b6dcc98c Daniel Golle 2026-04-07  935  			if (last_ve->index == last)
d587f9b6dcc98c Daniel Golle 2026-04-07  936  				break;
d587f9b6dcc98c Daniel Golle 2026-04-07  937  
d587f9b6dcc98c Daniel Golle 2026-04-07  938  		if (WARN_ON(list_entry_is_head(last_ve, &vf->vids, list)))
d587f9b6dcc98c Daniel Golle 2026-04-07  939  			return -EINVAL;
d587f9b6dcc98c Daniel Golle 2026-04-07  940  
d587f9b6dcc98c Daniel Golle 2026-04-07  941  		ret = mxl862xx_vf_entry_set(priv, vf->block_id,
d587f9b6dcc98c Daniel Golle 2026-04-07 @942  					    gap, last_ve->vid);
d587f9b6dcc98c Daniel Golle 2026-04-07  943  		if (ret)
d587f9b6dcc98c Daniel Golle 2026-04-07  944  			return ret;
d587f9b6dcc98c Daniel Golle 2026-04-07  945  
d587f9b6dcc98c Daniel Golle 2026-04-07  946  		last_ve->index = gap;
d587f9b6dcc98c Daniel Golle 2026-04-07  947  	}
d587f9b6dcc98c Daniel Golle 2026-04-07  948  
d587f9b6dcc98c Daniel Golle 2026-04-07  949  	list_del(&ve->list);
d587f9b6dcc98c Daniel Golle 2026-04-07  950  	kfree(ve);
d587f9b6dcc98c Daniel Golle 2026-04-07  951  	vf->active_count--;
d587f9b6dcc98c Daniel Golle 2026-04-07  952  
d587f9b6dcc98c Daniel Golle 2026-04-07  953  	return 0;
d587f9b6dcc98c Daniel Golle 2026-04-07  954  }
d587f9b6dcc98c Daniel Golle 2026-04-07  955  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
