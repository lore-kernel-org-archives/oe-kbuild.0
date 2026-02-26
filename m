Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DF5427A0A
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 19:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772134944; cv=none; b=Ru7fCxTuXcVt66pxh2vLHUJtegteoChLI3J6sRptvcTkq/+ZG4Sf1mnODhjFBYfzm2VKoA9ZhoeMm1wWaFO7lnj/DbjyyBSrp48X6Lz9qfcwr5xk0xms9sTvtzsGZrTa41zamqK6XL7N07dPIHaqLe/BHmo903GPuChMGKtdg7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772134944; c=relaxed/simple;
	bh=szMRzwHHkHSoRep+djm1+QOObnArW1oAi9G4/XRedow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=smfeUxpC91mmLLKEV+AHr07z6OhT18/eT6S9Lze9z2V3XkECIMrk9agHzfTPsSsRW7IrSn0eyBiAbx/WRXEK22Ou+ETrjsyrRhaOQWunADoLl1/9SDLrhBQU48KG483MK+sOJegOUcm2W2cBt6D/S+zwVhyyA37pFBGG3EwKThE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLadHKRs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLadHKRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772134942; x=1803670942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szMRzwHHkHSoRep+djm1+QOObnArW1oAi9G4/XRedow=;
  b=DLadHKRsoivQ4kWD4WkdobyHc5y00kCE8jlhw0Ez0vK+HUleVYVyjLN8
   LV83Jxf7En9sP7Hzt5DqiaauFvLBnpKbhUuy/TFizT0LTzHXgq4FuAlls
   DpwQNL3WpB/BPsAYYWxjLk0u6CPJczhtpsq93aP71Oay0C6sSomL7QG88
   W2AsokeLLMSQjiy88pjv5LswoBhT36DxfARcJwFbBZGIvFpUkhVsziI8x
   suyNMw6LFguKxphdtU8ZqjCU60zNoS5MxGhZY35VwPzqEPzym3J3ED2Qa
   1vkbIDPzuFQRIoSPOdSsPzn866zi8i4IzkMQLQ52mM+uJGJmJcXAnz6Bg
   A==;
X-CSE-ConnectionGUID: 4ZJvO5z9REysgquNlqA+9g==
X-CSE-MsgGUID: RiwSGnqgSe2l2Xx55ddBlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60784468"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="60784468"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:42:22 -0800
X-CSE-ConnectionGUID: R2/Oe8WGS1qxoHHS1YAj8w==
X-CSE-MsgGUID: xbprWL4/QzCMo43XGXh27w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="216578961"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Feb 2026 11:42:20 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvhF6-000000009oR-0tDs;
	Thu, 26 Feb 2026 19:41:53 +0000
Date: Fri, 27 Feb 2026 03:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/2] hfsplus: refactor b-tree map page access and add
 node-type validation
Message-ID: <202602270310.eBmeD8VX-lkp@intel.com>
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
In-Reply-To: <20260226091235.927749-2-shardul.b@mpiricsoftware.com>
References: <20260226091235.927749-2-shardul.b@mpiricsoftware.com>
TO: Shardul Bankar <shardulsb08@gmail.com>
TO: slava@dubeyko.com
TO: glaubitz@physik.fu-berlin.de
TO: frank.li@vivo.com
TO: linux-fsdevel@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: janak@mpiricsoftware.com
CC: janak@mpiric.us
CC: shardulsb08@gmail.com
CC: Shardul Bankar <shardul.b@mpiricsoftware.com>

