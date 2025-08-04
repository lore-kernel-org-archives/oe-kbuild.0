Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0677D199252
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 01:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754271762; cv=none; b=csGgGUANfEEI/qA6tULdpxw9w1O57uyyo7YasI54ByMeZuIYtEVu5XXPCfCYsjJnnCdcRNWXOBVag7FrpmdMfvfc+9A+n7+yFp1hkLxWc40OFm+dCLqkchIVvQ6FnjIMnsOgvDq9B7JljEcxqHRvOonLfn5zzfOsfaXmXwJNG2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754271762; c=relaxed/simple;
	bh=GtJlIqOd+BvtM3ofpUXwkgnVNa3GtoLxdPzXW4z5k3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CIq4PkJ8p4AWQ/jwZFVAuj1WMEH0zxxxOLmbg8wDcVfkuKS111hSKc1DPgM79Xqzjo3P6PAZMpZHZXby4InzAprnZ57q99LnCqk1/rNEQXwfGG/YxORoq8Rb5+qNFGGGZTxPqDJbF1v6UJzdj8zDQ/vjQ1LAU9RJB6DGvpAEZLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fI/ISw/f; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fI/ISw/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754271760; x=1785807760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GtJlIqOd+BvtM3ofpUXwkgnVNa3GtoLxdPzXW4z5k3I=;
  b=fI/ISw/f4XHhv8AiQLl2s3GHcHJ8VCwNAGrsIcvTI1R3+3lRD3zbsZeA
   SPR+ArH1cCxxwNqVhwKtQNTre8aYcREkLSX9RVU3CCwXc02wF5PZWjWFD
   hKJ4KA+WaRjcDZjhc3EWCQkhXxRhnZLZHakXbkjPnkDQz3Z6xfdQdERvf
   m49P4AHRbn8fjbpNS+cxersmaCkPg1I5A1Zn+1ETeXkW0uwbq2iUEhdfK
   8mabYCjOYhbYcdJZwpHRSgjk4Fat2jWhHLBw+cFwOIc7C93KBZXzsiC52
   OsZT9fgUxzszFs9+uU7PmeyDQdflhX0OFTulRpTfSIway2w+VPCA4C1JH
   g==;
X-CSE-ConnectionGUID: mT+4HOwkQfOQUKeu0Rqhqw==
X-CSE-MsgGUID: r8gx7tPTQUyM8G4siP4EUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="66798909"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="66798909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2025 18:42:40 -0700
X-CSE-ConnectionGUID: /2gBEz2URvq/auAqeMqhrQ==
X-CSE-MsgGUID: IG5zQM6OReSLFOAjVFF+fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168490680"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2025 18:42:39 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uikDk-0006jI-0L;
	Mon, 04 Aug 2025 01:42:36 +0000
Date: Mon, 4 Aug 2025 09:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate
 struct bpf_key
