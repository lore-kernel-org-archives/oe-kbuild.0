Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE115B111
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 12:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724070885; cv=none; b=VoPTT+MREarMKp/CRRp7Xm0L1S6rW6lC47ekD3J+irYD5EM7Zoi0gR6mW8Th/A//pXNtJVV/3lnyH2sUXsgj48aOAsogAsxHOO3Jd1If49MLt0ZjgZGi4Mbx//ayhBGvRNviknn1YuRmKMz+lsuP+CZKdTfBH9fXvxnI5CTtqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724070885; c=relaxed/simple;
	bh=H9huRXHQXZW2MiZy9vZ0MZi1qB+4CuaqyDLTnumiM/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVL7zfKN8b94sPeMnYPiHsd74MFMBPpSvwvyABlwJ/tuNfHgULQLJYtTDMSe90s0qehoT/NCeCDbCupXcMFM9YsG5xRPEqzEjrKQn96py/n5veaRE++KHiVkdYVSFXFyzf6kSTFAczh/admuPu9ropwa+3Lq5tZGulHf0VYt3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ALswM+uU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ALswM+uU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724070883; x=1755606883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H9huRXHQXZW2MiZy9vZ0MZi1qB+4CuaqyDLTnumiM/c=;
  b=ALswM+uUei6X4OgS+Xr1P0h09Yr15378GxiQNqNcjuFK2QBthKcUw7Yq
   UJVSEJG010pFnptPqfQMELyWPK5R0oh5SX5XEWJtIclhwk3aJWr1+0tPk
   jYcE2HBeN/3FAPNkjjsECjd7Uf1X0FVVAFJ18JRJb3TXEJ6i0LLK/bhzV
   RAM6NChcEQ29PQEw76fMxjbl/77+nKtiKliPhTETar1UBPw4DG9PlInHK
   /rovJnHWyyQ/TXF6ea3hBt8Tcaa1rSyg5hUc30CHDJv6PPRaKYSTGcEXp
   XWHHg2uobHbpGsVOqphqRsfF3lDz+9jlWWfdZw8sLqkAq2yHpZM3UA65C
   A==;
X-CSE-ConnectionGUID: HLKlqOKrQlKCuGzO13P0yw==
X-CSE-MsgGUID: P4DsVlmvTSa+7jnu48/lag==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22450374"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22450374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 05:34:43 -0700
X-CSE-ConnectionGUID: zj89w5JaR26xXOt7hct/fA==
X-CSE-MsgGUID: d/Um4RANTS69iNc9pkyGqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="65314242"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Aug 2024 05:34:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg1ap-0008ym-19;
	Mon, 19 Aug 2024 12:34:39 +0000
Date: Mon, 19 Aug 2024 20:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 7/7] x86/resctrl: Introduce interface to modify SDCIAE
 Capacity Bit Masks
Message-ID: <202408191942.1CXPbzt8-lkp@intel.com>
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
In-Reply-To: <e8dab641ea14bacbe3847fc1d3fde5be60c4095b.1723824984.git.babu.moger@amd.com>
References: <e8dab641ea14bacbe3847fc1d3fde5be60c4095b.1723824984.git.babu.moger@amd.com>
TO: Babu Moger <babu.moger@amd.com>
TO: corbet@lwn.net
TO: reinette.chatre@intel.com
TO: tglx@linutronix.de
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
TO: x86@kernel.org
CC: fenghua.yu@intel.com
CC: hpa@zytor.com
CC: paulmck@kernel.org
CC: thuth@redhat.com
CC: xiongwei.song@windriver.com
CC: ardb@kernel.org
CC: pawan.kumar.gupta@linux.intel.com
CC: daniel.sneddon@linux.intel.com
CC: sandipan.das@amd.com
CC: kai.huang@intel.com
CC: peterz@infradead.org
CC: kan.liang@linux.intel.com
CC: pbonzini@redhat.com
CC: xin3.li@intel.com
CC: babu.moger@amd.com
CC: ebiggers@google.com
CC: alexandre.chartre@oracle.com
CC: perry.yuan@amd.com
CC: tan.shaopeng@fujitsu.com
CC: james.morse@arm.com
CC: tony.luck@intel.com
CC: maciej.wieczor-retman@intel.com
CC: linux-doc@vger.kernel.org

