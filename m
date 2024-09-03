Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF619F436
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 10:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725358020; cv=none; b=mOqbci/5o0TCH31101GwDD+T61Tr1duEv/ItoodPhaVvXCH/L2wyU44cePftlmAHH7wyDopWphE/hXwWblIZrPDTZtomgtilgJu1u4nCBoeRrlGAAWxOt/bnOVjKR/woUNS4J92fMVB6ZcUnrpDkq1aGmbhmMugNaiaPiiQoWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725358020; c=relaxed/simple;
	bh=FSJhA55D40DWgcgTM4Rvr4lwFIi4V6IHaDjNPgTOpeg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0uvxPfAVge7IavRHsNCY68Zzo29ACQqmcGDVfaH205oRutE/N9LWEpN/aJ7Dqq7Uy9ClYMzEwYt7d/zaYW6isksfNQde30bB8tJzEdkb+ngJhBUhmbnLkkVis1hBGbXAFRu59X7xOKnop3Z4oElI1GzOT5QualHMlvVxGJMAXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gyhKvKVB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gyhKvKVB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725358018; x=1756894018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSJhA55D40DWgcgTM4Rvr4lwFIi4V6IHaDjNPgTOpeg=;
  b=gyhKvKVB0AF+bK8vJ+102TpFJ7X340RHkFiZq8X6ZG8IrTzQogLPZAqs
   SRoDuAdqLT4JtmHXsNP8WlGaBLu3CGpjMrtvjvCYG9J3kMkyWKU1lMhvH
   XEMSFNlWrkcGmi6hQJUvqSimNuC7CFAzuKsWXhELR3aGFOx6ZqbJOjFJ4
   v/pM/fLxWtlorV4KiGdiYDqKERA03oFK0/6/mm84M2YWG0g0M1Sh3neCI
   myerMb1Y8XuvIktO9mYnjAika4HNhHgPcGjolI4goQXr1i4CFzuCAAydx
   EytHNKA6Rb03eZWz1m4tGv3Nebr216UGzQeAybhT2+cxs0myCd2A8Drbg
   Q==;
X-CSE-ConnectionGUID: ove6aJRxRX+HgXcdZCOedg==
X-CSE-MsgGUID: c6F/A232Q1eLv3j3lyqR/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="34601382"
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="34601382"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 03:06:58 -0700
X-CSE-ConnectionGUID: ZLKkDXNJTSCAzPdVMiMRaw==
X-CSE-MsgGUID: IrrYBQLLS4iNOnCQolBjfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,198,1719903600"; 
   d="scan'208";a="65361304"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2024 03:06:57 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slQR4-0006U7-1b;
	Tue, 03 Sep 2024 10:06:54 +0000
Date: Tue, 3 Sep 2024 18:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7634/8795] fs/bcachefs/sb-members.c:505:46:
 sparse: sparse: cannot dereference this type
Message-ID: <202409031808.CPMMUdNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/sb-members.c:505:46: sparse: sparse: cannot dereference this type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6804f0edbe7747774e6ae60f20cec4ee3ad7c187
commit: 4e7795eda4459bf3e69c87c793bc34f610f9d981 [7634/8795] bcachefs: bch2_sb_member_alloc()
:::::: branch date: 3 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-122-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031808.CPMMUdNT-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409031808.CPMMUdNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409031808.CPMMUdNT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/sb-members.c: note: in included file:
   fs/bcachefs/bcachefs.h:996:9: sparse: sparse: array of flexible structures
   fs/bcachefs/sb-members.c:503:9: sparse: sparse: typename in expression
   fs/bcachefs/sb-members.c:503:18: sparse: sparse: Expected ; at end of statement
   fs/bcachefs/sb-members.c:503:18: sparse: sparse: got nr_devices
   fs/bcachefs/sb-members.c:503:31: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/sb-members.c:503:31: sparse: sparse: got )
   fs/bcachefs/sb-members.c:505:46: sparse: sparse: undefined identifier 'c'
>> fs/bcachefs/sb-members.c:505:46: sparse: sparse: cannot dereference this type
>> fs/bcachefs/sb-members.c:505:46: sparse: sparse: cannot dereference this type
   fs/bcachefs/sb-members.c:509:14: sparse: sparse: undefined identifier 'c'
   fs/bcachefs/sb-members.c:509:14: sparse: sparse: cannot dereference this type
   fs/bcachefs/sb-members.c:509:14: sparse: sparse: cannot dereference this type
   fs/bcachefs/sb-members.c:510:13: sparse: sparse: Expected ) in function declarator
   fs/bcachefs/sb-members.c:510:13: sparse: sparse: got !
>> fs/bcachefs/sb-members.c:510:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   fs/bcachefs/sb-members.c:513:10: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/sb-members.c:513:10: sparse: sparse: got ->
>> fs/bcachefs/sb-members.c:514:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   fs/bcachefs/sb-members.c:514:16: sparse: sparse: Expected ; at end of declaration
   fs/bcachefs/sb-members.c:514:16: sparse: sparse: got dev_idx
   fs/bcachefs/sb-members.c:515:1: sparse: sparse: Expected ; at the end of type declaration
   fs/bcachefs/sb-members.c:515:1: sparse: sparse: got }
   fs/bcachefs/sb-members.c:503:9: sparse: sparse: undefined identifier 'unsigned'
   fs/bcachefs/sb-members.c:503:31: sparse: sparse: undefined identifier '__UNIQUE_ID_x_653'
   fs/bcachefs/sb-members.c:505:46: sparse: sparse: undefined identifier 'c'
