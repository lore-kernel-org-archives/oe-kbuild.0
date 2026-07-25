Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4685228D8D0
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784993865; cv=none; b=R3n7DoL+4OM2wm9iCKCaMv1FScfB45WszI0zC7STNTw/wUnBWY8Zf4/HLyyw14M2n5RnNYyDWYSDcLgLoGURF25MXeuAVNOow9qGuNHH6Kk7oGeByqj4Edd5YKHpxbTMhOQH3Woiy3lrNNzO98o4z4VAF2BIWyKGkg2c7hUFYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784993865; c=relaxed/simple;
	bh=eNCFkVN7X/ImT4Gd01mpjzI0qtyF4jT+uXsqIM7OzxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ra8Mdeio8kmlCxsTnxKkjiaC+YH0hVD9ZB6jU79uQWlaLwCrVe2EX6BXEy4qb+xAjfeNWP/U67KRjHXaGi/PwcoSASiGILOxtibqLlFdW8RrlAPzK68hXhtHBuPAtdSIAdkRhtK6I+qbHEVfa4lJ6HE/eYyB77f+XnabB+tVYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NzfyrxiA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NzfyrxiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784993862; x=1816529862;
  h=date:from:to:cc:subject:message-id;
  bh=eNCFkVN7X/ImT4Gd01mpjzI0qtyF4jT+uXsqIM7OzxA=;
  b=NzfyrxiA7iBFmpQM6Ug+UqPQdLa00tXMjdZEI92dN+XmRWvpjK2VN8xb
   5M/s3JVdmL/zYzp97vH9ndrWKRBRoBjRHt0hkqag6it8t0F8UE/KpFjKO
   PhKhoIDurZ1ST5CjO2S30CvUxGH6KplgJoUIiG0yHgT0Jj3/8qLHVo4Eg
   yfN42XXN8WM9iTAJSdk+vBOxWy1FphRIvZWFGCjH0qYuwgYoHQkFp9YUC
   5nLKDARBgvC4mxMmcerARIWhw9C24ZcmNzXMfMUg2ef1HETwO0tdWUkFV
   MKD2nrTyZICanojkFmW5lVIVCyBjNmuJvt+miCD0dmvlda8wOkCC2552+
   w==;
X-CSE-ConnectionGUID: S3tgUf5OSLOFfNopg3jbzg==
X-CSE-MsgGUID: vUZxI68/SSOQZ61gSzAI7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="88167231"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="88167231"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 08:37:41 -0700
X-CSE-ConnectionGUID: xfygbOe/R92Bn6rpLYMb8g==
X-CSE-MsgGUID: e4D2ldi6SYe7d8l2Bp8BiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="259625317"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Jul 2026 08:37:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wneRV-00000000blK-2mEo;
	Sat, 25 Jul 2026 15:37:37 +0000
Date: Sat, 25 Jul 2026 23:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/dsa/mxl862xx/mxl862xx.c:942
 mxl862xx_vf_del_vid() warn: iterator used outside loop: 'last_ve'
Message-ID: <202607252300.hPNGDpyM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Daniel Golle <daniel@makrotopia.org>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   48a5a7ab8d6ab7090564339e039c421f315de912
commit: d587f9b6dcc98c1e8aeb5c189a7bfac60d6d29ac net: dsa: mxl862xx: implement VLAN functionality
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: sparc-randconfig-r073-20260725 (https://download.01.org/0day-ci/archive/20260725/202607252300.hPNGDpyM-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d587f9b6dcc9 ("net: dsa: mxl862xx: implement VLAN functionality")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607252300.hPNGDpyM-lkp@intel.com/

smatch warnings:
drivers/net/dsa/mxl862xx/mxl862xx.c:942 mxl862xx_vf_del_vid() warn: iterator used outside loop: 'last_ve'

vim +/last_ve +942 drivers/net/dsa/mxl862xx/mxl862xx.c

d587f9b6dcc98c1 Daniel Golle 2026-04-07  904  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  905  static int mxl862xx_vf_del_vid(struct mxl862xx_priv *priv,
d587f9b6dcc98c1 Daniel Golle 2026-04-07  906  			       struct mxl862xx_vf_block *vf, u16 vid)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  907  {
d587f9b6dcc98c1 Daniel Golle 2026-04-07  908  	struct mxl862xx_vf_vid *ve, *last_ve;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  909  	u16 gap, last;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  910  	int ret;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  911  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  912  	ve = mxl862xx_vf_find_vid(vf, vid);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  913  	if (!ve)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  914  		return 0;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  915  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  916  	if (!vf->allocated) {
d587f9b6dcc98c1 Daniel Golle 2026-04-07  917  		/* Software-only state -- just remove the tracking entry */
d587f9b6dcc98c1 Daniel Golle 2026-04-07  918  		list_del(&ve->list);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  919  		kfree(ve);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  920  		vf->active_count--;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  921  		return 0;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  922  	}
d587f9b6dcc98c1 Daniel Golle 2026-04-07  923  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  924  	gap = ve->index;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  925  	last = vf->active_count - 1;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  926  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  927  	if (vf->active_count == 1) {
d587f9b6dcc98c1 Daniel Golle 2026-04-07  928  		/* Last VID -- restore DISCARD sentinel at index 0 */
d587f9b6dcc98c1 Daniel Golle 2026-04-07  929  		ret = mxl862xx_vf_entry_discard(priv, vf->block_id, 0);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  930  		if (ret)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  931  			return ret;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  932  	} else if (gap < last) {
d587f9b6dcc98c1 Daniel Golle 2026-04-07  933  		/* Swap: move the last ALLOW entry into the gap */
d587f9b6dcc98c1 Daniel Golle 2026-04-07  934  		list_for_each_entry(last_ve, &vf->vids, list)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  935  			if (last_ve->index == last)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  936  				break;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  937  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  938  		if (WARN_ON(list_entry_is_head(last_ve, &vf->vids, list)))
d587f9b6dcc98c1 Daniel Golle 2026-04-07  939  			return -EINVAL;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  940  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  941  		ret = mxl862xx_vf_entry_set(priv, vf->block_id,
d587f9b6dcc98c1 Daniel Golle 2026-04-07 @942  					    gap, last_ve->vid);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  943  		if (ret)
d587f9b6dcc98c1 Daniel Golle 2026-04-07  944  			return ret;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  945  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  946  		last_ve->index = gap;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  947  	}
d587f9b6dcc98c1 Daniel Golle 2026-04-07  948  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  949  	list_del(&ve->list);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  950  	kfree(ve);
d587f9b6dcc98c1 Daniel Golle 2026-04-07  951  	vf->active_count--;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  952  
d587f9b6dcc98c1 Daniel Golle 2026-04-07  953  	return 0;
d587f9b6dcc98c1 Daniel Golle 2026-04-07  954  }
d587f9b6dcc98c1 Daniel Golle 2026-04-07  955  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
