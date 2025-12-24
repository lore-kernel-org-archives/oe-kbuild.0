Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E8B1E1A17
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 10:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570519; cv=none; b=AdMWcmKNkP2HOojQtTlGyoy6Y4NNEKD6+mDIx7PFIyFY7PPdgsyrkt1tK8p69y1z2TKS1eYpJtGDmF2japU6IX3Wque7/qY2+CTc9krPcVlFQ5ZBAjAh0NUi7rkrkD0sOpoGmkM6ukQKn+kx7OBgz5dMsENFNIfTmBQfll4Fzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570519; c=relaxed/simple;
	bh=RjNMI6ynHBkOCn27ucwwRcnYj+1DoKplqhXGcRT2cF4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OpWj2eZ/VE31PUC6xxGrqOaT/X9dxDYWUMPsWl26KOqFRI/5LwNZcA2aBNgMWvYuHiuiiCtLZPn+B7NpGa9AszCFn4d+RoM/t66BWoBRT/Z3QHWwBItxwlrFrDm8/BbgKacRD+BrrZ2Ww7MiAlfRD4GFTcbcm302OE/+iUFtBho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ge6LkVhM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ge6LkVhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766570517; x=1798106517;
  h=date:from:to:cc:subject:message-id;
  bh=RjNMI6ynHBkOCn27ucwwRcnYj+1DoKplqhXGcRT2cF4=;
  b=Ge6LkVhMjO/3AYuZ5RsCKCGB0XhE/lJbdJPgJo6+qD36hK6hrbCKf/au
   Kd5BTaL3JqM/Dxfm2bj2hvCUschr5rCLjRNohiGFDtwrkBQjrN7UGddbp
   Q9ey4NHzxCAbq6Ai5bLhVyZsQdeDWg5ghH6AbMExo8i3n3112E/ZJzyhq
   QTaNPIh+ihCe8hCiQPeem7RDjkcOSB1B/mvHCfoVQhyGhv+lZ4Z7O0b3a
   tZfBq72xzkQptlYw7ZfUieeDwuW451OTok3lfnMdoyk2SAKVPScKGigUQ
   WERK6KtPCLolrH2O17nHt7n9cBGV/X7Tkkoc1wuaCx9GfYunCwn0SolTa
   g==;
X-CSE-ConnectionGUID: VdCzH3MkRqyxAtmO/vnM5g==
X-CSE-MsgGUID: evP8Iv/ERtupQ/sUwkyozA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="67606159"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="67606159"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 02:01:56 -0800
X-CSE-ConnectionGUID: fi0WQ73QSs2Wem9DQhNzwQ==
X-CSE-MsgGUID: rWUOBmSWRL2iGGmEzjvu0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="237379719"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Dec 2025 02:01:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYLgm-000000002uh-3Gp7;
	Wed, 24 Dec 2025 10:01:52 +0000
Date: Wed, 24 Dec 2025 18:00:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [rafael-pm:bleeding-edge 66/72] drivers/acpi/bus.c:250
 acpi_run_osc() warn: sizeof(NUMBER)?
Message-ID: <202512241708.7DS1fnLr-lkp@intel.com>
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
commit: 7d703df7f4f5646d9d9f866a930843f838c9979b [66/72] ACPI: bus: Split _OSC evaluation out of acpi_run_osc()
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241708.7DS1fnLr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512241708.7DS1fnLr-lkp@intel.com/

New smatch warnings:
drivers/acpi/bus.c:250 acpi_run_osc() warn: sizeof(NUMBER)?

Old smatch warnings:
drivers/acpi/bus.c:249 acpi_run_osc() warn: variable dereferenced before check 'context' (see line 242)

vim +250 drivers/acpi/bus.c