>> fs/bcachefs/sb-members.c:505:46: sparse: sparse: non-scalar type in conditional:
   fs/bcachefs/sb-members.c:505:46: sparse:    bad type _ptr
   fs/bcachefs/sb-members.c:506:25: sparse: sparse: undefined identifier 'nr_devices'
   fs/bcachefs/sb-members.c:509:14: sparse: sparse: undefined identifier 'c'
   fs/bcachefs/sb-members.c:509:14: sparse: sparse: non-scalar type in conditional:
   fs/bcachefs/sb-members.c:509:14: sparse:    bad type _ptr
   fs/bcachefs/sb-members.c:509:9: sparse: sparse: symbol 'mi' has multiple initializers (originally initialized at fs/bcachefs/sb-members.c:505)
   fs/bcachefs/sb-members.c:509:9: sparse: sparse: symbol 'mi' redeclared with different type (different base types):
   fs/bcachefs/sb-members.c:509:9: sparse:    int [addressable] [toplevel] mi
   fs/bcachefs/sb-members.c:505:40: sparse: note: previously declared as:
   fs/bcachefs/sb-members.c:505:40: sparse:    struct bch_sb_field_members_v2 *[addressable] [toplevel] mi

vim +505 fs/bcachefs/sb-members.c

4e7795eda4459bf Kent Overstreet 2024-09-01  476  
4e7795eda4459bf Kent Overstreet 2024-09-01  477  int bch2_sb_member_alloc(struct bch_fs *c)
4e7795eda4459bf Kent Overstreet 2024-09-01  478  {
4e7795eda4459bf Kent Overstreet 2024-09-01  479  	unsigned dev_idx = c->sb.nr_devices;
4e7795eda4459bf Kent Overstreet 2024-09-01  480  	if (dev_idx < BCH_SB_MEMBERS_MAX)
4e7795eda4459bf Kent Overstreet 2024-09-01  481  		goto have_slot;
4e7795eda4459bf Kent Overstreet 2024-09-01  482  
4e7795eda4459bf Kent Overstreet 2024-09-01  483  	int best = -1;
4e7795eda4459bf Kent Overstreet 2024-09-01  484  	u64 best_last_mount = 0;
4e7795eda4459bf Kent Overstreet 2024-09-01  485  	for (dev_idx = 0; dev_idx < BCH_SB_MEMBERS_MAX; dev_idx++) {
4e7795eda4459bf Kent Overstreet 2024-09-01  486  		struct bch_member m = bch2_sb_member_get(c->disk_sb.sb, dev_idx);
4e7795eda4459bf Kent Overstreet 2024-09-01  487  		if (bch2_member_alive(&m))
4e7795eda4459bf Kent Overstreet 2024-09-01  488  			continue;
4e7795eda4459bf Kent Overstreet 2024-09-01  489  
4e7795eda4459bf Kent Overstreet 2024-09-01  490  		u64 last_mount = le64_to_cpu(m.last_mount);
4e7795eda4459bf Kent Overstreet 2024-09-01  491  		if (best < 0 || last_mount < best_last_mount) {
4e7795eda4459bf Kent Overstreet 2024-09-01  492  			best = dev_idx;
4e7795eda4459bf Kent Overstreet 2024-09-01  493  			best_last_mount = last_mount;
4e7795eda4459bf Kent Overstreet 2024-09-01  494  		}
4e7795eda4459bf Kent Overstreet 2024-09-01  495  	}
4e7795eda4459bf Kent Overstreet 2024-09-01  496  	if (best >= 0) {
4e7795eda4459bf Kent Overstreet 2024-09-01  497  		dev_idx = best;
4e7795eda4459bf Kent Overstreet 2024-09-01  498  		goto have_slot;
4e7795eda4459bf Kent Overstreet 2024-09-01  499  	}
4e7795eda4459bf Kent Overstreet 2024-09-01  500  
4e7795eda4459bf Kent Overstreet 2024-09-01  501  	return -BCH_ERR_ENOSPC_sb_members;
4e7795eda4459bf Kent Overstreet 2024-09-01  502  have_slot:
4e7795eda4459bf Kent Overstreet 2024-09-01  503  	unsigned nr_devices = max_t(unsigned, dev_idx + 1, c->sb.nr_devices);
4e7795eda4459bf Kent Overstreet 2024-09-01  504  
4e7795eda4459bf Kent Overstreet 2024-09-01 @505  	struct bch_sb_field_members_v2 *mi = bch2_sb_field_get(c->disk_sb.sb, members_v2);
4e7795eda4459bf Kent Overstreet 2024-09-01  506  	unsigned u64s = DIV_ROUND_UP(sizeof(struct bch_sb_field_members_v2) +
4e7795eda4459bf Kent Overstreet 2024-09-01  507  				     le16_to_cpu(mi->member_bytes) * nr_devices, sizeof(u64));
4e7795eda4459bf Kent Overstreet 2024-09-01  508  
4e7795eda4459bf Kent Overstreet 2024-09-01  509  	mi = bch2_sb_field_resize(&c->disk_sb, members_v2, u64s);
4e7795eda4459bf Kent Overstreet 2024-09-01 @510  	if (!mi)
4e7795eda4459bf Kent Overstreet 2024-09-01  511  		return -BCH_ERR_ENOSPC_sb_members;
4e7795eda4459bf Kent Overstreet 2024-09-01  512  
4e7795eda4459bf Kent Overstreet 2024-09-01  513  	c->disk_sb.sb->nr_devices = nr_devices;
4e7795eda4459bf Kent Overstreet 2024-09-01 @514  	return dev_idx;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
