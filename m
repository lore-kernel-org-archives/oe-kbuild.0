Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA67A4437C
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jan 2025 01:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508804; cv=none; b=ByNLORFIvAzJ7ehugNgvK+0ZPr7xth0rwb744R6LKgbI8CAhJI6ArMGWNvIsxnJYcRHhclM5A0UZc94Z1rahzR1648+gePBmRJfvKHgMGvnqeIWIfbnKRupLpET04S9/HCLMi1seZLgY0POZTyBDOt9cDZ2H70BatPofSvs/rJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508804; c=relaxed/simple;
	bh=RELl7R0C6Lyln8bLoCR+E1RNxtvsdAkNLEdxoe4dyn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJPfjxlkQuFuRjXo4bfBQbNoV4wL3aPZhmvZT3l3UpxQozfFbNEUB/lAtwPANnZBJmVhvPLBc8IMcqP3UDsJYmnDtKuVSx6maPNPbmkAS4LulmFkG58ilvA5GigFAjLcj8nsEiHH4k7VDvRdUo/csCJpYe2Ouje93z56ENkmFC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UIwl1l7O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UIwl1l7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737508803; x=1769044803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RELl7R0C6Lyln8bLoCR+E1RNxtvsdAkNLEdxoe4dyn8=;
  b=UIwl1l7OJaMTMaNo16T1aMhRvAaLg+2lClw5y6vsnT+OPfHLPQUFjHuf
   dVZZTTS7Z2Vm9E4XtctnIl8nPUzZMlyVlPzuWlq0b13cjOpBh8yFRp8WI
   DZPnTC8wB4Gxv8mg4CdLmlzwa2xyaqYlY1CbjV/rxsQDhin3e9fF1Qlp3
   xt0RarXuUjsPx50OoVuz7ZYLWJ1LSvgqx0uo9sluora31D/ckPbPGZKCe
   Q9lWgAdQdaIkBuNv1BQ8dlKKuvCNScz9lLJEJm59C4wFgnL/2vl5tWixG
   kFnp+LnftX+avw5vdV8LsRfDz0u9jsAAHV5+fi8anH4hlZUDIm7WIFgVB
   A==;
X-CSE-ConnectionGUID: KfDdBjJER52mr3GCNg+XBw==
X-CSE-MsgGUID: mmmrqKqvTDOOU1YevtcGUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37647249"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37647249"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:20:00 -0800
X-CSE-ConnectionGUID: DjUpFihtRX2AydNUc9CbxA==
X-CSE-MsgGUID: rfp3ruxrSNqOTXNN8PNA8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="111981559"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2025 17:19:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taPPQ-000ZFA-0u;
	Wed, 22 Jan 2025 01:19:56 +0000
Date: Wed, 22 Jan 2025 09:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9433/10009] security/apparmor/policy_unpack.c:779
 unpack_pdb() error: we previously assumed 'pdb->dfa' could be null (see line
 752)
Message-ID: <202501220928.QBbEZWIl-lkp@intel.com>
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
TO: John Johansen <john.johansen@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f066b5a6c7a06adfb666b7652cc99b4ff264f4ed
commit: 2e12c5f060176ede209673e4f63ea5d0e3c5814c [9433/10009] apparmor: add additional flags to extended permission.
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: sparc64-randconfig-r072-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220928.QBbEZWIl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501220928.QBbEZWIl-lkp@intel.com/

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
