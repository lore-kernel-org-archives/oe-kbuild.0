Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3E82C190
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 01:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728438804; cv=none; b=FaLPgtcAye2K6OnRmpdzhEHy/Oyq98v/Re25NO5xHokDb/4Dbt6mad/X6XVo92prOU7rWQxSe30nIwZyzcjKOz6heqhiLTk/PLJS5tZ6tZWQ3qQ792auAR1e2Uo8HOGIjBfEGb7figJpfvdUVnhwCvqMcfJvZNQMHlEKq85i/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728438804; c=relaxed/simple;
	bh=KAgRJaYtK4xLnYDmTvaUsDdlYunij8sbnd+IjM2X8ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cDSQ6fEjOLhE8i7y7A5U99kNgZJJYCbjleUv825tblvsMO5t+Lw/UslOXJZ6m4DCWpZrk5+1v0lLbUlGoGx00MuCUye5KesJSLZd/U24xXBDvRt3Bu1qV+NcmEzV24BUwPA9o3eZceKiqPHkN2maOQ1aWhgQonbX2kCHZup7+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/pemyhh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/pemyhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728438802; x=1759974802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAgRJaYtK4xLnYDmTvaUsDdlYunij8sbnd+IjM2X8ac=;
  b=j/pemyhhaaqTNuxb1zbkQuvZQFYz8hy0CPLBI/CkHT6OkJuAqXrwbgcU
   24tn4nVcAqplW1sNSIhOk1mklPs8/ibFAmVMLxPbRK321hM13yAC+MOeC
   jiTAxuOJWaAxy/uW1ewYq+JbVxdgxQJq0ZECi+/3DupWFE8kVM8jau1nf
   +tzsn1UefhxWOd3RU6y0a8BSp4Vs3WdnDGTprMqnaB1lYXAv4lm1TkfA7
   VAN5m9hKYH29S4JcHxKVfO09daZi2Oc9PVndnCsavgOZB2+j60V0B1lNv
   peA/eijN3ENVTacv1J/C8ie7fRBjUGGhkALrPe+izbBHoggsHVsJMIoZL
   Q==;
X-CSE-ConnectionGUID: Q+jB6truS9+mCr7g81MV9w==
X-CSE-MsgGUID: po5k+cFmS5WcCcdsw9LhEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27657558"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="27657558"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 18:53:22 -0700
X-CSE-ConnectionGUID: EEvNH1yBR2eL0ddNLodU0Q==
X-CSE-MsgGUID: XPOLccHwRHuLrYsPCIO4iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="76321879"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2024 18:53:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syLt8-0008as-0S;
	Wed, 09 Oct 2024 01:53:18 +0000
Date: Wed, 9 Oct 2024 09:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:fs-next 129/379] fs/bcachefs/inode.c:694:13-14: WARNING
 opportunity for min()
Message-ID: <202410090933.m6GByU3s-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git fs-next
head:   b41d67c149df797c9fa31ca5106327174daa7376
commit: 6375feaa7a3bfb0d5ecbd7a5f1350bc37fb28aae [129/379] bcachefs: bcachefs_metadata_version_inode_has_child_snapshots
:::::: branch date: 4 hours ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-r051-20241009 (https://download.01.org/0day-ci/archive/20241009/202410090933.m6GByU3s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410090933.m6GByU3s-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/inode.c:694:13-14: WARNING opportunity for min()

vim +694 fs/bcachefs/inode.c

6375feaa7a3bfb Kent Overstreet 2024-09-29  678  
6375feaa7a3bfb Kent Overstreet 2024-09-29  679  static int update_parent_inode_has_children(struct btree_trans *trans, struct bpos pos,
6375feaa7a3bfb Kent Overstreet 2024-09-29  680  					    bool have_child)
6375feaa7a3bfb Kent Overstreet 2024-09-29  681  {
6375feaa7a3bfb Kent Overstreet 2024-09-29  682  	struct btree_iter iter;
6375feaa7a3bfb Kent Overstreet 2024-09-29  683  	struct bkey_s_c k = bch2_inode_get_iter_snapshot_parent(trans,
6375feaa7a3bfb Kent Overstreet 2024-09-29  684  						&iter, pos, BTREE_ITER_with_updates);
6375feaa7a3bfb Kent Overstreet 2024-09-29  685  	int ret = bkey_err(k);
6375feaa7a3bfb Kent Overstreet 2024-09-29  686  	if (ret)
6375feaa7a3bfb Kent Overstreet 2024-09-29  687  		return ret;
6375feaa7a3bfb Kent Overstreet 2024-09-29  688  	if (!k.k)
6375feaa7a3bfb Kent Overstreet 2024-09-29  689  		return 0;
6375feaa7a3bfb Kent Overstreet 2024-09-29  690  
6375feaa7a3bfb Kent Overstreet 2024-09-29  691  	if (!have_child) {
6375feaa7a3bfb Kent Overstreet 2024-09-29  692  		ret = bch2_inode_has_child_snapshots(trans, k.k->p);
6375feaa7a3bfb Kent Overstreet 2024-09-29  693  		if (ret) {
6375feaa7a3bfb Kent Overstreet 2024-09-29 @694  			ret = ret < 0 ? ret : 0;
6375feaa7a3bfb Kent Overstreet 2024-09-29  695  			goto err;
6375feaa7a3bfb Kent Overstreet 2024-09-29  696  		}
6375feaa7a3bfb Kent Overstreet 2024-09-29  697  	}
6375feaa7a3bfb Kent Overstreet 2024-09-29  698  
6375feaa7a3bfb Kent Overstreet 2024-09-29  699  	u64 f = bkey_inode_flags(k);
6375feaa7a3bfb Kent Overstreet 2024-09-29  700  	if (have_child != !!(f & BCH_INODE_has_child_snapshot)) {
6375feaa7a3bfb Kent Overstreet 2024-09-29  701  		struct bkey_i *update = bch2_bkey_make_mut(trans, &iter, &k,
6375feaa7a3bfb Kent Overstreet 2024-09-29  702  					     BTREE_UPDATE_internal_snapshot_node);
6375feaa7a3bfb Kent Overstreet 2024-09-29  703  		ret = PTR_ERR_OR_ZERO(update);
6375feaa7a3bfb Kent Overstreet 2024-09-29  704  		if (ret)
6375feaa7a3bfb Kent Overstreet 2024-09-29  705  			goto err;
6375feaa7a3bfb Kent Overstreet 2024-09-29  706  
6375feaa7a3bfb Kent Overstreet 2024-09-29  707  		bkey_inode_flags_set(bkey_i_to_s(update), f ^ BCH_INODE_has_child_snapshot);
6375feaa7a3bfb Kent Overstreet 2024-09-29  708  	}
6375feaa7a3bfb Kent Overstreet 2024-09-29  709  err:
6375feaa7a3bfb Kent Overstreet 2024-09-29  710  	bch2_trans_iter_exit(trans, &iter);
6375feaa7a3bfb Kent Overstreet 2024-09-29  711  	return ret;
dde8cb11645b7d Kent Overstreet 2023-07-17  712  }
dde8cb11645b7d Kent Overstreet 2023-07-17  713  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
