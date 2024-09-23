Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D531C2E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 00:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727051197; cv=none; b=JYKd+9tbmy50iaKBdLpWUr2/S29HoARWe1UdNjzmB3IGwRBlfyMhodCSIcSMvE9b3SxoKARKYHVQPyM5JcjviSkb2IAWaPJUOU1v16Wg0hAxOcs3zjr6ybexF9w+k2XwY6B2tMOSmHvOBq8YhXnzDxPum8S2nCGTsvPBk97l5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727051197; c=relaxed/simple;
	bh=eGEk8zVV5mpS3FirmsmQZ2XyPKz995luTHGr8IVgK8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRtuPIubkddeep/LM2bQqhfG5AduwGZlQb9cdalr9BcX0CoabLpAzLE8x2fUWaisxLNYOmalRbn7JnivotdLobpdDxtTT2f7waOD6y+cPc/CUTkZEYvNyNeoLpCtICcYCCDRaiQYVflEvbTPEhC4gF74FkuxaDSm14OwfOpqwcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m14cDlmF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m14cDlmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727051196; x=1758587196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eGEk8zVV5mpS3FirmsmQZ2XyPKz995luTHGr8IVgK8I=;
  b=m14cDlmFV/KlLf43FCb1NS8xvzyunRS3DqjLDa+0yxyG4IshtYGurUM0
   emDYfWaupvuStl6gjmVLBlRiUleCeIXwrS8Jv96qcMSRHVHflOf6MAgFh
   kxSA8ecY0nnSjXUP9sX9/FBQ7inf0iRgOlsB9v3yX9jApAY+k7ilcjgxu
   0zQiW+U9GTu/BPBsBYEV6uKSxxF+cNsdTRHShkLsW4TFcxXuQnP5rWkdq
   D+FgTYjWcmipTROauV9lNIn8JOzIcIcjGUAsgZwBEQZkBtGrV7nptA4EI
   DPz/4XSnl7fu7/GqfDL7zZaUkv/8IO1fLdUsTDJw/pqT/HinqGvdKiV9j
   w==;
X-CSE-ConnectionGUID: If9l7DgdSjaMyTdN4D1vEw==
X-CSE-MsgGUID: cZZ+C2BdTcSohT12IEI3sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26136439"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="26136439"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 17:26:35 -0700
X-CSE-ConnectionGUID: abgQzV8LTUGVEj5NzPx5xQ==
X-CSE-MsgGUID: 6mn2i94dTcactjh2glbyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="71338476"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Sep 2024 17:26:34 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssWuN-000Gla-2F;
	Mon, 23 Sep 2024 00:26:31 +0000
Date: Mon, 23 Sep 2024 08:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] udf: fix uninit-value use in udf_get_fileshortad
Message-ID: <202409230809.5ozgjLm9-lkp@intel.com>
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
In-Reply-To: <20240919195227.412583-1-gianf.trad@gmail.com>
References: <20240919195227.412583-1-gianf.trad@gmail.com>
TO: Gianfranco Trad <gianf.trad@gmail.com>
TO: jack@suse.com
CC: linux-kernel@vger.kernel.org
CC: skhan@linuxfoundation.org
CC: Gianfranco Trad <gianf.trad@gmail.com>
CC: syzbot+8901c4560b7ab5c2f9df@syzkaller.appspotmail.com