Hi Babu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on linus/master v6.11-rc4 next-20240819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-cpufeatures-Add-support-for-L3-Smart-Data-Cache-Injection-Allocation-Enforcement/20240817-001948
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/e8dab641ea14bacbe3847fc1d3fde5be60c4095b.1723824984.git.babu.moger%40amd.com
patch subject: [PATCH 7/7] x86/resctrl: Introduce interface to modify SDCIAE Capacity Bit Masks
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r073-20240819 (https://download.01.org/0day-ci/archive/20240819/202408191942.1CXPbzt8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408191942.1CXPbzt8-lkp@intel.com/

smatch warnings:
arch/x86/kernel/cpu/resctrl/rdtgroup.c:2031 resctrl_sdciae_cbm_write() warn: variable dereferenced before check 'buf' (see line 2019)

vim +/buf +2031 arch/x86/kernel/cpu/resctrl/rdtgroup.c

1e87322a9e54f8 Babu Moger 2024-08-16  2008  
1e87322a9e54f8 Babu Moger 2024-08-16  2009  static ssize_t resctrl_sdciae_cbm_write(struct kernfs_open_file *of,
1e87322a9e54f8 Babu Moger 2024-08-16  2010  					char *buf, size_t nbytes, loff_t off)
1e87322a9e54f8 Babu Moger 2024-08-16  2011  {
1e87322a9e54f8 Babu Moger 2024-08-16  2012  	struct resctrl_schema *s = of->kn->parent->priv;
1e87322a9e54f8 Babu Moger 2024-08-16  2013  	struct rdt_resource *r = s->res;
1e87322a9e54f8 Babu Moger 2024-08-16  2014  	u32 sdciae_closid;
1e87322a9e54f8 Babu Moger 2024-08-16  2015  	char *resname;
1e87322a9e54f8 Babu Moger 2024-08-16  2016  	int ret = 0;
1e87322a9e54f8 Babu Moger 2024-08-16  2017  
1e87322a9e54f8 Babu Moger 2024-08-16  2018  	/* Valid input requires a trailing newline */
1e87322a9e54f8 Babu Moger 2024-08-16 @2019  	if (nbytes == 0 || buf[nbytes - 1] != '\n')
1e87322a9e54f8 Babu Moger 2024-08-16  2020  		return -EINVAL;
1e87322a9e54f8 Babu Moger 2024-08-16  2021  
1e87322a9e54f8 Babu Moger 2024-08-16  2022  	buf[nbytes - 1] = '\0';
1e87322a9e54f8 Babu Moger 2024-08-16  2023  
1e87322a9e54f8 Babu Moger 2024-08-16  2024  	cpus_read_lock();
1e87322a9e54f8 Babu Moger 2024-08-16  2025  	mutex_lock(&rdtgroup_mutex);
1e87322a9e54f8 Babu Moger 2024-08-16  2026  
1e87322a9e54f8 Babu Moger 2024-08-16  2027  	rdt_last_cmd_clear();
1e87322a9e54f8 Babu Moger 2024-08-16  2028  	rdt_staged_configs_clear();
1e87322a9e54f8 Babu Moger 2024-08-16  2029  
1e87322a9e54f8 Babu Moger 2024-08-16  2030  	resname = strim(strsep(&buf, ":"));
1e87322a9e54f8 Babu Moger 2024-08-16 @2031  	if (!buf) {
1e87322a9e54f8 Babu Moger 2024-08-16  2032  		rdt_last_cmd_puts("Missing ':'\n");
1e87322a9e54f8 Babu Moger 2024-08-16  2033  		ret = -EINVAL;
1e87322a9e54f8 Babu Moger 2024-08-16  2034  		goto out;
1e87322a9e54f8 Babu Moger 2024-08-16  2035  	}
1e87322a9e54f8 Babu Moger 2024-08-16  2036  
1e87322a9e54f8 Babu Moger 2024-08-16  2037  	if (strcmp(resname, "L3")) {
1e87322a9e54f8 Babu Moger 2024-08-16  2038  		rdt_last_cmd_printf("Unsupported resource name '%s'\n", resname);
1e87322a9e54f8 Babu Moger 2024-08-16  2039  		ret = -EINVAL;
1e87322a9e54f8 Babu Moger 2024-08-16  2040  		goto out;
1e87322a9e54f8 Babu Moger 2024-08-16  2041  	}
1e87322a9e54f8 Babu Moger 2024-08-16  2042  
1e87322a9e54f8 Babu Moger 2024-08-16  2043  	if (buf[0] == '\0') {
1e87322a9e54f8 Babu Moger 2024-08-16  2044  		rdt_last_cmd_printf("Missing '%s' value\n", resname);
1e87322a9e54f8 Babu Moger 2024-08-16  2045  		ret = -EINVAL;
1e87322a9e54f8 Babu Moger 2024-08-16  2046  		goto out;
1e87322a9e54f8 Babu Moger 2024-08-16  2047  	}
1e87322a9e54f8 Babu Moger 2024-08-16  2048  
1e87322a9e54f8 Babu Moger 2024-08-16  2049  	ret = resctrl_parse_line(buf, r, s);
1e87322a9e54f8 Babu Moger 2024-08-16  2050  	if (ret)
1e87322a9e54f8 Babu Moger 2024-08-16  2051  		goto out;
1e87322a9e54f8 Babu Moger 2024-08-16  2052  
1e87322a9e54f8 Babu Moger 2024-08-16  2053  	sdciae_closid = get_sdciae_closid(r);
1e87322a9e54f8 Babu Moger 2024-08-16  2054  	ret = resctrl_arch_update_domains(r, sdciae_closid);
1e87322a9e54f8 Babu Moger 2024-08-16  2055  
1e87322a9e54f8 Babu Moger 2024-08-16  2056  out:
1e87322a9e54f8 Babu Moger 2024-08-16  2057  	mutex_unlock(&rdtgroup_mutex);
1e87322a9e54f8 Babu Moger 2024-08-16  2058  	cpus_read_unlock();
1e87322a9e54f8 Babu Moger 2024-08-16  2059  
1e87322a9e54f8 Babu Moger 2024-08-16  2060  	return ret ?: nbytes;
1e87322a9e54f8 Babu Moger 2024-08-16  2061  }
1e87322a9e54f8 Babu Moger 2024-08-16  2062  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