Hi Shardul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shardul-Bankar/hfsplus-refactor-b-tree-map-page-access-and-add-node-type-validation/20260226-171914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260226091235.927749-2-shardul.b%40mpiricsoftware.com
patch subject: [PATCH v4 1/2] hfsplus: refactor b-tree map page access and add node-type validation
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: hexagon-randconfig-r072-20260226 (https://download.01.org/0day-ci/archive/20260227/202602270310.eBmeD8VX-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602270310.eBmeD8VX-lkp@intel.com/

New smatch warnings:
fs/hfsplus/btree.c:167 hfs_bmap_get_map_page() warn: right shifting more than type allows 16 vs 18
fs/hfsplus/btree.c:460 hfsplus_bmap_alloc() warn: impossible condition '(++off >= ((1) << 18)) => (0-u16max >= 262144)'

Old smatch warnings:
fs/hfsplus/btree.c:533 hfsplus_bmap_free() warn: right shifting more than type allows 16 vs 18

vim +167 fs/hfsplus/btree.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  131  
af50648ad1415c Shardul Bankar 2026-02-26  132  /*
af50648ad1415c Shardul Bankar 2026-02-26  133   * Maps the page containing the b-tree map record and calculates offsets.
af50648ad1415c Shardul Bankar 2026-02-26  134   * Automatically handles the difference between header and map nodes.
af50648ad1415c Shardul Bankar 2026-02-26  135   * Returns the mapped data pointer, or an ERR_PTR on failure.
af50648ad1415c Shardul Bankar 2026-02-26  136   * Note: The caller is responsible for calling kunmap_local(data).
af50648ad1415c Shardul Bankar 2026-02-26  137   */
af50648ad1415c Shardul Bankar 2026-02-26  138  static u8 *hfs_bmap_get_map_page(struct hfs_bnode *node, u16 *off, u16 *len,
af50648ad1415c Shardul Bankar 2026-02-26  139  				unsigned int *page_idx)
af50648ad1415c Shardul Bankar 2026-02-26  140  {
af50648ad1415c Shardul Bankar 2026-02-26  141  	u16 rec_idx, off16;
af50648ad1415c Shardul Bankar 2026-02-26  142  
af50648ad1415c Shardul Bankar 2026-02-26  143  	if (node->this == HFSPLUS_TREE_HEAD) {
af50648ad1415c Shardul Bankar 2026-02-26  144  		if (node->type != HFS_NODE_HEADER) {
af50648ad1415c Shardul Bankar 2026-02-26  145  			pr_err("hfsplus: invalid btree header node\n");
af50648ad1415c Shardul Bankar 2026-02-26  146  			return ERR_PTR(-EIO);
af50648ad1415c Shardul Bankar 2026-02-26  147  		}
af50648ad1415c Shardul Bankar 2026-02-26  148  		rec_idx = HFSPLUS_BTREE_HDR_MAP_REC_INDEX;
af50648ad1415c Shardul Bankar 2026-02-26  149  	} else {
af50648ad1415c Shardul Bankar 2026-02-26  150  		if (node->type != HFS_NODE_MAP) {
af50648ad1415c Shardul Bankar 2026-02-26  151  			pr_err("hfsplus: invalid btree map node\n");
af50648ad1415c Shardul Bankar 2026-02-26  152  			return ERR_PTR(-EIO);
af50648ad1415c Shardul Bankar 2026-02-26  153  		}
af50648ad1415c Shardul Bankar 2026-02-26  154  		rec_idx = HFSPLUS_BTREE_MAP_NODE_REC_INDEX;
af50648ad1415c Shardul Bankar 2026-02-26  155  	}
af50648ad1415c Shardul Bankar 2026-02-26  156  
af50648ad1415c Shardul Bankar 2026-02-26  157  	*len = hfs_brec_lenoff(node, rec_idx, &off16);
af50648ad1415c Shardul Bankar 2026-02-26  158  	if (!*len)
af50648ad1415c Shardul Bankar 2026-02-26  159  		return ERR_PTR(-ENOENT);
af50648ad1415c Shardul Bankar 2026-02-26  160  
af50648ad1415c Shardul Bankar 2026-02-26  161  	if (!is_bnode_offset_valid(node, off16))
af50648ad1415c Shardul Bankar 2026-02-26  162  		return ERR_PTR(-EIO);
af50648ad1415c Shardul Bankar 2026-02-26  163  
af50648ad1415c Shardul Bankar 2026-02-26  164  	*len = check_and_correct_requested_length(node, off16, *len);
af50648ad1415c Shardul Bankar 2026-02-26  165  
af50648ad1415c Shardul Bankar 2026-02-26  166  	off16 += node->page_offset;
af50648ad1415c Shardul Bankar 2026-02-26 @167  	*page_idx = off16 >> PAGE_SHIFT;
af50648ad1415c Shardul Bankar 2026-02-26  168  	*off = off16 & ~PAGE_MASK;
af50648ad1415c Shardul Bankar 2026-02-26  169  
af50648ad1415c Shardul Bankar 2026-02-26  170  	return kmap_local_page(node->page[*page_idx]);
af50648ad1415c Shardul Bankar 2026-02-26  171  }
af50648ad1415c Shardul Bankar 2026-02-26  172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
