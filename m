Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C45AD51
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730022485; cv=none; b=b0BT8xtBI88GWtcp+RCE1luAtUV8cCWbDL/XHEG3MpaW4kobU/UjxGyfCoD5f3fO0AwtJCwkmM9fnYvaeHJch3936C+C7YuAGa0sWesPl07spuI07jNCfQb81ycF+If5ObxSq1ifm320OOSv/kRo37ei6W2N2jrSjVB6G5iYl5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730022485; c=relaxed/simple;
	bh=PCzTjmDVlEKF2gqz05SLvPuAeoUFFPClreLwTM3Wcvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nAkm1yZs3T8tSJF6v4Sl0QpSU7XTDNCQUXwFxEePxKi/ndBWvj0nceIJZHcXikRXC6biB+QQmL/LOVuswZltnSyAqABWmbOKcEZP5/aHrvT3eh7sf3zgwVmOYbCg+4xs3BJLLsPRQkpqXG2Ky7JArPDn2t0UXSr374QVkVBy7e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evTW+6i/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evTW+6i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730022484; x=1761558484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCzTjmDVlEKF2gqz05SLvPuAeoUFFPClreLwTM3Wcvk=;
  b=evTW+6i/XK2xfSC8mq14ZQOQt7rv17s50rPTcYsQ/rp84nu3Sr/AFH/2
   XUtspreJJnIekzS3RKWN7yIrKgW8GRxIRd8bd3cnpx0/LLTZJPDG3HDP1
   ZbruLs66137a/O7jn1yebZsjR+49j/5/hJ1/Vrjh5VvvFnR/RTiehhXV/
   V/14LBKWAHfX6iUOH9iCkfiRuG+WDFc//+ifugot0tybZqUlP+fQ4T/HO
   6zG90mJWdI0qk8Ws7SNLNPxlCYsX/SWX0oyCYGVvzd3QOL6KvXy0WAKoe
   zl3fH8lezHeaYDmk9bL2FzrECrTVUs7tDIqMtO5+R6JXd7QXwLZrKBv5N
   A==;
X-CSE-ConnectionGUID: VkLIuFSvSJ+P+GB3moK5xw==
X-CSE-MsgGUID: caGy1FYURXanpuf1pUEMSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="29753455"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="29753455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 02:48:03 -0700
X-CSE-ConnectionGUID: EMVIK1qrRlGk04WAlu/41A==
X-CSE-MsgGUID: G6jBYxxiTlK2Ni+nVXZ7mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81789425"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Oct 2024 02:48:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4zsN-000abS-0z;
	Sun, 27 Oct 2024 09:47:59 +0000
Date: Sun, 27 Oct 2024 17:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/stackleak.c:42:5-10: opportunity for
 str_enabled_disabled(state)
Message-ID: <202410271701.pKbaXmhq-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   850925a8133c73c4a2453c360b2c3beb3bab67c9
commit: 1e860048c53ee77ee9870dcce94847a28544b753 gcc-plugins: simplify GCC plugin-dev capability test
date:   3 years, 11 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 3 years, 11 months ago
config: i386-randconfig-051-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271701.pKbaXmhq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410271701.pKbaXmhq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/stackleak.c:42:5-10: opportunity for str_enabled_disabled(state)

vim +42 kernel/stackleak.c

964c9dff009189 Alexander Popov 2018-08-17  21  
964c9dff009189 Alexander Popov 2018-08-17  22  int stack_erasing_sysctl(struct ctl_table *table, int write,
4773ef33fc6e59 Tobias Klauser  2020-09-18  23  			void *buffer, size_t *lenp, loff_t *ppos)
964c9dff009189 Alexander Popov 2018-08-17  24  {
964c9dff009189 Alexander Popov 2018-08-17  25  	int ret = 0;
964c9dff009189 Alexander Popov 2018-08-17  26  	int state = !static_branch_unlikely(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  27  	int prev_state = state;
964c9dff009189 Alexander Popov 2018-08-17  28  
964c9dff009189 Alexander Popov 2018-08-17  29  	table->data = &state;
964c9dff009189 Alexander Popov 2018-08-17  30  	table->maxlen = sizeof(int);
964c9dff009189 Alexander Popov 2018-08-17  31  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
964c9dff009189 Alexander Popov 2018-08-17  32  	state = !!state;
964c9dff009189 Alexander Popov 2018-08-17  33  	if (ret || !write || state == prev_state)
964c9dff009189 Alexander Popov 2018-08-17  34  		return ret;
964c9dff009189 Alexander Popov 2018-08-17  35  
964c9dff009189 Alexander Popov 2018-08-17  36  	if (state)
964c9dff009189 Alexander Popov 2018-08-17  37  		static_branch_disable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  38  	else
964c9dff009189 Alexander Popov 2018-08-17  39  		static_branch_enable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  40  
964c9dff009189 Alexander Popov 2018-08-17  41  	pr_warn("stackleak: kernel stack erasing is %s\n",
964c9dff009189 Alexander Popov 2018-08-17 @42  					state ? "enabled" : "disabled");
964c9dff009189 Alexander Popov 2018-08-17  43  	return ret;
964c9dff009189 Alexander Popov 2018-08-17  44  }
964c9dff009189 Alexander Popov 2018-08-17  45  

:::::: The code at line 42 was first introduced by commit
:::::: 964c9dff0091893a9a74a88edf984c6da0b779f7 stackleak: Allow runtime disabling of kernel stack erasing

:::::: TO: Alexander Popov <alex.popov@linux.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
