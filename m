Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBBF23AB98
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766578855; cv=none; b=sBSDai/ZNBiQTnvfXmQXyijcyby1HgCYk6JdG6SCGR63vSo/xOw+HJp9W2x3MNlB7BC1GYeNzo6POXrDdyx1e16xhgmtmcVKhCFwpe/IZ9skclbbVxK3ZS4PdJNRPRUfhEPKWIPW1vN5kx+nWz51KdaULTxj6flMAgowhMBt+IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766578855; c=relaxed/simple;
	bh=njfllEbI9ij1Pcf5Gh/otYkkxSgxQUgbnP2k4q0gpxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LguB6YfaaMTikStnDkT4bn8Y2bIRmbGXJz8Exnijj27icE5QgvkLJXW1LDLR3FpGURlcZJafStxfGUMSanLyWmnxuit9GMNGzR9YIS3qbn8/x/vdn+fsuAYKOwLHvzxfDaweGRmLt1iHnw3lRPBEZQ007D1Xl5YiBzP5t24VEZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEGbUg2y; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEGbUg2y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766578854; x=1798114854;
  h=date:from:to:cc:subject:message-id;
  bh=njfllEbI9ij1Pcf5Gh/otYkkxSgxQUgbnP2k4q0gpxA=;
  b=GEGbUg2yQ9PgHvvkAG5tUWMfvFRL4TPCbS2s0r/OYvIsECmuy0v3XcE6
   ybWq3sBOuPlhORyBjGxjaKsi1u22MRO4jq9LAMulg9liZxw3SCiUMdrN6
   wHr+EJ0NsvlfT8xEYLh4OdErWZzzKhgOdlWkTFRsuPAylotI7go18NxAl
   uUMRlEuRvMw0vzW0Tgc+L/bpQ7Okcc0vYbehP0PlC2MIwmKZk1bYBzPQP
   Jpo9+xmuFC63oZHs9/xVooSRe4JLoSNYQYcoXC4rW+HH1ktcZjk+yUBR1
   exIUixqoo9byp85xnk3OUcVcYh3WA3niS01ITkKObbBGU4THGsvN/SOxl
   A==;
X-CSE-ConnectionGUID: ql/Wuk3gTO241mOTeud+Qg==
X-CSE-MsgGUID: 0PXkxRC9QAKc3K+MlCPErA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72269830"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="72269830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 04:20:53 -0800
X-CSE-ConnectionGUID: 1D2KXID0TEWpAYAXU/wWvw==
X-CSE-MsgGUID: nG7Y7wMwRlqaM54VyUPrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="200909353"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Dec 2025 04:20:51 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYNrF-0000000032Q-1Ok7;
	Wed, 24 Dec 2025 12:20:49 +0000
Date: Wed, 24 Dec 2025 20:18:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 69/72] drivers/acpi/bus.c:339
 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see line
 332)
Message-ID: <202512242052.W4GhDauV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-acpi@vger.kernel.org
CC: linux-pm@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: Jonathan Cameron <jonathan.cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   e08ef982088f28cd65654693f29ffe430a9d4d66
commit: e5322888e6bf4ec17964a93638c9b14433a2f6f1 [69/72] ACPI: bus: Rework the handling of \_SB._OSC platform features
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242052.W4GhDauV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512242052.W4GhDauV-lkp@intel.com/

New smatch warnings:
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: variable dereferenced before check 'cap' (see line 332)
drivers/acpi/bus.c:339 acpi_osc_handshake() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/acpi/bus.c:297 acpi_run_osc() warn: sizeof(NUMBER)?

vim +/cap +339 drivers/acpi/bus.c

70023de88c58a8 Shaohua Li        2009-10-29  327  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  328  static int acpi_osc_handshake(acpi_handle handle, const char *uuid_str,
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  329  			      int rev, struct acpi_buffer *cap)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  330  {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  331  	union acpi_object in_params[4], *out_obj;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @332  	size_t bufsize = cap->length / sizeof(u32);
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  333  	struct acpi_object_list input;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  334  	struct acpi_buffer output;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  335  	u32 *capbuf, *retbuf, test;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  336  	guid_t guid;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  337  	int ret, i;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  338  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22 @339  	if (!cap || cap->length < 2 * sizeof(32) || guid_parse(uuid_str, &guid))
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  340  		return -EINVAL;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  341  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  342  	/* First evaluate _OSC with OSC_QUERY_ENABLE set. */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  343  	capbuf = cap->pointer;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  344  	capbuf[OSC_QUERY_DWORD] = OSC_QUERY_ENABLE;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  345  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  346  	ret = acpi_eval_osc(handle, &guid, rev, cap, in_params, &output);
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  347  	if (ret)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  348  		return ret;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  349  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  350  	out_obj = output.pointer;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  351  	retbuf = (u32 *)out_obj->buffer.pointer;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  352  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  353  	if (acpi_osc_error_check(handle, &guid, rev, cap, retbuf)) {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  354  		ret = -ENODATA;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  355  		goto out;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  356  	}
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  357  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  358  	/*
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  359  	 * Clear the feature bits in the capabilities buffer that have not been
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  360  	 * acknowledged and clear the return buffer.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  361  	 */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  362  	for (i = OSC_QUERY_DWORD + 1, test = 0; i < bufsize; i++) {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  363  		capbuf[i] &= retbuf[i];
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  364  		test |= capbuf[i];
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  365  		retbuf[i] = 0;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  366  	}
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  367  	/*
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  368  	 * If none of the feature bits have been acknowledged, there's nothing
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  369  	 * more to do.  capbuf[] contains a feature mask of all zeros.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  370  	 */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  371  	if (!test)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  372  		goto out;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  373  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  374  	retbuf[OSC_QUERY_DWORD] = 0;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  375  	/*
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  376  	 * Now evaluate _OSC again (directly) with OSC_QUERY_ENABLE clear and
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  377  	 * the updated input and output buffers used before.  Since the feature
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  378  	 * bits that were clear in the return buffer from the previous _OSC
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  379  	 * evaluation are also clear in the capabilities buffer now, this _OSC
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  380  	 * evaluation is not expected to fail.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  381  	 */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  382  	capbuf[OSC_QUERY_DWORD] = 0;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  383  	/* Reuse in_params[] populated by acpi_eval_osc(). */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  384  	input.pointer = in_params;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  385  	input.count = 4;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  386  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  387  	if (ACPI_FAILURE(acpi_evaluate_object(handle, "_OSC", &input, &output))) {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  388  		ret = -ENODATA;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  389  		goto out;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  390  	}
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  391  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  392  	/*
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  393  	 * Clear the feature bits in capbuf[] that have not been acknowledged.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  394  	 * After that, capbuf[] contains the resultant feature mask.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  395  	 */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  396  	for (i = OSC_QUERY_DWORD + 1; i < bufsize; i++)
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  397  		capbuf[i] &= retbuf[i];
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  398  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  399  	if (retbuf[OSC_QUERY_DWORD] & OSC_ERROR_MASK) {
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  400  		/*
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  401  		 * Complain about the unexpected errors and print diagnostic
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  402  		 * information related to them.
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  403  		 */
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  404  		acpi_handle_err(handle, "_OSC: errors while processing control request\n");
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  405  		acpi_handle_err(handle, "_OSC: some features may be missing\n");
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  406  		acpi_osc_error_check(handle, &guid, rev, cap, retbuf);
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  407  	}
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  408  
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  409  out:
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  410  	ACPI_FREE(out_obj);
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  411  	return ret;
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  412  }
e5322888e6bf4e Rafael J. Wysocki 2025-12-22  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
