Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062CA15CD7E
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 04:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033557; cv=none; b=OBO/Im/TI9QmPXXn1Zf79iDiSVNdHXK3lM9TBiRcrHI9iF5U/XjX6W+fZb8kXGuMZijuYDiRnP/GLxDiI2t1PDaW+CPYeNsAb04noizRmO5kzBOsafJZ1RwzAmveZzgfycNSU+C6rD12IQVMEfmvC9ejhiXlAHmj4u3+6DFc4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033557; c=relaxed/simple;
	bh=vidD1E7BAFuA4dDLiBR02RUWory0qxRdSM35e/ojWsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SwseHrswLOjmNf/zRKS+hvV2dZpYwQGebsAMNAVUXRkgBK23mw9K6HFklwlWmytLqSAqrD9AlelEFVgLqDbeeh/y/NbhGeKkpbGoBZ7nUkeYXXDE+4Sq/UPBSuGtRsfNl5AZj97r9NgQKzTL3LLA9Z+Gtk4aZZ8nAS79uF3ejFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUvtc4C2; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUvtc4C2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766033556; x=1797569556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vidD1E7BAFuA4dDLiBR02RUWory0qxRdSM35e/ojWsE=;
  b=EUvtc4C2Q9osHvCMBwC1t6giM6Xdym5ikzDxeOa1lDr5rwx7+a/2Tr4L
   vuFR5bmmZ+xg90nssen2g5v96mhtT6AAhsGjIP6L/3QAx5Rzux1sJU7Rc
   EwNq4juGEKonBwp7L+joMoNvq/usadStKjTyxKaUC2zbDGymqXKahqcOy
   2njUB8bSbD/+ZyQXtPZLprIF98UH3zxmH4toj76M0tGoPIYuiOfPhNOtB
   T6pFIVrGjv0gs7WpE2DgRl7E9TN8r68hihVfe5S/u6YjAx6cap7UWYH+7
   66k6tyRHHSdANxkGfH1Pi2zQ4/8PY2VjkDweGRrfJIIukphizIGskoGbh
   w==;
X-CSE-ConnectionGUID: VhsFNAVCScyJkqsrAK8dTQ==
X-CSE-MsgGUID: 4a8K+RYuRTaXiP9LN4Kkgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67872893"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67872893"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:52:36 -0800
X-CSE-ConnectionGUID: lhCDWhZtSl2ab45mOz1Nqg==
X-CSE-MsgGUID: gzfRGyoTQiycvTvPFYGQkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198496015"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Dec 2025 20:52:35 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW608-000000001b2-2crG;
	Thu, 18 Dec 2025 04:52:32 +0000
Date: Thu, 18 Dec 2025 12:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/nsproxy.c:264:9: sparse: sparse: no generic selection for
 'struct user_namespace *const [noderef] __rcu user_ns'
Message-ID: <202512181213.Erg74gkr-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 3a18f809184bc5a1cfad7cde5b8b026e2ff61587 ns: add active reference count
date:   6 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 weeks ago
config: i386-randconfig-062-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181213.Erg74gkr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181213.Erg74gkr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512181213.Erg74gkr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/nsproxy.c:264:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c:269:9: sparse: sparse: no generic selection for 'struct user_namespace *const [noderef] __rcu user_ns'
   kernel/nsproxy.c:264:9: sparse: sparse: dereference of noderef expression
   kernel/nsproxy.c:269:9: sparse: sparse: dereference of noderef expression

vim +264 kernel/nsproxy.c

3a18f809184bc5 Christian Brauner 2025-10-29  261  
3a18f809184bc5 Christian Brauner 2025-10-29  262  void get_cred_namespaces(struct task_struct *tsk)
3a18f809184bc5 Christian Brauner 2025-10-29  263  {
3a18f809184bc5 Christian Brauner 2025-10-29 @264  	ns_ref_active_get(tsk->real_cred->user_ns);
3a18f809184bc5 Christian Brauner 2025-10-29  265  }
3a18f809184bc5 Christian Brauner 2025-10-29  266  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
