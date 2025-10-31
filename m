Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB2C2BEC23
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 04:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761884839; cv=none; b=DCvqrNKchWKZfRs+LR2juuQ8z7OlYl9wkfOsL/D4wGMLKtH9Hcd8yjERJueT8Wdz1px2yKS0Ta+4fTmxpVvmtcQwkMEoraRaBF4RAiJ5S9z9bynl+oG0gF/VJQy+9JFiuoi//nByTTij5s7fyBv+GP6SEzD97kUEq/KD9h6MM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761884839; c=relaxed/simple;
	bh=fKLBe71e0WbtDwf53LQJpB1Qwg5kKzF721BEsCvvPRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIAye4AeHYanCfA+5vvlWvtT1L7ljIEK27jDdz+NFFl27jTDRyM1nT2RlykRmULOFYDxiOuksKc8FSu9wTIkfEfKk91mTmxP2xfFqDRF/4RSbDqX5LhwMqvfljJTrtah1ZrbN10O7T16eRnqoa/2BFD0hUYkviXlchAQd956PWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5QG1OmI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5QG1OmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761884838; x=1793420838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKLBe71e0WbtDwf53LQJpB1Qwg5kKzF721BEsCvvPRo=;
  b=a5QG1OmIkNhk0xoOXP2SuzSBm46YvjZCBgjbXOzQ4t+7RXioKR0KAySB
   xR6B7doxr+BD8hsaN1IPf1l7lTjnswKl0h2A4cyupSTXs/tBJKDLNSrqe
   uqb5g0OMtxBLke0KoIcNRziuSjaSf8seQL2LHxdawGdMhiOGZd1Vjq8PE
   tqNrxQDkksE/nl0O8kctOF6E6+8L7XxAcEpOlmTT5LfMZsjYBsaM0GlGn
   iaMZOpuaass0mWt/CCxXUgpIAcR1bkcX9D0GEAzRW3kUGmpAPIl6+mx09
   D443xxgTTZYhcRO6a95PM19qeQV5RVKkUl7diIGovpumA7NBiS4f9QczT
   A==;
X-CSE-ConnectionGUID: ssFnpRUGTVicAem3kK2yHw==
X-CSE-MsgGUID: yW++W+BrQdysJ1AjVPeLfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74331982"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="74331982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 21:27:17 -0700
X-CSE-ConnectionGUID: T3m6AyroRlaJeisFoaCm8w==
X-CSE-MsgGUID: GtHTG3vZRy6DRvanPgIWag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; 
   d="scan'208";a="190484656"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 30 Oct 2025 21:27:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEgjJ-000Mm0-1F;
	Fri, 31 Oct 2025 04:27:13 +0000
Date: Fri, 31 Oct 2025 12:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-github:namespace-6.19 11/73] kernel/nsproxy.c:264:9:
 sparse: sparse: no generic selection for 'struct user_namespace *const
 [noderef] __rcu user_ns'
Message-ID: <202510311217.y0s2k1xg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: kernel/nsproxy.c:264:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git namespace-6.19
head:   232affb34bfb5be4df33a3e7bc92154e38f74535
commit: 397428f4243614b4e5825bb7ca3dcb3a3c6c25d8 [11/73] ns: add active reference count
:::::: branch date: 6 hours ago
:::::: commit date: 16 hours ago
config: nios2-randconfig-r113-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311217.y0s2k1xg-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510311217.y0s2k1xg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510311217.y0s2k1xg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/nsproxy.c:264:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c:269:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
>> kernel/nsproxy.c:264:9: sparse: sparse: dereference of noderef expression
   kernel/nsproxy.c:269:9: sparse: sparse: dereference of noderef expression

vim +264 kernel/nsproxy.c

397428f4243614 Christian Brauner 2025-10-29  261  
397428f4243614 Christian Brauner 2025-10-29  262  void get_cred_namespaces(struct task_struct *tsk)
397428f4243614 Christian Brauner 2025-10-29  263  {
397428f4243614 Christian Brauner 2025-10-29 @264  	ns_ref_active_get(tsk->real_cred->user_ns);
397428f4243614 Christian Brauner 2025-10-29  265  }
397428f4243614 Christian Brauner 2025-10-29  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
