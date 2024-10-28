Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4AF18C03B
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103045; cv=none; b=RIWbBq9zWH5REIA8Bylkyd5rU05ejLkLI6csNroE/S2J4LUwkipONMMp1PoAe4D31y7VFmT7v5El/umNkaz8SkomZWDYDwMqwUOIWL1erO5IfdCaLTn5PNZi4F7/wAz9qIjm6ULHjtDh3HBK/z/U/FyZ4/YJzHZAKb4uTZnoOnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103045; c=relaxed/simple;
	bh=GkQg0lPywfNpN8RdOLRbyKNoZ6QybOuS4peLqj5po2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L5+Rvi6BR6B7VdX6pxriiW9QraY5FAY3xm691qcEHXMW0E4nFYpOwJ0l7jktWcfeMZjNS1Ti+P3i//Ma8Q2ud6D/Ou+0wP4E3c73vyCUJiWK3O4+jMe1WhyAQuvd55czGuWs+ZqJQeCwZKHCHM3tQW4rzyVeHfY70SVGz4FIjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIi+TdBm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIi+TdBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730103042; x=1761639042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GkQg0lPywfNpN8RdOLRbyKNoZ6QybOuS4peLqj5po2I=;
  b=FIi+TdBmDmtyOhWMAxqEPutfHeGs+YlMtRqrjKMgcVYQ0wDRGAiNcWOj
   brGcffwbQYAafOP6VX+ViRJqTYd1/PIr77cmIJrsjrwAujztGam+u5AKu
   ldby7y7nvP4y6gZ8xMxNagSa6HZx5ybaLzRqP8+4aq98Uu5ABYkvbJQep
   ypGukffRCeeiz1Yhp6Ncq1WLzin0PF2xkBIOMFTT9/JBOq1GqNoN+aLp2
   /+K6WACvVl4uaq/HRv1Odes59CSGEdUs52AQrPXSUe3tSMTZ+lKiW0W/+
   hOJJ+7WzOUZ5VSOhAVzNC77xtL+vh0T/gKskDOT+YsHoRmDh/wCVS20D/
   Q==;
X-CSE-ConnectionGUID: HMaxq/EgQl+qaNJ5CncfdA==
X-CSE-MsgGUID: wDAxL6W3TbuWDt4cwyUN9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33384886"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="33384886"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 01:10:42 -0700
X-CSE-ConnectionGUID: NcLHiE6OQkiloziTwtNc9Q==
X-CSE-MsgGUID: hHSp3tVGSgCXSwEtphPviQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81130705"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Oct 2024 01:10:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Kpj-000cB8-0E;
	Mon, 28 Oct 2024 08:10:39 +0000
Date: Mon, 28 Oct 2024 16:10:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/bcachefs/inode.c:694:13-14: WARNING opportunity for min()
Message-ID: <202410281600.5Nkl7FA4-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   81983758430957d9a5cb3333fe324fd70cf63e7e
commit: 9b23fdbd5d29beb5bd272c304e0d978edd32f513 bcachefs: bcachefs_metadata_version_inode_has_child_snapshots
date:   3 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 weeks ago
config: m68k-randconfig-r051-20241027 (https://download.01.org/0day-ci/archive/20241028/202410281600.5Nkl7FA4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410281600.5Nkl7FA4-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/inode.c:694:13-14: WARNING opportunity for min()

vim +694 fs/bcachefs/inode.c

9b23fdbd5d29be Kent Overstreet 2024-09-29  678  
9b23fdbd5d29be Kent Overstreet 2024-09-29  679  static int update_parent_inode_has_children(struct btree_trans *trans, struct bpos pos,
9b23fdbd5d29be Kent Overstreet 2024-09-29  680  					    bool have_child)
9b23fdbd5d29be Kent Overstreet 2024-09-29  681  {
9b23fdbd5d29be Kent Overstreet 2024-09-29  682  	struct btree_iter iter;
9b23fdbd5d29be Kent Overstreet 2024-09-29  683  	struct bkey_s_c k = bch2_inode_get_iter_snapshot_parent(trans,
9b23fdbd5d29be Kent Overstreet 2024-09-29  684  						&iter, pos, BTREE_ITER_with_updates);
9b23fdbd5d29be Kent Overstreet 2024-09-29  685  	int ret = bkey_err(k);
9b23fdbd5d29be Kent Overstreet 2024-09-29  686  	if (ret)
9b23fdbd5d29be Kent Overstreet 2024-09-29  687  		return ret;
9b23fdbd5d29be Kent Overstreet 2024-09-29  688  	if (!k.k)
9b23fdbd5d29be Kent Overstreet 2024-09-29  689  		return 0;
9b23fdbd5d29be Kent Overstreet 2024-09-29  690  
9b23fdbd5d29be Kent Overstreet 2024-09-29  691  	if (!have_child) {
9b23fdbd5d29be Kent Overstreet 2024-09-29  692  		ret = bch2_inode_has_child_snapshots(trans, k.k->p);
9b23fdbd5d29be Kent Overstreet 2024-09-29  693  		if (ret) {
9b23fdbd5d29be Kent Overstreet 2024-09-29 @694  			ret = ret < 0 ? ret : 0;
9b23fdbd5d29be Kent Overstreet 2024-09-29  695  			goto err;
9b23fdbd5d29be Kent Overstreet 2024-09-29  696  		}
9b23fdbd5d29be Kent Overstreet 2024-09-29  697  	}
9b23fdbd5d29be Kent Overstreet 2024-09-29  698  
9b23fdbd5d29be Kent Overstreet 2024-09-29  699  	u64 f = bkey_inode_flags(k);
9b23fdbd5d29be Kent Overstreet 2024-09-29  700  	if (have_child != !!(f & BCH_INODE_has_child_snapshot)) {
9b23fdbd5d29be Kent Overstreet 2024-09-29  701  		struct bkey_i *update = bch2_bkey_make_mut(trans, &iter, &k,
9b23fdbd5d29be Kent Overstreet 2024-09-29  702  					     BTREE_UPDATE_internal_snapshot_node);
9b23fdbd5d29be Kent Overstreet 2024-09-29  703  		ret = PTR_ERR_OR_ZERO(update);
9b23fdbd5d29be Kent Overstreet 2024-09-29  704  		if (ret)
9b23fdbd5d29be Kent Overstreet 2024-09-29  705  			goto err;
9b23fdbd5d29be Kent Overstreet 2024-09-29  706  
9b23fdbd5d29be Kent Overstreet 2024-09-29  707  		bkey_inode_flags_set(bkey_i_to_s(update), f ^ BCH_INODE_has_child_snapshot);
9b23fdbd5d29be Kent Overstreet 2024-09-29  708  	}
9b23fdbd5d29be Kent Overstreet 2024-09-29  709  err:
9b23fdbd5d29be Kent Overstreet 2024-09-29  710  	bch2_trans_iter_exit(trans, &iter);
9b23fdbd5d29be Kent Overstreet 2024-09-29  711  	return ret;
dde8cb11645b7d Kent Overstreet 2023-07-17  712  }
dde8cb11645b7d Kent Overstreet 2023-07-17  713  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
