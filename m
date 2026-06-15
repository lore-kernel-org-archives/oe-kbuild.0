Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA582A1BF
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Jun 2026 01:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781485444; cv=none; b=RoLHsCnENTjqg977eyoMUPkT72nObhEFwBD2Rq62M4t1nf6w9y5YGQW05WC8AX/7d2WtAZ+adr9aK0WV81CkVK8RRwe6ByTgaHBCu58FWHKOj4UzDS6GbZRg0ZSA4d5gi9P75eJoEvq5whFno6cxEuQ5IT0vMguJ7ap8o6HW5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781485444; c=relaxed/simple;
	bh=o7CTXfWUdUjhyD7xYlEr8jMVUdZSSllbiGDursoe+PE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q8DC6QymhNw1Y0pY3Yn2plKNsO8ikmoSSJaatpRwIAd6dN5QVPpj+BzKHSBCgpQdzDEQCCelQZzGqPLO5PrGgaus5vgcF+CgiGmCUVMxX1Riw65UeGOPnx4AqnPknwNU0zkA4dLpqR70aFDO2L4WHQy87EqDnX21kf5E4BFcEhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4fwNPXk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4fwNPXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781485443; x=1813021443;
  h=date:from:to:cc:subject:message-id;
  bh=o7CTXfWUdUjhyD7xYlEr8jMVUdZSSllbiGDursoe+PE=;
  b=j4fwNPXky6hvx7UXwIetxPdBQdjzBST953ZDlsVDfy9O9/e8Z5a4cZo0
   KB3jDEUyh93xcTDvArAyH6LQm5L5o7ks7Ov9S9M3m+4BBJaVIbHhJa2mz
   AqwMJvUodLSyWZ2bk66Dz8UJrSuxETu5Q+KCAL4Ci4xwHANQA5PnKgmNy
   xB2Hw9NsbTtq3Qj0hbTmiYXMNErVCAqicog6fpeIqZj6ewAqTtuRYFFFy
   2Sy9qfWZbI3tCEcpHGvUSDUVumxHoDQsfXEIpnGrofFXeqmDbXaN/zwvT
   6zF7TYv9jppJ8gHkIc4x07m7GeQyD3YeuFWLGRBahVc/QziKzAvOxbhDN
   w==;
X-CSE-ConnectionGUID: 9qpSbwTuSnS+z5zRJZLDlQ==
X-CSE-MsgGUID: /hxLA0ThQdqVbH/OTE3lZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="107652427"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="107652427"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 18:04:02 -0700
X-CSE-ConnectionGUID: KETJS04FRxuYchhFi8z7nA==
X-CSE-MsgGUID: pnaUCpwITxmVAeWeKEk6qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="251604016"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2026 18:04:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYvk6-00000000RLi-2QcH;
	Mon, 15 Jun 2026 01:03:58 +0000
Date: Mon, 15 Jun 2026 09:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jj-apparmor:apparmor-next 16/32]
 security/apparmor/mount.c:734 aa_pivotroot() warn: passing zero to 'PTR_ERR'
Message-ID: <202606150836.fltLXObQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: John Johansen <john.johansen@canonical.com>
CC: Georgia Garcia <georgia.garcia@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   d0691bd5dcaec2350039ecb04fa70faa91ac142d
commit: ed7cc1c6f240a0c2838c0617afb2b0466edd236f [16/32] apparmor: change fn_label_build() call to not return NULL
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: m68k-randconfig-r072-20260615 (https://download.01.org/0day-ci/archive/20260615/202606150836.fltLXObQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606150836.fltLXObQ-lkp@intel.com/

New smatch warnings:
security/apparmor/mount.c:734 aa_pivotroot() warn: passing zero to 'PTR_ERR'
security/apparmor/domain.c:902 handle_onexec() warn: passing zero to 'PTR_ERR'
security/apparmor/domain.c:978 apparmor_bprm_creds_for_exec() warn: passing zero to 'PTR_ERR'
security/apparmor/domain.c:1229 change_hat() warn: passing zero to 'PTR_ERR'
security/apparmor/domain.c:1561 aa_change_profile() warn: passing zero to 'PTR_ERR'

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'
security/apparmor/domain.c:787 profile_transition() warn: passing zero to 'ERR_PTR'
security/apparmor/domain.c:920 handle_onexec() warn: passing zero to 'ERR_PTR'

vim +/PTR_ERR +734 security/apparmor/mount.c

2ea3ffb7782a84 John Johansen             2017-07-18  715  
90c436a64a6e20 John Johansen             2022-09-19  716  int aa_pivotroot(const struct cred *subj_cred, struct aa_label *label,
90c436a64a6e20 John Johansen             2022-09-19  717  		 const struct path *old_path,
2ea3ffb7782a84 John Johansen             2017-07-18  718  		 const struct path *new_path)
2ea3ffb7782a84 John Johansen             2017-07-18  719  {
2ea3ffb7782a84 John Johansen             2017-07-18  720  	struct aa_profile *profile;
2ea3ffb7782a84 John Johansen             2017-07-18  721  	struct aa_label *target = NULL;
2ea3ffb7782a84 John Johansen             2017-07-18  722  	char *old_buffer = NULL, *new_buffer = NULL, *info = NULL;
2ea3ffb7782a84 John Johansen             2017-07-18  723  	int error;
2ea3ffb7782a84 John Johansen             2017-07-18  724  
2ea3ffb7782a84 John Johansen             2017-07-18  725  	AA_BUG(!label);
2ea3ffb7782a84 John Johansen             2017-07-18  726  	AA_BUG(!old_path);
2ea3ffb7782a84 John Johansen             2017-07-18  727  	AA_BUG(!new_path);
2ea3ffb7782a84 John Johansen             2017-07-18  728  
341c1fda5e1715 John Johansen             2019-09-14  729  	old_buffer = aa_get_buffer(false);
341c1fda5e1715 John Johansen             2019-09-14  730  	new_buffer = aa_get_buffer(false);
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  731  	error = -ENOMEM;
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  732  	if (!old_buffer || !new_buffer)
df323337e507a0 Sebastian Andrzej Siewior 2019-05-03  733  		goto out;
8ac2ca328ec935 Sebastian Andrzej Siewior 2019-04-05 @734  	target = fn_label_build(label, profile, GFP_KERNEL,

:::::: The code at line 734 was first introduced by commit
:::::: 8ac2ca328ec9356f56d0dad3aa350d9600db951a apparmor: Switch to GFP_KERNEL where possible

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: John Johansen <john.johansen@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
