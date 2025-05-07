Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C91FDA8E
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596997; cv=none; b=cUE/UMcjgNQ/30UNSlULp6XA8roNocggwJJQy3bUBl0ujqKoEE4V9bPqShKLS81SIRNGFJwrFawGNjYng+DNV/3ncAGcQSuubvLRX4iLvb+h1At2p0p/HP9/lvG4Ja7uujs2FAOzK9IGChfjVYpO6nsWpry1KOqjMyyeXLK9oqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596997; c=relaxed/simple;
	bh=NHYnicfdBO7EFR9YF0nJjcZob0ghdljxyAlN1Fq+prY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcU7W164rpXUNIjrPYPVjamqiu+tXmXOg/jKKPxxtofIkbEWzrsgk8604zpvbgXhhbRs7OVby/SBBeLoPVrzUETBCj8BJVK4JquhSenIngcFI0u/JASyHsDiAuicFLmUFJkcxEhsaj19k4kxx9NgfI9w7ngg4oJ6NvjzZgB/jUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmWA2il9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmWA2il9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596994; x=1778132994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHYnicfdBO7EFR9YF0nJjcZob0ghdljxyAlN1Fq+prY=;
  b=gmWA2il9AoK1M1/qaEoOq/BA/+wZH/HlWOzqmBDuOjnvTbIRVj1X/ChP
   xdT5Rj+QwJnPTr3CBKHjeTrK0Bm/WWe8XKRhh/zt31ozkRAfy9aHOD1Sq
   Yj4D7r1n5ZznCcyoOxhan0aEhIK/aCw7fCf2GaAstQVDeKKaQGsdU1SJI
   unEEIdYWrSP6j5f8RV/d1ysqHFBGH2EtsICjgvcpP7v9aHTn8bysPS7ub
   5w4+IXR4hlnXRWxHNoDV/BO26077N50A25iiuitIN6C8aU1SJS7H43KYf
   jYHg3lyF8J98U1iMEFhtbf80Akfymdn/5gcqCkpNoeK/D3RVZt70iFNXh
   g==;