Message-ID: <202508040803.nwExqJWe-lkp@intel.com>
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
In-Reply-To: <20250730172745.8480-4-James.Bottomley@HansenPartnership.com>
References: <20250730172745.8480-4-James.Bottomley@HansenPartnership.com>
TO: James Bottomley <James.Bottomley@HansenPartnership.com>
TO: bpf@vger.kernel.org
TO: linux-trace-kernel@vger.kernel.org
CC: Roberto Sassu <roberto.sassu@huawei.com>

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master linus/master v6.16 next-20250801]
[cannot apply to bpf-next/net]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Bottomley/bpf-make-bpf_key-an-opaque-type/20250731-013040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250730172745.8480-4-James.Bottomley%40HansenPartnership.com
patch subject: [PATCH v2 3/3] bpf: eliminate the allocation of an intermediate struct bpf_key
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20250803 (https://download.01.org/0day-ci/archive/20250804/202508040803.nwExqJWe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508040803.nwExqJWe-lkp@intel.com/

smatch warnings:
kernel/trace/bpf_trace.c:1364 bpf_verify_pkcs7_signature() warn: impossible condition '(key == BUILTIN_KEY) => (0-u32max == u64max)'

vim +1364 kernel/trace/bpf_trace.c

f3cf4134c5c6c4 Roberto Sassu   2022-09-20  1340  
865b0566d8f1a0 Roberto Sassu   2022-09-20  1341  #ifdef CONFIG_SYSTEM_DATA_VERIFICATION
865b0566d8f1a0 Roberto Sassu   2022-09-20  1342  /**
865b0566d8f1a0 Roberto Sassu   2022-09-20  1343   * bpf_verify_pkcs7_signature - verify a PKCS#7 signature
cce4c40b960673 Daniel Xu       2024-06-12  1344   * @data_p: data to verify
cce4c40b960673 Daniel Xu       2024-06-12  1345   * @sig_p: signature of the data
865b0566d8f1a0 Roberto Sassu   2022-09-20  1346   * @trusted_keyring: keyring with keys trusted for signature verification
865b0566d8f1a0 Roberto Sassu   2022-09-20  1347   *
865b0566d8f1a0 Roberto Sassu   2022-09-20  1348   * Verify the PKCS#7 signature *sig_ptr* against the supplied *data_ptr*
865b0566d8f1a0 Roberto Sassu   2022-09-20  1349   * with keys in a keyring referenced by *trusted_keyring*.
865b0566d8f1a0 Roberto Sassu   2022-09-20  1350   *
865b0566d8f1a0 Roberto Sassu   2022-09-20  1351   * Return: 0 on success, a negative value on error.
865b0566d8f1a0 Roberto Sassu   2022-09-20  1352   */
cce4c40b960673 Daniel Xu       2024-06-12  1353  __bpf_kfunc int bpf_verify_pkcs7_signature(struct bpf_dynptr *data_p,
cce4c40b960673 Daniel Xu       2024-06-12  1354  			       struct bpf_dynptr *sig_p,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1355  			       struct bpf_key *trusted_keyring)
865b0566d8f1a0 Roberto Sassu   2022-09-20  1356  {
cce4c40b960673 Daniel Xu       2024-06-12  1357  	struct bpf_dynptr_kern *data_ptr = (struct bpf_dynptr_kern *)data_p;
cce4c40b960673 Daniel Xu       2024-06-12  1358  	struct bpf_dynptr_kern *sig_ptr = (struct bpf_dynptr_kern *)sig_p;
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1359  	struct key *key = (struct key *)trusted_keyring;
74523c06ae20b8 Song Liu        2023-11-06  1360  	const void *data, *sig;
74523c06ae20b8 Song Liu        2023-11-06  1361  	u32 data_len, sig_len;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1362  	int ret;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1363  
9cc2aa8d6b5c93 James Bottomley 2025-07-30 @1364  	if ((unsigned long)key == BUILTIN_KEY)
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1365  		key = NULL;
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1366  
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1367  	if (system_keyring_id_check((unsigned long)key) < 0) {
865b0566d8f1a0 Roberto Sassu   2022-09-20  1368  		/*
865b0566d8f1a0 Roberto Sassu   2022-09-20  1369  		 * Do the permission check deferred in bpf_lookup_user_key().
865b0566d8f1a0 Roberto Sassu   2022-09-20  1370  		 * See bpf_lookup_user_key() for more details.
865b0566d8f1a0 Roberto Sassu   2022-09-20  1371  		 *
865b0566d8f1a0 Roberto Sassu   2022-09-20  1372  		 * A call to key_task_permission() here would be redundant, as
865b0566d8f1a0 Roberto Sassu   2022-09-20  1373  		 * it is already done by keyring_search() called by
865b0566d8f1a0 Roberto Sassu   2022-09-20  1374  		 * find_asymmetric_key().
865b0566d8f1a0 Roberto Sassu   2022-09-20  1375  		 */
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1376  		ret = key_validate(key);
865b0566d8f1a0 Roberto Sassu   2022-09-20  1377  		if (ret < 0)
865b0566d8f1a0 Roberto Sassu   2022-09-20  1378  			return ret;
865b0566d8f1a0 Roberto Sassu   2022-09-20  1379  	}
865b0566d8f1a0 Roberto Sassu   2022-09-20  1380  
74523c06ae20b8 Song Liu        2023-11-06  1381  	data_len = __bpf_dynptr_size(data_ptr);
74523c06ae20b8 Song Liu        2023-11-06  1382  	data = __bpf_dynptr_data(data_ptr, data_len);
74523c06ae20b8 Song Liu        2023-11-06  1383  	sig_len = __bpf_dynptr_size(sig_ptr);
74523c06ae20b8 Song Liu        2023-11-06  1384  	sig = __bpf_dynptr_data(sig_ptr, sig_len);
74523c06ae20b8 Song Liu        2023-11-06  1385  
9cc2aa8d6b5c93 James Bottomley 2025-07-30  1386  	return verify_pkcs7_signature(data, data_len, sig, sig_len, key,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1387  				      VERIFYING_UNSPECIFIED_SIGNATURE, NULL,
865b0566d8f1a0 Roberto Sassu   2022-09-20  1388  				      NULL);
865b0566d8f1a0 Roberto Sassu   2022-09-20  1389  }
865b0566d8f1a0 Roberto Sassu   2022-09-20  1390  #endif /* CONFIG_SYSTEM_DATA_VERIFICATION */
865b0566d8f1a0 Roberto Sassu   2022-09-20  1391  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
