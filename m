Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1660234BA47
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Oct 2025 06:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759385554; cv=none; b=muU8FlUAPP3U6g78HfNcfvJQlAdOKawRXVMkBSMDqj7/Kxg+sknrsLFjL5V7QXh7K8jAhP4hrmIAvwFNjR3gL9YvlWGm5fL5zuMRi0FTTT24SVDFh2A1Xkvd5ykoGyA3uRGmE6NQ5Z2nOXZfYSmJrE2YSkl9xc95e1i+ATzDgH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759385554; c=relaxed/simple;
	bh=1lBQ9umMYNnNBzSa6a5Lk1+0pqaAJeOcQ//pYJFpnC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JqOg0aKu4mfuZzI/YL6y1jWKvjITtwNfcn0Ys/X9mo0anRyIJYoZeq28obWifdFVOuFi20kfEB9FH5MLyNGGHSJA+FlRjWEDg6ZxecNCCXksd0YTviXvlGC1UWPyavSJcs4QfpeDBw4FjPPTSQDiijgrcM7hCixMyS64+6qtwms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CD7TfNth; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CD7TfNth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759385552; x=1790921552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lBQ9umMYNnNBzSa6a5Lk1+0pqaAJeOcQ//pYJFpnC0=;
  b=CD7TfNthkc96bHKkf9CO06o0mqNm0zrZ3l2TFWnuVsJ+nA7gnDUo9qKS
   ROTFUE+PKK/JYkH6S9hIhc/UhrSiV/HdMDUDt4snRKAxK34PH/IufvGWO
   Qlpqp6T3YzjGoKHPubZBEurqQ0oekiI8MKBEWU5Om9iOnB0GiKbSCi1gT
   TobknY20deYbZy8iQHFF/ncJ1WTU5qKLdU4+giNBDA/L4yVWTEOtPWz34
   j46EuVxAPwukr6ix3j2ZLTcFwG5u9CCUhY0p8Ge0bZI2dMN8g8cO9EGn5
   Z9kNhOKW6g5HgOKfi7PtxlCuw4/X14mOjDv387JPB2d+4B5V0c6mxBKpJ
   w==;
X-CSE-ConnectionGUID: jCmWClQ6TEWDUsYZwSAX3w==
X-CSE-MsgGUID: M+32j5MaTUCv2/sxbzERJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65519096"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="65519096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 23:12:32 -0700
X-CSE-ConnectionGUID: aEIbrVHGSkejZoyhcKjMOA==
X-CSE-MsgGUID: hh5JT2uvTguq/Dbfi1ScJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; 
   d="scan'208";a="178249588"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2025 23:12:30 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4CYG-0003b9-0B;
	Thu, 02 Oct 2025 06:12:28 +0000
Date: Thu, 2 Oct 2025 14:11:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
Message-ID: <202510021348.gM9ZUxT0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250929080456.26538-2-sv@linux.ibm.com>
References: <20250929080456.26538-2-sv@linux.ibm.com>
TO: Sathvika Vasireddy <sv@linux.ibm.com>

Hi Sathvika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes masahiroy-kbuild/for-next linus/master masahiroy-kbuild/fixes v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-powerpc-Enhance-objtool-to-fixup-alternate-feature-relative-addresses/20250929-161302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250929080456.26538-2-sv%40linux.ibm.com
patch subject: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup alternate feature relative addresses
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251002/202510021348.gM9ZUxT0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021348.gM9ZUxT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510021348.gM9ZUxT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: tools/objtool/objtool-in.o: in function `check':
>> tools/objtool/check.c:4710:(.text+0xeca9): undefined reference to `process_alt_data'
>> /usr/bin/ld: tools/objtool/check.c:4714:(.text+0xecb5): undefined reference to `process_fixup_entries'
>> /usr/bin/ld: tools/objtool/check.c:4718:(.text+0xecbe): undefined reference to `check_and_flatten_fixup_entries'
>> /usr/bin/ld: tools/objtool/check.c:4720:(.text+0xecc6): undefined reference to `process_exception_entries'
>> /usr/bin/ld: tools/objtool/check.c:4724:(.text+0xecd2): undefined reference to `process_bug_entries'
>> /usr/bin/ld: tools/objtool/check.c:4728:(.text+0xecde): undefined reference to `process_alt_relocations'
   collect2: error: ld returned 1 exit status
   make[4]: *** [Makefile:70: tools/objtool/objtool] Error 1
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1451: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +4710 tools/objtool/check.c

d93b5935fd4700 Josh Poimboeuf     2023-05-30  4682  
d44becb9decf44 Julien Thierry     2020-08-25  4683  int check(struct objtool_file *file)
dcc914f44f065e Josh Poimboeuf     2017-06-28  4684  {
c5995abe154767 Josh Poimboeuf     2025-03-24  4685  	int ret = 0, warnings = 0;
dcc914f44f065e Josh Poimboeuf     2017-06-28  4686  
baa41469a7b992 Josh Poimboeuf     2017-06-28  4687  	arch_initial_func_cfi_state(&initial_func_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4688  	init_cfi_state(&init_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4689  	init_cfi_state(&func_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4690  	set_func_state(&func_cfi);
1e4b619185e83e Josh Poimboeuf     2023-06-05  4691  	init_cfi_state(&force_undefined_cfi);
1e4b619185e83e Josh Poimboeuf     2023-06-05  4692  	force_undefined_cfi.force_undefined = true;
8b946cc38e063f Peter Zijlstra     2021-06-24  4693  
b745962cb97569 Josh Poimboeuf     2025-03-14  4694  	if (!cfi_hash_alloc(1UL << (file->elf->symbol_bits - 3))) {
b745962cb97569 Josh Poimboeuf     2025-03-14  4695  		ret = -1;
8b946cc38e063f Peter Zijlstra     2021-06-24  4696  		goto out;
b745962cb97569 Josh Poimboeuf     2025-03-14  4697  	}
8b946cc38e063f Peter Zijlstra     2021-06-24  4698  
8b946cc38e063f Peter Zijlstra     2021-06-24  4699  	cfi_hash_add(&init_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4700  	cfi_hash_add(&func_cfi);
baa41469a7b992 Josh Poimboeuf     2017-06-28  4701  
6545eb030e6f14 Julien Thierry     2020-08-25  4702  	ret = decode_sections(file);
c5995abe154767 Josh Poimboeuf     2025-03-24  4703  	if (ret)
dcc914f44f065e Josh Poimboeuf     2017-06-28  4704  		goto out;
8b946cc38e063f Peter Zijlstra     2021-06-24  4705  
1c34496e585688 Peter Zijlstra     2023-02-08  4706  	if (!nr_insns)
baa41469a7b992 Josh Poimboeuf     2017-06-28  4707  		goto out;
baa41469a7b992 Josh Poimboeuf     2017-06-28  4708  
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4709  	if (opts.ftr_fixup) {
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4710  		ret = process_alt_data(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4711  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4712  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4713  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4714  		ret = process_fixup_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4715  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4716  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4717  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4718  		check_and_flatten_fixup_entries();
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4719  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4720  		ret = process_exception_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4721  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4722  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4723  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4724  		ret = process_bug_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4725  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4726  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4727  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4728  		ret = process_alt_relocations(file);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
