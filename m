Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A837224AFA
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445811; cv=none; b=BcR9U5EJzFifCIHfRkQXRTb7UWhvzCG8LokVmWB3rq+YH5KkymJoH9D7832jGjUN2dWRdM68UBrMskxqjv97rFN8IuXl1NXCFu+OJ83IbUaKXfd8liR1R1s3S2Z0xR6Q3pLS8LWUhMmChWTiAInxer1pF0GfAvyJraUoYZQ7Ink=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445811; c=relaxed/simple;
	bh=fEEfnu9JRYO5cuxm/E/QKzOSS43EbsaSPuyIcWn684I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F4Ois82XdE4IU0JuCw+TR7ujebS+Rz5Vr0bjjPXf0YPKO8z7jbjF/3RdiWAbKacPAXmJp5knXgEyTZKMfF8zpLFk6c+OfLpDPT4YOCa3lHck6q+gecEiot5LSSwuF0+3wVr6ugcbq5ZrddEKrl1Ca2bPRhifN3wEiAJs2Mi/Apc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cpRAOyyp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cpRAOyyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774445811; x=1805981811;
  h=date:from:to:cc:subject:message-id;
  bh=fEEfnu9JRYO5cuxm/E/QKzOSS43EbsaSPuyIcWn684I=;
  b=cpRAOyypxUUPxEcJ/vpcc1Q20MFtCaYmvnf4Co5PmWVEJ44V/wW9efLM
   x4a0DwOXMi54tGwVaX5Uik8wNS09YBiSw6diFX0KvOKSGaAT62bcU1h16
   GNfsyAFwrppMpDejeUi6fJ/yNU4qUEdIWmW/RURTEq21r2zC2TgPMZ3R+
   CdUJZ6HPh2c5hsvUDrMYEEzHn4trg1tV9VVAIureKugRmU2HZTKgb4egu
   LKmLtSVy4HfeIeiy1b4eTYqpH4lQzswPytUbJMcXIxR+yrb59VkjWDrpO
   Z+oNbIomXgruK/U4IT5zRqanqWUQq/ih+P3KfHAQQ62ope7k6932OCW1o
   g==;
X-CSE-ConnectionGUID: wzRWxxsNRmmqnZC9vh7EHQ==
X-CSE-MsgGUID: KqXFU2EuR12nqpxv1uu8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75363058"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75363058"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 06:36:50 -0700
X-CSE-ConnectionGUID: p3J1I0f8T6WsFKq2IkSZ5g==
X-CSE-MsgGUID: MHJjtBuXSbuInw5t9k+mmQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2026 06:36:48 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5OPd-0000000070D-3sYo;
	Wed, 25 Mar 2026 13:36:45 +0000
Date: Wed, 25 Mar 2026 21:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: security/apparmor/policy_unpack.c:779 unpack_pdb() error: we
 previously assumed 'pdb->dfa' could be null (see line 752)
Message-ID: <202603252131.qopHYuyH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: John Johansen <john.johansen@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 2e12c5f060176ede209673e4f63ea5d0e3c5814c apparmor: add additional flags to extended permission.
date:   1 year, 2 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 2 months ago
config: openrisc-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252131.qopHYuyH-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603252131.qopHYuyH-lkp@intel.com/

New smatch warnings:
security/apparmor/policy_unpack.c:779 unpack_pdb() error: we previously assumed 'pdb->dfa' could be null (see line 752)

Old smatch warnings:
security/apparmor/policy_unpack.c:137 aa_loaddata_kref() warn: can 'd' even be NULL?
security/apparmor/policy_unpack.c:1268 verify_profile() warn: can 'rules' even be NULL?

vim +779 security/apparmor/policy_unpack.c