Hi Gianfranco,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.11 next-20240920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gianfranco-Trad/udf-fix-uninit-value-use-in-udf_get_fileshortad/20240920-035519
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20240919195227.412583-1-gianf.trad%40gmail.com
patch subject: [PATCH] udf: fix uninit-value use in udf_get_fileshortad
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-r073-20240922 (https://download.01.org/0day-ci/archive/20240923/202409230809.5ozgjLm9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230809.5ozgjLm9-lkp@intel.com/

smatch warnings:
fs/udf/inode.c:2223 udf_current_aext() error: we previously assumed 'epos->bh' could be null (see line 2204)

vim +2223 fs/udf/inode.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  2193  
ff116fc8d1d439 Jan Kara        2007-05-08  2194  int8_t udf_current_aext(struct inode *inode, struct extent_position *epos,
5ca4e4be841e38 Pekka Enberg    2008-10-15  2195  			struct kernel_lb_addr *eloc, uint32_t *elen, int inc)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2196  {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2197  	int alen;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2198  	int8_t etype;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2199  	uint8_t *ptr;
5ca4e4be841e38 Pekka Enberg    2008-10-15  2200  	struct short_ad *sad;
5ca4e4be841e38 Pekka Enberg    2008-10-15  2201  	struct long_ad *lad;
48d6d8ff7dca80 Marcin Slusarz  2008-02-08  2202  	struct udf_inode_info *iinfo = UDF_I(inode);
28de7948a89676 Cyrill Gorcunov 2007-07-21  2203  
cb00ea3528eb3c Cyrill Gorcunov 2007-07-19 @2204  	if (!epos->bh) {
ff116fc8d1d439 Jan Kara        2007-05-08  2205  		if (!epos->offset)
ff116fc8d1d439 Jan Kara        2007-05-08  2206  			epos->offset = udf_file_entry_alloc_offset(inode);
382a2287bf9cd2 Jan Kara        2020-09-25  2207  		ptr = iinfo->i_data + epos->offset -
4b11111aba6c80 Marcin Slusarz  2008-02-08  2208  			udf_file_entry_alloc_offset(inode) +
48d6d8ff7dca80 Marcin Slusarz  2008-02-08  2209  			iinfo->i_lenEAttr;
4b11111aba6c80 Marcin Slusarz  2008-02-08  2210  		alen = udf_file_entry_alloc_offset(inode) +
48d6d8ff7dca80 Marcin Slusarz  2008-02-08  2211  							iinfo->i_lenAlloc;
cb00ea3528eb3c Cyrill Gorcunov 2007-07-19  2212  	} else {
ff116fc8d1d439 Jan Kara        2007-05-08  2213  		if (!epos->offset)
ff116fc8d1d439 Jan Kara        2007-05-08  2214  			epos->offset = sizeof(struct allocExtDesc);
ff116fc8d1d439 Jan Kara        2007-05-08  2215  		ptr = epos->bh->b_data + epos->offset;
28de7948a89676 Cyrill Gorcunov 2007-07-21  2216  		alen = sizeof(struct allocExtDesc) +
4b11111aba6c80 Marcin Slusarz  2008-02-08  2217  			le32_to_cpu(((struct allocExtDesc *)epos->bh->b_data)->
4b11111aba6c80 Marcin Slusarz  2008-02-08  2218  							lengthAllocDescs);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2219  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2220  
48d6d8ff7dca80 Marcin Slusarz  2008-02-08  2221  	switch (iinfo->i_alloc_type) {
^1da177e4c3f41 Linus Torvalds  2005-04-16  2222  	case ICBTAG_FLAG_AD_SHORT:
2aa242080b8dda Gianfranco Trad 2024-09-19 @2223  		if (unlikely(alen < 0 && epos->offset == epos->bh->b_size))
2aa242080b8dda Gianfranco Trad 2024-09-19  2224  			return -1;
4b11111aba6c80 Marcin Slusarz  2008-02-08  2225  		sad = udf_get_fileshortad(ptr, alen, &epos->offset, inc);
4b11111aba6c80 Marcin Slusarz  2008-02-08  2226  		if (!sad)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2227  			return -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2228  		etype = le32_to_cpu(sad->extLength) >> 30;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2229  		eloc->logicalBlockNum = le32_to_cpu(sad->extPosition);
4b11111aba6c80 Marcin Slusarz  2008-02-08  2230  		eloc->partitionReferenceNum =
48d6d8ff7dca80 Marcin Slusarz  2008-02-08  2231  				iinfo->i_location.partitionReferenceNum;
28de7948a89676 Cyrill Gorcunov 2007-07-21  2232  		*elen = le32_to_cpu(sad->extLength) & UDF_EXTENT_LENGTH_MASK;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2233  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2234  	case ICBTAG_FLAG_AD_LONG:
4b11111aba6c80 Marcin Slusarz  2008-02-08  2235  		lad = udf_get_filelongad(ptr, alen, &epos->offset, inc);
4b11111aba6c80 Marcin Slusarz  2008-02-08  2236  		if (!lad)
^1da177e4c3f41 Linus Torvalds  2005-04-16  2237  			return -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2238  		etype = le32_to_cpu(lad->extLength) >> 30;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2239  		*eloc = lelb_to_cpu(lad->extLocation);
28de7948a89676 Cyrill Gorcunov 2007-07-21  2240  		*elen = le32_to_cpu(lad->extLength) & UDF_EXTENT_LENGTH_MASK;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2241  		break;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2242  	default:
fcbf7637e6647e Steve Magnani   2017-10-12  2243  		udf_debug("alloc_type = %u unsupported\n", iinfo->i_alloc_type);
^1da177e4c3f41 Linus Torvalds  2005-04-16  2244  		return -1;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2245  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  2246  
^1da177e4c3f41 Linus Torvalds  2005-04-16  2247  	return etype;
^1da177e4c3f41 Linus Torvalds  2005-04-16  2248  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  2249  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