7d703df7f4f564 Rafael J. Wysocki 2025-12-22  239  
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  240  acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context)
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  241  {
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  242  	u32 errors, *capbuf = context->cap.pointer;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  243  	union acpi_object in_params[4], *out_obj;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  244  	struct acpi_buffer output;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  245  	acpi_status status = AE_OK;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  246  	guid_t guid;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  247  	int ret;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  248  
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  249  	if (!context || !context->cap.pointer ||
7d703df7f4f564 Rafael J. Wysocki 2025-12-22 @250  	    context->cap.length < 2 * sizeof(32) ||
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  251  	    guid_parse(context->uuid_str, &guid))
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  252  		return AE_BAD_PARAMETER;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  253  
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  254  	ret = acpi_eval_osc(handle, &guid, context->rev, &context->cap,
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  255  			    in_params, &output);
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  256  	if (ret)
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  257  		return AE_ERROR;
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  258  
7d703df7f4f564 Rafael J. Wysocki 2025-12-22  259  	out_obj = output.pointer;
bb203a649c26bb Rafael J. Wysocki 2025-12-22  260  	/* Only take defined error bits into account. */
bb203a649c26bb Rafael J. Wysocki 2025-12-22  261  	errors = *((u32 *)out_obj->buffer.pointer) & OSC_ERROR_MASK;
bb203a649c26bb Rafael J. Wysocki 2025-12-22  262  	/*
bb203a649c26bb Rafael J. Wysocki 2025-12-22  263  	 * If OSC_QUERY_ENABLE is set, ignore the "capabilities masked"
bb203a649c26bb Rafael J. Wysocki 2025-12-22  264  	 * bit because it merely means that some features have not been
bb203a649c26bb Rafael J. Wysocki 2025-12-22  265  	 * acknowledged which is not unexpected.
bb203a649c26bb Rafael J. Wysocki 2025-12-22  266  	 */
bb203a649c26bb Rafael J. Wysocki 2025-12-22  267  	if (capbuf[OSC_QUERY_DWORD] & OSC_QUERY_ENABLE)
bb203a649c26bb Rafael J. Wysocki 2025-12-22  268  		errors &= ~OSC_CAPABILITIES_MASK_ERROR;
bb203a649c26bb Rafael J. Wysocki 2025-12-22  269  
70023de88c58a8 Shaohua Li        2009-10-29  270  	if (errors) {
bb203a649c26bb Rafael J. Wysocki 2025-12-22  271  		/*
bb203a649c26bb Rafael J. Wysocki 2025-12-22  272  		 * As a rule, fail only if OSC_QUERY_ENABLE is set because
bb203a649c26bb Rafael J. Wysocki 2025-12-22  273  		 * otherwise the acknowledged features need to be controlled.
bb203a649c26bb Rafael J. Wysocki 2025-12-22  274  		 */
bb203a649c26bb Rafael J. Wysocki 2025-12-22  275  		bool fail = !!(capbuf[OSC_QUERY_DWORD] & OSC_QUERY_ENABLE);
bb203a649c26bb Rafael J. Wysocki 2025-12-22  276  
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  277  		acpi_dump_osc_data(handle, &guid, context->rev, &context->cap);
bb203a649c26bb Rafael J. Wysocki 2025-12-22  278  		if (errors & OSC_INVALID_UUID_ERROR) {
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  279  			acpi_handle_debug(handle, "_OSC: invalid UUID");
bb203a649c26bb Rafael J. Wysocki 2025-12-22  280  			/*
bb203a649c26bb Rafael J. Wysocki 2025-12-22  281  			 * Always fail if this bit is set because it means that
bb203a649c26bb Rafael J. Wysocki 2025-12-22  282  			 * the request could not be processed.
bb203a649c26bb Rafael J. Wysocki 2025-12-22  283  			 */
bb203a649c26bb Rafael J. Wysocki 2025-12-22  284  			fail = true;
bb203a649c26bb Rafael J. Wysocki 2025-12-22  285  			goto out_kfree;
bb203a649c26bb Rafael J. Wysocki 2025-12-22  286  		}
70023de88c58a8 Shaohua Li        2009-10-29  287  		if (errors & OSC_REQUEST_ERROR)
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  288  			acpi_handle_debug(handle, "_OSC: request failed");
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  289  
70023de88c58a8 Shaohua Li        2009-10-29  290  		if (errors & OSC_INVALID_REVISION_ERROR)
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  291  			acpi_handle_debug(handle, "_OSC: invalid revision");
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  292  
bb203a649c26bb Rafael J. Wysocki 2025-12-22  293  		if (errors & OSC_CAPABILITIES_MASK_ERROR)
06bf78f82f4551 Rafael J. Wysocki 2025-12-22  294  			acpi_handle_debug(handle, "_OSC: capability bits masked");
bb203a649c26bb Rafael J. Wysocki 2025-12-22  295  
bb203a649c26bb Rafael J. Wysocki 2025-12-22  296  		if (fail) {
70023de88c58a8 Shaohua Li        2009-10-29  297  			status = AE_ERROR;
70023de88c58a8 Shaohua Li        2009-10-29  298  			goto out_kfree;
70023de88c58a8 Shaohua Li        2009-10-29  299  		}
bb203a649c26bb Rafael J. Wysocki 2025-12-22  300  	}
bb203a649c26bb Rafael J. Wysocki 2025-12-22  301  
9dc130fccb874f Shaohua Li        2009-12-23  302  	context->ret.length = out_obj->buffer.length;
e2cb5f08469c99 Andrei Epure      2013-03-11  303  	context->ret.pointer = kmemdup(out_obj->buffer.pointer,
e2cb5f08469c99 Andrei Epure      2013-03-11  304  				       context->ret.length, GFP_KERNEL);
9dc130fccb874f Shaohua Li        2009-12-23  305  	if (!context->ret.pointer) {
9dc130fccb874f Shaohua Li        2009-12-23  306  		status =  AE_NO_MEMORY;
9dc130fccb874f Shaohua Li        2009-12-23  307  		goto out_kfree;
9dc130fccb874f Shaohua Li        2009-12-23  308  	}
9dc130fccb874f Shaohua Li        2009-12-23  309  	status =  AE_OK;
70023de88c58a8 Shaohua Li        2009-10-29  310  
70023de88c58a8 Shaohua Li        2009-10-29  311  out_kfree:
9dc130fccb874f Shaohua Li        2009-12-23  312  	kfree(output.pointer);
70023de88c58a8 Shaohua Li        2009-10-29  313  	return status;
70023de88c58a8 Shaohua Li        2009-10-29  314  }
70023de88c58a8 Shaohua Li        2009-10-29  315  EXPORT_SYMBOL(acpi_run_osc);
70023de88c58a8 Shaohua Li        2009-10-29  316  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
