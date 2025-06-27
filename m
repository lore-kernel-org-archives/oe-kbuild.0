Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C2293B5E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Jun 2025 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016883; cv=none; b=hy8PrK3WsSHLrxWcdf/7kbRzs1MFmaHOllGRxBCv0BNDuJDI9LYkqZVx4wqRxS5kU2l7UUBG4rYPnZ+3bG31R/6U+fi+H33zlYj5S4pDwzDzBmF7fyeRxa7P/y4Pc63yaJfocsSl1mrWkF7Vyex3VmhTB1ASvcLyS1mppuP3yUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016883; c=relaxed/simple;
	bh=3Vw1PWwKruxGbWA3e2wXMpJPSPpYQ/WCZ2Velcp1wPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZJlUxRqkfBao/42exKb3jWMjENCix+9R2++Fc4rYkIupFVtNU1OzsxtzKeHBPbXcXbg2VW/oLUQaOZzNonYI2bQSO3d9elskWg1pH9KhlDfms/en8txvSyN8d1I1nw/ncaZ2kjEm0jhKEh3sYVZaoYQtuLHlK/CPCYUy4GYmbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXPFZxvQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXPFZxvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751016882; x=1782552882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Vw1PWwKruxGbWA3e2wXMpJPSPpYQ/WCZ2Velcp1wPg=;
  b=lXPFZxvQik8dxDdDjlGQnxpKyPvFjDajgecdlYJ+n5F2ZV/uFHzZ8RhS
   8q5gN5PeFPSInyn/CkDauJx+OIlyoeRgLsxnHJsm7X6IcTYy7Wr3BYdg1
   KkDRo0d9uEM0f3papV9mrPExJYurymi7J29Gjh2YDjLUBap66CsvfLZQf
   r7AEBFR1UkT3HulDgQTv5OjdZ1OctSxmL79vmTalv1vbU2zi2mk9yIcFg
   2jtSOIm+RagDdDwsyp3B1uFI/LEuamH5L6UD1gDwl/iZ7dW/TzSah6Hf3
   +KQCT0/vWwzUfoOdry6C2dWibJJqtQtkaoEEqB4vYNCakMEww+HIg1uqp
   g==;
X-CSE-ConnectionGUID: B1wijB6tSBGVBIXDU222lg==
X-CSE-MsgGUID: zvJpxPJIT3CSP+ZX7H0JIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="63924834"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="63924834"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 02:34:40 -0700
X-CSE-ConnectionGUID: MuB/MWvDR7+WsUDPGOhq3g==
X-CSE-MsgGUID: 8nmvDRqfRvmQD/VgnCwv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="183798529"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Jun 2025 02:34:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV5Th-000W22-10;
	Fri, 27 Jun 2025 09:34:37 +0000
Date: Fri, 27 Jun 2025 17:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] ACPI / sysfs: Replace deprecated strcpy() with sysfs_emit
Message-ID: <202506271715.y3uItX8c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/acpi/sysfs.c:186:47: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250624142134.11317-1-listout@listout.xyz>
References: <20250624142134.11317-1-listout@listout.xyz>
TO: Brahmajit Das <listout@listout.xyz>
TO: linux-hardening@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-acpi@vger.kernel.org
CC: rafael@kernel.org
CC: lenb@kernel.org
CC: lv.zheng@intel.com
CC: kees@kernel.org
CC: rui.zhang@intel.com
CC: len.brown@intel.com

Hi Brahmajit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brahmajit-Das/ACPI-sysfs-Replace-deprecated-strcpy-with-sysfs_emit/20250624-223059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250624142134.11317-1-listout%40listout.xyz
patch subject: [PATCH] ACPI / sysfs: Replace deprecated strcpy() with sysfs_emit
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-062-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271715.y3uItX8c-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271715.y3uItX8c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506271715.y3uItX8c-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/acpi/sysfs.c:186:47: sparse: sparse: unknown escape sequence: '%'

vim +186 drivers/acpi/sysfs.c