X-CSE-ConnectionGUID: V/xlFP/4SOibJulgpA+Emw==
X-CSE-MsgGUID: OuEr+RFtSemTmsTJdLAzaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120523"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: t1tB0s1XR/aab70Cq8TFgA==
X-CSE-MsgGUID: gh2v5xbzRcWu9YziPGAbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580429"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077W-1z;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
Message-ID: <202505071345.YXfXRmjW-lkp@intel.com>
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
In-Reply-To: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>
References: <963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger@amd.com>
TO: Babu Moger <babu.moger@amd.com>
TO: tony.luck@intel.com
TO: reinette.chatre@intel.com
TO: tglx@linutronix.de
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
CC: babu.moger@amd.com
CC: corbet@lwn.net
CC: x86@kernel.org
CC: hpa@zytor.com
CC: akpm@linux-foundation.org
CC: paulmck@kernel.org
CC: rostedt@goodmis.org
CC: thuth@redhat.com
CC: ardb@kernel.org
CC: gregkh@linuxfoundation.org
CC: thomas.lendacky@amd.com
CC: mario.limonciello@amd.com
CC: perry.yuan@amd.com
CC: seanjc@google.com
CC: kai.huang@intel.com
CC: xiaoyao.li@intel.com
CC: kan.liang@linux.intel.com
CC: riel@surriel.com
CC: xin3.li@intel.com
CC: xin@zytor.com
CC: sohil.mehta@intel.com
CC: ak@linux.intel.com
CC: ebiggers@google.com
CC: andrew.cooper3@citrix.com

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc5 next-20250506]
[cannot apply to tip/x86/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20250422-064804
base:   linus/master
patch link:    https://lore.kernel.org/r/963710cb374d55856053989e4edc61d7fd033662.1745275431.git.babu.moger%40amd.com
patch subject: [PATCH v4 5/8] x86/resctrl: Add user interface to enable/disable io_alloc feature
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-051-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071345.YXfXRmjW-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505071345.YXfXRmjW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:2007:5-20: WARNING: Unsigned expression compared with zero: io_alloc_closid < 0

vim +2007 arch/x86/kernel/cpu/resctrl/rdtgroup.c

aa84e389d98f323 Babu Moger 2025-04-21  1980  
aa84e389d98f323 Babu Moger 2025-04-21  1981  static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
aa84e389d98f323 Babu Moger 2025-04-21  1982  				      size_t nbytes, loff_t off)
aa84e389d98f323 Babu Moger 2025-04-21  1983  {
aa84e389d98f323 Babu Moger 2025-04-21  1984  	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
aa84e389d98f323 Babu Moger 2025-04-21  1985  	struct rdt_resource *r = s->res;
aa84e389d98f323 Babu Moger 2025-04-21  1986  	char const *grp_name;
aa84e389d98f323 Babu Moger 2025-04-21  1987  	u32 io_alloc_closid;
aa84e389d98f323 Babu Moger 2025-04-21  1988  	bool enable;
aa84e389d98f323 Babu Moger 2025-04-21  1989  	int ret;
aa84e389d98f323 Babu Moger 2025-04-21  1990  
aa84e389d98f323 Babu Moger 2025-04-21  1991  	ret = kstrtobool(buf, &enable);
aa84e389d98f323 Babu Moger 2025-04-21  1992  	if (ret)
aa84e389d98f323 Babu Moger 2025-04-21  1993  		return ret;
aa84e389d98f323 Babu Moger 2025-04-21  1994  
aa84e389d98f323 Babu Moger 2025-04-21  1995  	cpus_read_lock();
aa84e389d98f323 Babu Moger 2025-04-21  1996  	mutex_lock(&rdtgroup_mutex);
aa84e389d98f323 Babu Moger 2025-04-21  1997  
aa84e389d98f323 Babu Moger 2025-04-21  1998  	rdt_last_cmd_clear();
aa84e389d98f323 Babu Moger 2025-04-21  1999  
aa84e389d98f323 Babu Moger 2025-04-21  2000  	if (!r->cache.io_alloc_capable || s->conf_type == CDP_DATA) {
aa84e389d98f323 Babu Moger 2025-04-21  2001  		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
aa84e389d98f323 Babu Moger 2025-04-21  2002  		ret = -ENODEV;
aa84e389d98f323 Babu Moger 2025-04-21  2003  		goto out_io_alloc;
aa84e389d98f323 Babu Moger 2025-04-21  2004  	}
aa84e389d98f323 Babu Moger 2025-04-21  2005  
aa84e389d98f323 Babu Moger 2025-04-21  2006  	io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
aa84e389d98f323 Babu Moger 2025-04-21 @2007  	if (io_alloc_closid < 0) {
aa84e389d98f323 Babu Moger 2025-04-21  2008  		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
aa84e389d98f323 Babu Moger 2025-04-21  2009  		ret = -EINVAL;
aa84e389d98f323 Babu Moger 2025-04-21  2010  		goto out_io_alloc;
aa84e389d98f323 Babu Moger 2025-04-21  2011  	}
aa84e389d98f323 Babu Moger 2025-04-21  2012  
aa84e389d98f323 Babu Moger 2025-04-21  2013  	if (resctrl_arch_get_io_alloc_enabled(r) != enable) {
aa84e389d98f323 Babu Moger 2025-04-21  2014  		if (enable) {
aa84e389d98f323 Babu Moger 2025-04-21  2015  			ret = resctrl_io_alloc_closid_alloc(io_alloc_closid);
aa84e389d98f323 Babu Moger 2025-04-21  2016  			if (ret < 0) {
aa84e389d98f323 Babu Moger 2025-04-21  2017  				grp_name = rdtgroup_name_by_closid(io_alloc_closid);
aa84e389d98f323 Babu Moger 2025-04-21  2018  				rdt_last_cmd_printf("CLOSID for io_alloc is used by %s group\n",
aa84e389d98f323 Babu Moger 2025-04-21  2019  						    grp_name ? grp_name : "another");
aa84e389d98f323 Babu Moger 2025-04-21  2020  				ret = -EINVAL;
aa84e389d98f323 Babu Moger 2025-04-21  2021  				goto out_io_alloc;
aa84e389d98f323 Babu Moger 2025-04-21  2022  			}
aa84e389d98f323 Babu Moger 2025-04-21  2023  
aa84e389d98f323 Babu Moger 2025-04-21  2024  			ret = resctrl_io_alloc_init_cat(r, s, io_alloc_closid);
aa84e389d98f323 Babu Moger 2025-04-21  2025  			if (ret) {
aa84e389d98f323 Babu Moger 2025-04-21  2026  				rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
aa84e389d98f323 Babu Moger 2025-04-21  2027  				resctrl_io_alloc_closid_free(io_alloc_closid);
aa84e389d98f323 Babu Moger 2025-04-21  2028  				goto out_io_alloc;
aa84e389d98f323 Babu Moger 2025-04-21  2029  			}
aa84e389d98f323 Babu Moger 2025-04-21  2030  
aa84e389d98f323 Babu Moger 2025-04-21  2031  		} else {
aa84e389d98f323 Babu Moger 2025-04-21  2032  			resctrl_io_alloc_closid_free(io_alloc_closid);
aa84e389d98f323 Babu Moger 2025-04-21  2033  		}
aa84e389d98f323 Babu Moger 2025-04-21  2034  
aa84e389d98f323 Babu Moger 2025-04-21  2035  		ret = resctrl_arch_io_alloc_enable(r, enable);
aa84e389d98f323 Babu Moger 2025-04-21  2036  	}
aa84e389d98f323 Babu Moger 2025-04-21  2037  
aa84e389d98f323 Babu Moger 2025-04-21  2038  out_io_alloc:
aa84e389d98f323 Babu Moger 2025-04-21  2039  	mutex_unlock(&rdtgroup_mutex);
aa84e389d98f323 Babu Moger 2025-04-21  2040  	cpus_read_unlock();
aa84e389d98f323 Babu Moger 2025-04-21  2041  
aa84e389d98f323 Babu Moger 2025-04-21  2042  	return ret ?: nbytes;
aa84e389d98f323 Babu Moger 2025-04-21  2043  }
aa84e389d98f323 Babu Moger 2025-04-21  2044  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
