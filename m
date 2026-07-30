Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D8441635
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 18:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435855; cv=none; b=bjhhuGBzDu0nnRzPdDC+zW4io5WG2+EzRfnUoy0yGGunljY4qkHmF0F7z/nIryTFAs8HJGQbdakWA+Mj5FH8kupZG5NrdCPbHreWcGTJPEiW3NkEWVIEF0Hj5asqfQ8VBg+8X5evfKbDxaR69RqfifDDdnceRCLMhQyUmJTXntA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435855; c=relaxed/simple;
	bh=vExXrjKPLgUoPQOVP52rubLN/8mSOY2c2rK2qqTL2I0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AdyRBgwzm4bts6Fw3eg/wvJ6dLUJJC/SjWhQz+dOEbnE8aW9sQH1HruN6tIQIAXBn+6XOIo9ltORqTyFFn9sqh4FxHNE2VEDKez75xZkpXylrVb95x60WY16TdFLeYGpn8KOBEgL6XiiRQO05b1X8sojHCLSq1/lbBy34oxa45Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ARUS7ogR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARUS7ogR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785435853; x=1816971853;
  h=date:from:to:cc:subject:message-id;
  bh=vExXrjKPLgUoPQOVP52rubLN/8mSOY2c2rK2qqTL2I0=;
  b=ARUS7ogR3f8Z9wS0DAGCteBphgtq6jLsNm+nbJFNz42imy3WgjgwTRyG
   UlJW7951w2z0ipO2ui5a+SnAQdvZcDvYy/66BRLutp/wHrycjTLt/1+IW
   cuJfWS8EVkC9nipT3ZaYD4KdocIzJgmSgBgZ4kwZnTtMNQNqSiuYKDGC4
   jcAd5Jd/oiXEc9IRI1lvdm/FmdgRWCjDsQFU81700vVW9bXy/WdJdksjv
   RUwmCKfjEuRd4rDA/+zACxS1/vcTPl2g6g6LacmaoOVGyGB/kq6Dzwmmw
   wu6bd6DHqWwKNw7l5/CnxN417lMR1ax3eVJfb0xTZblN8w30oiV7R8Izi
   Q==;
X-CSE-ConnectionGUID: S+Fe5VGWR+uSJHk8tmCs5Q==
X-CSE-MsgGUID: k7po1BkxQC2mUPMp4uiGHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111610272"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="111610272"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 11:24:13 -0700
X-CSE-ConnectionGUID: hysLwFOhT+qv5v/VO53pmw==
X-CSE-MsgGUID: 9wQ46ZwGR4aP2HSLKsWYXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="265429743"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Jul 2026 11:24:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpVQH-00000000hQy-1t4K;
	Thu, 30 Jul 2026 18:24:03 +0000
Date: Fri, 31 Jul 2026 02:22:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ntfs/namei.c:360 ntfs_sd_add_everyone() warn: assigning
 (-32764) to unsigned variable 'sd->control'
Message-ID: <202607310225.YFpRnkKv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

Hi Namjae,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11028ab62899e4191e074ee364c712b77823a9c4
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   5 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310225.YFpRnkKv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607310225.YFpRnkKv-lkp@intel.com/

New smatch warnings:
fs/ntfs/namei.c:360 ntfs_sd_add_everyone() warn: assigning (-32764) to unsigned variable 'sd->control'

Old smatch warnings:
fs/ntfs/namei.c:239 ntfs_lookup() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1091 ntfs_mkdir() warn: passing zero to 'ERR_PTR'
fs/ntfs/namei.c:1175 __ntfs_link() warn: impossible condition '(name_len > 255) => (0-255 > 255)'

vim +360 fs/ntfs/namei.c