fd1b2b95a21177 John Johansen        2022-08-26  710  
98b824ff8984fd John Johansen        2023-04-28  711  static int unpack_pdb(struct aa_ext *e, struct aa_policydb **policy,
ad596ea74e746d John Johansen        2022-07-18  712  		      bool required_dfa, bool required_trans,
ad596ea74e746d John Johansen        2022-07-18  713  		      const char **info)
ad596ea74e746d John Johansen        2022-07-18  714  {
98b824ff8984fd John Johansen        2023-04-28  715  	struct aa_policydb *pdb;
fd1b2b95a21177 John Johansen        2022-08-26  716  	void *pos = e->pos;
fd1b2b95a21177 John Johansen        2022-08-26  717  	int i, flags, error = -EPROTO;
5515a8e30eaa8a Muhammad Usama Anjum 2022-10-04  718  	ssize_t size;
2e12c5f060176e John Johansen        2023-07-23  719  	u32 version = 0;
fd1b2b95a21177 John Johansen        2022-08-26  720  
98b824ff8984fd John Johansen        2023-04-28  721  	pdb = aa_alloc_pdb(GFP_KERNEL);
98b824ff8984fd John Johansen        2023-04-28  722  	if (!pdb)
98b824ff8984fd John Johansen        2023-04-28  723  		return -ENOMEM;
98b824ff8984fd John Johansen        2023-04-28  724  
98b824ff8984fd John Johansen        2023-04-28  725  	size = unpack_perms_table(e, &pdb->perms);
5515a8e30eaa8a Muhammad Usama Anjum 2022-10-04  726  	if (size < 0) {
5515a8e30eaa8a Muhammad Usama Anjum 2022-10-04  727  		error = size;
98b824ff8984fd John Johansen        2023-04-28  728  		pdb->perms = NULL;
fd1b2b95a21177 John Johansen        2022-08-26  729  		*info = "failed to unpack - perms";
fd1b2b95a21177 John Johansen        2022-08-26  730  		goto fail;
5515a8e30eaa8a Muhammad Usama Anjum 2022-10-04  731  	}
98b824ff8984fd John Johansen        2023-04-28  732  	pdb->size = size;
5515a8e30eaa8a Muhammad Usama Anjum 2022-10-04  733  
98b824ff8984fd John Johansen        2023-04-28  734  	if (pdb->perms) {
fd1b2b95a21177 John Johansen        2022-08-26  735  		/* perms table present accept is index */
fd1b2b95a21177 John Johansen        2022-08-26  736  		flags = TO_ACCEPT1_FLAG(YYTD_DATA32);
2e12c5f060176e John Johansen        2023-07-23  737  		if (aa_unpack_u32(e, &version, "permsv") && version > 2)
2e12c5f060176e John Johansen        2023-07-23  738  			/* accept2 used for dfa flags */
2e12c5f060176e John Johansen        2023-07-23  739  			flags |= TO_ACCEPT2_FLAG(YYTD_DATA32);
fd1b2b95a21177 John Johansen        2022-08-26  740  	} else {
fd1b2b95a21177 John Johansen        2022-08-26  741  		/* packed perms in accept1 and accept2 */
fd1b2b95a21177 John Johansen        2022-08-26  742  		flags = TO_ACCEPT1_FLAG(YYTD_DATA32) |
fd1b2b95a21177 John Johansen        2022-08-26  743  			TO_ACCEPT2_FLAG(YYTD_DATA32);
fd1b2b95a21177 John Johansen        2022-08-26  744  	}
ad596ea74e746d John Johansen        2022-07-18  745  
98b824ff8984fd John Johansen        2023-04-28  746  	pdb->dfa = unpack_dfa(e, flags);
98b824ff8984fd John Johansen        2023-04-28  747  	if (IS_ERR(pdb->dfa)) {
98b824ff8984fd John Johansen        2023-04-28  748  		error = PTR_ERR(pdb->dfa);
98b824ff8984fd John Johansen        2023-04-28  749  		pdb->dfa = NULL;
ad596ea74e746d John Johansen        2022-07-18  750  		*info = "failed to unpack - dfa";
fd1b2b95a21177 John Johansen        2022-08-26  751  		goto fail;
98b824ff8984fd John Johansen        2023-04-28 @752  	} else if (!pdb->dfa) {
ad596ea74e746d John Johansen        2022-07-18  753  		if (required_dfa) {
ad596ea74e746d John Johansen        2022-07-18  754  			*info = "missing required dfa";
fd1b2b95a21177 John Johansen        2022-08-26  755  			goto fail;
ad596ea74e746d John Johansen        2022-07-18  756  		}
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  757  	} else {
ad596ea74e746d John Johansen        2022-07-18  758  		/*
ad596ea74e746d John Johansen        2022-07-18  759  		 * only unpack the following if a dfa is present
ad596ea74e746d John Johansen        2022-07-18  760  		 *
ad596ea74e746d John Johansen        2022-07-18  761  		 * sadly start was given different names for file and policydb
ad596ea74e746d John Johansen        2022-07-18  762  		 * but since it is optional we can try both
ad596ea74e746d John Johansen        2022-07-18  763  		 */
98b824ff8984fd John Johansen        2023-04-28  764  		if (!aa_unpack_u32(e, &pdb->start[0], "start"))
ad596ea74e746d John Johansen        2022-07-18  765  			/* default start state */
98b824ff8984fd John Johansen        2023-04-28  766  			pdb->start[0] = DFA_START;
98b824ff8984fd John Johansen        2023-04-28  767  		if (!aa_unpack_u32(e, &pdb->start[AA_CLASS_FILE], "dfa_start")) {
ad596ea74e746d John Johansen        2022-07-18  768  			/* default start state for xmatch and file dfa */
98b824ff8984fd John Johansen        2023-04-28  769  			pdb->start[AA_CLASS_FILE] = DFA_START;
ad596ea74e746d John Johansen        2022-07-18  770  		}	/* setup class index */
ad596ea74e746d John Johansen        2022-07-18  771  		for (i = AA_CLASS_FILE + 1; i <= AA_CLASS_LAST; i++) {
98b824ff8984fd John Johansen        2023-04-28  772  			pdb->start[i] = aa_dfa_next(pdb->dfa, pdb->start[0],
ad596ea74e746d John Johansen        2022-07-18  773  						    i);
ad596ea74e746d John Johansen        2022-07-18  774  		}
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  775  	}
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  776  
2e12c5f060176e John Johansen        2023-07-23  777  	if (pdb->perms && version <= 2) {
2e12c5f060176e John Johansen        2023-07-23  778  		/* add dfa flags table missing in v2 */
2e12c5f060176e John Johansen        2023-07-23 @779  		u32 noents = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_lolen;
2e12c5f060176e John Johansen        2023-07-23  780  		u16 tdflags = pdb->dfa->tables[YYTD_ID_ACCEPT]->td_flags;
2e12c5f060176e John Johansen        2023-07-23  781  		size_t tsize = table_size(noents, tdflags);
2e12c5f060176e John Johansen        2023-07-23  782  
2e12c5f060176e John Johansen        2023-07-23  783  		pdb->dfa->tables[YYTD_ID_ACCEPT2] = kvzalloc(tsize, GFP_KERNEL);
2e12c5f060176e John Johansen        2023-07-23  784  		if (!pdb->dfa->tables[YYTD_ID_ACCEPT2]) {
2e12c5f060176e John Johansen        2023-07-23  785  			*info = "failed to alloc dfa flags table";
2e12c5f060176e John Johansen        2023-07-23  786  			goto out;
2e12c5f060176e John Johansen        2023-07-23  787  		}
2e12c5f060176e John Johansen        2023-07-23  788  		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_lolen = noents;
2e12c5f060176e John Johansen        2023-07-23  789  		pdb->dfa->tables[YYTD_ID_ACCEPT2]->td_flags = tdflags;
2e12c5f060176e John Johansen        2023-07-23  790  	}
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  791  	/*
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  792  	 * Unfortunately due to a bug in earlier userspaces, a
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  793  	 * transition table may be present even when the dfa is
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  794  	 * not. For compatibility reasons unpack and discard.
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  795  	 */
98b824ff8984fd John Johansen        2023-04-28  796  	if (!unpack_trans_table(e, &pdb->trans) && required_trans) {
ad596ea74e746d John Johansen        2022-07-18  797  		*info = "failed to unpack profile transition table";
fd1b2b95a21177 John Johansen        2022-08-26  798  		goto fail;
ad596ea74e746d John Johansen        2022-07-18  799  	}
ad596ea74e746d John Johansen        2022-07-18  800  
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  801  	if (!pdb->dfa && pdb->trans.table)
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  802  		aa_free_str_table(&pdb->trans);
e0ff0cff1f6cdc Georgia Garcia       2024-06-10  803  
670f31774ab6bf John Johansen        2022-08-26  804  	/* TODO: move compat mapping here, requires dfa merging first */
670f31774ab6bf John Johansen        2022-08-26  805  	/* TODO: move verify here, it has to be done after compat mappings */
2e12c5f060176e John Johansen        2023-07-23  806  out:
98b824ff8984fd John Johansen        2023-04-28  807  	*policy = pdb;
ad596ea74e746d John Johansen        2022-07-18  808  	return 0;
fd1b2b95a21177 John Johansen        2022-08-26  809  
fd1b2b95a21177 John Johansen        2022-08-26  810  fail:
98b824ff8984fd John Johansen        2023-04-28  811  	aa_put_pdb(pdb);
fd1b2b95a21177 John Johansen        2022-08-26  812  	e->pos = pos;
fd1b2b95a21177 John Johansen        2022-08-26  813  	return error;
ad596ea74e746d John Johansen        2022-07-18  814  }
ad596ea74e746d John Johansen        2022-07-18  815  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