1c8fce27e275fd7 Zhang Rui      2010-07-15  155  
3e87ead41224fca Colin Ian King 2017-10-02  156  static int param_set_trace_method_name(const char *val,
3e87ead41224fca Colin Ian King 2017-10-02  157  				       const struct kernel_param *kp)
1c8fce27e275fd7 Zhang Rui      2010-07-15  158  {
7901a052a981691 Lv Zheng       2015-08-05  159  	u32 saved_flags = 0;
a0186bcf7c21907 Lv Zheng       2015-08-05  160  	bool is_abs_path = true;
1c8fce27e275fd7 Zhang Rui      2010-07-15  161  
a0186bcf7c21907 Lv Zheng       2015-08-05  162  	if (*val != '\\')
a0186bcf7c21907 Lv Zheng       2015-08-05  163  		is_abs_path = false;
a0186bcf7c21907 Lv Zheng       2015-08-05  164  
a0186bcf7c21907 Lv Zheng       2015-08-05  165  	if ((is_abs_path && strlen(val) > 1023) ||
a0186bcf7c21907 Lv Zheng       2015-08-05  166  	    (!is_abs_path && strlen(val) > 1022)) {
7901a052a981691 Lv Zheng       2015-08-05  167  		pr_err("%s: string parameter too long\n", kp->name);
7901a052a981691 Lv Zheng       2015-08-05  168  		return -ENOSPC;
1c8fce27e275fd7 Zhang Rui      2010-07-15  169  	}
1c8fce27e275fd7 Zhang Rui      2010-07-15  170  
7901a052a981691 Lv Zheng       2015-08-05  171  	/*
7901a052a981691 Lv Zheng       2015-08-05  172  	 * It's not safe to update acpi_gbl_trace_method_name without
7901a052a981691 Lv Zheng       2015-08-05  173  	 * having the tracer stopped, so we save the original tracer
7901a052a981691 Lv Zheng       2015-08-05  174  	 * state and disable it.
7901a052a981691 Lv Zheng       2015-08-05  175  	 */
7901a052a981691 Lv Zheng       2015-08-05  176  	saved_flags = acpi_gbl_trace_flags;
7901a052a981691 Lv Zheng       2015-08-05  177  	(void)acpi_debug_trace(NULL,
7901a052a981691 Lv Zheng       2015-08-05  178  			       acpi_gbl_trace_dbg_level,
7901a052a981691 Lv Zheng       2015-08-05  179  			       acpi_gbl_trace_dbg_layer,
7901a052a981691 Lv Zheng       2015-08-05  180  			       0);
7901a052a981691 Lv Zheng       2015-08-05  181  
7901a052a981691 Lv Zheng       2015-08-05  182  	/* This is a hack.  We can't kmalloc in early boot. */
a0186bcf7c21907 Lv Zheng       2015-08-05  183  	if (is_abs_path)
a2fcd73cb5e1bdc Brahmajit Das  2025-06-24  184  		sysfs_emit(trace_method_name, "%s", val);
a0186bcf7c21907 Lv Zheng       2015-08-05  185  	else {
a2fcd73cb5e1bdc Brahmajit Das  2025-06-24 @186  		sysfs_emit(trace_method_name, "\%s", val);
a0186bcf7c21907 Lv Zheng       2015-08-05  187  	}
7901a052a981691 Lv Zheng       2015-08-05  188  
7901a052a981691 Lv Zheng       2015-08-05  189  	/* Restore the original tracer state */
7901a052a981691 Lv Zheng       2015-08-05  190  	(void)acpi_debug_trace(trace_method_name,
7901a052a981691 Lv Zheng       2015-08-05  191  			       acpi_gbl_trace_dbg_level,
7901a052a981691 Lv Zheng       2015-08-05  192  			       acpi_gbl_trace_dbg_layer,
7901a052a981691 Lv Zheng       2015-08-05  193  			       saved_flags);
7901a052a981691 Lv Zheng       2015-08-05  194  
7901a052a981691 Lv Zheng       2015-08-05  195  	return 0;
1c8fce27e275fd7 Zhang Rui      2010-07-15  196  }
1c8fce27e275fd7 Zhang Rui      2010-07-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