1e9ea7e04472d4 Namjae Jeon 2025-12-30  338  
af0db57d4293cc Namjae Jeon 2026-02-13  339  static int ntfs_sd_add_everyone(struct ntfs_inode *ni)
af0db57d4293cc Namjae Jeon 2026-02-13  340  {
af0db57d4293cc Namjae Jeon 2026-02-13  341  	struct security_descriptor_relative *sd;
af0db57d4293cc Namjae Jeon 2026-02-13  342  	struct ntfs_acl *acl;
af0db57d4293cc Namjae Jeon 2026-02-13  343  	struct ntfs_ace *ace;
af0db57d4293cc Namjae Jeon 2026-02-13  344  	struct ntfs_sid *sid;
af0db57d4293cc Namjae Jeon 2026-02-13  345  	int ret, sd_len;
af0db57d4293cc Namjae Jeon 2026-02-13  346  
af0db57d4293cc Namjae Jeon 2026-02-13  347  	/* Create SECURITY_DESCRIPTOR attribute (everyone has full access). */
af0db57d4293cc Namjae Jeon 2026-02-13  348  	/*
af0db57d4293cc Namjae Jeon 2026-02-13  349  	 * Calculate security descriptor length. We have 2 sub-authorities in
af0db57d4293cc Namjae Jeon 2026-02-13  350  	 * owner and group SIDs, So add 8 bytes to every SID.
af0db57d4293cc Namjae Jeon 2026-02-13  351  	 */
af0db57d4293cc Namjae Jeon 2026-02-13  352  	sd_len = sizeof(struct security_descriptor_relative) + 2 *
af0db57d4293cc Namjae Jeon 2026-02-13  353  		(sizeof(struct ntfs_sid) + 8) + sizeof(struct ntfs_acl) +
af0db57d4293cc Namjae Jeon 2026-02-13  354  		sizeof(struct ntfs_ace) + 4;
af0db57d4293cc Namjae Jeon 2026-02-13  355  	sd = kmalloc(sd_len, GFP_NOFS);
af0db57d4293cc Namjae Jeon 2026-02-13  356  	if (!sd)
af0db57d4293cc Namjae Jeon 2026-02-13  357  		return -1;
af0db57d4293cc Namjae Jeon 2026-02-13  358  
af0db57d4293cc Namjae Jeon 2026-02-13  359  	sd->revision = 1;
af0db57d4293cc Namjae Jeon 2026-02-13 @360  	sd->control = SE_DACL_PRESENT | SE_SELF_RELATIVE;
af0db57d4293cc Namjae Jeon 2026-02-13  361  
af0db57d4293cc Namjae Jeon 2026-02-13  362  	sid = (struct ntfs_sid *)((u8 *)sd + sizeof(struct security_descriptor_relative));
af0db57d4293cc Namjae Jeon 2026-02-13  363  	sid->revision = 1;
af0db57d4293cc Namjae Jeon 2026-02-13  364  	sid->sub_authority_count = 2;
af0db57d4293cc Namjae Jeon 2026-02-13  365  	sid->sub_authority[0] = cpu_to_le32(SECURITY_BUILTIN_DOMAIN_RID);
af0db57d4293cc Namjae Jeon 2026-02-13  366  	sid->sub_authority[1] = cpu_to_le32(DOMAIN_ALIAS_RID_ADMINS);
af0db57d4293cc Namjae Jeon 2026-02-13  367  	sid->identifier_authority.value[5] = 5;
af0db57d4293cc Namjae Jeon 2026-02-13  368  	sd->owner = cpu_to_le32((u8 *)sid - (u8 *)sd);
af0db57d4293cc Namjae Jeon 2026-02-13  369  
af0db57d4293cc Namjae Jeon 2026-02-13  370  	sid = (struct ntfs_sid *)((u8 *)sid + sizeof(struct ntfs_sid) + 8);
af0db57d4293cc Namjae Jeon 2026-02-13  371  	sid->revision = 1;
af0db57d4293cc Namjae Jeon 2026-02-13  372  	sid->sub_authority_count = 2;
af0db57d4293cc Namjae Jeon 2026-02-13  373  	sid->sub_authority[0] = cpu_to_le32(SECURITY_BUILTIN_DOMAIN_RID);
af0db57d4293cc Namjae Jeon 2026-02-13  374  	sid->sub_authority[1] = cpu_to_le32(DOMAIN_ALIAS_RID_ADMINS);
af0db57d4293cc Namjae Jeon 2026-02-13  375  	sid->identifier_authority.value[5] = 5;
af0db57d4293cc Namjae Jeon 2026-02-13  376  	sd->group = cpu_to_le32((u8 *)sid - (u8 *)sd);
af0db57d4293cc Namjae Jeon 2026-02-13  377  
af0db57d4293cc Namjae Jeon 2026-02-13  378  	acl = (struct ntfs_acl *)((u8 *)sid + sizeof(struct ntfs_sid) + 8);
af0db57d4293cc Namjae Jeon 2026-02-13  379  	acl->revision = 2;
af0db57d4293cc Namjae Jeon 2026-02-13  380  	acl->size = cpu_to_le16(sizeof(struct ntfs_acl) + sizeof(struct ntfs_ace) + 4);
af0db57d4293cc Namjae Jeon 2026-02-13  381  	acl->ace_count = cpu_to_le16(1);
af0db57d4293cc Namjae Jeon 2026-02-13  382  	sd->dacl = cpu_to_le32((u8 *)acl - (u8 *)sd);
af0db57d4293cc Namjae Jeon 2026-02-13  383  
af0db57d4293cc Namjae Jeon 2026-02-13  384  	ace = (struct ntfs_ace *)((u8 *)acl + sizeof(struct ntfs_acl));
af0db57d4293cc Namjae Jeon 2026-02-13  385  	ace->type = ACCESS_ALLOWED_ACE_TYPE;
af0db57d4293cc Namjae Jeon 2026-02-13  386  	ace->flags = OBJECT_INHERIT_ACE | CONTAINER_INHERIT_ACE;
af0db57d4293cc Namjae Jeon 2026-02-13  387  	ace->size = cpu_to_le16(sizeof(struct ntfs_ace) + 4);
af0db57d4293cc Namjae Jeon 2026-02-13  388  	ace->mask = cpu_to_le32(0x1f01ff);
af0db57d4293cc Namjae Jeon 2026-02-13  389  	ace->sid.revision = 1;
af0db57d4293cc Namjae Jeon 2026-02-13  390  	ace->sid.sub_authority_count = 1;
af0db57d4293cc Namjae Jeon 2026-02-13  391  	ace->sid.sub_authority[0] = 0;
af0db57d4293cc Namjae Jeon 2026-02-13  392  	ace->sid.identifier_authority.value[5] = 1;
af0db57d4293cc Namjae Jeon 2026-02-13  393  
af0db57d4293cc Namjae Jeon 2026-02-13  394  	ret = ntfs_attr_add(ni, AT_SECURITY_DESCRIPTOR, AT_UNNAMED, 0, (u8 *)sd,
af0db57d4293cc Namjae Jeon 2026-02-13  395  			sd_len);
af0db57d4293cc Namjae Jeon 2026-02-13  396  	if (ret)
af0db57d4293cc Namjae Jeon 2026-02-13  397  		ntfs_error(ni->vol->sb, "Failed to add SECURITY_DESCRIPTOR\n");
af0db57d4293cc Namjae Jeon 2026-02-13  398  
af0db57d4293cc Namjae Jeon 2026-02-13  399  	kfree(sd);
af0db57d4293cc Namjae Jeon 2026-02-13  400  	return ret;
af0db57d4293cc Namjae Jeon 2026-02-13  401  }
af0db57d4293cc Namjae Jeon 2026-02-13  402  

:::::: The code at line 360 was first introduced by commit
:::::: af0db57d4293cc9fe6ce99fb5592dc2652228c9d ntfs: update inode operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
