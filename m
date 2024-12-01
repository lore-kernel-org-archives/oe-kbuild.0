Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6994208A7
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733047370; cv=none; b=VfdzpcCPSQg4tzbMWMr36ThzBo8E57aqgPf/B3oQlRQ0tLWcK03+q3T/eUX4Qh+YdYUTMMBJh2l8Rc+EzWk5zS/3Hnb2AgU7JoH+KRqmWMXqAy6li3k3mngvKo2KgPfE6/XvpH/xl9tT0oZTfVYPf1wKtCwRI8fLmFGpMuZ12OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733047370; c=relaxed/simple;
	bh=ay6Ap7KOdX5Gigs5xXvdbw8Hfrs1uBzT1DRISosmBsA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jD/Ij7ULP2JH7jd1Y5LH5Z3B9w9MTMhGMIeiWbiTNtaGVWohKB+dRr6R2liBppkholahttyQM5kSH9gCqWGgu/UEZWtZkTssVxxdPxGg62Uyx2N8luaf+0uCuUoT5lV33pke3itM1hDKRyrGYIcrpirhH8WYAKBRBZSltLgBGKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FPIjF6Za; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FPIjF6Za"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733047368; x=1764583368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ay6Ap7KOdX5Gigs5xXvdbw8Hfrs1uBzT1DRISosmBsA=;
  b=FPIjF6ZaupOVw0124uav9YJwBvY5tovEJM8tVYDpztsKQ6Ya9xnGx5cG
   Ygmy6+wpHsfAvYxTfpAwE7cnRy4n3udzKJzaXmyY2a4lT6Lkg3C0aO2oB
   kp0fUoE9V2h+v/74VM0C8HYZhwXuWzSsSEU2wNSeANlxVYIXoE3Q45tKo
   Nfcf1PP410zTqMF1b5Ote2bSab1IIjTNAMd35YmCVVJz1nZMoxmDOPqgl
   SzqdwlMJquA8JXZpFov4v54T2jMDxkwNwtKtt/GIBYu+vFvWsiKQarkYC
   biMmeYZSltugX5ro9iblna1FFuBuJmwb7wWd5+3vizGMya1cj+LI5VtVi
   w==;
X-CSE-ConnectionGUID: Bat48ElZQGyZyZe6iuwdsA==
X-CSE-MsgGUID: E2WCPta4QwmFwemVYhpdEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36995664"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="36995664"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 02:02:46 -0800
X-CSE-ConnectionGUID: dWfKK0OzS7Cjjs2wqT/hyQ==
X-CSE-MsgGUID: d2sJPYzmQ+u75gpSnYdlYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92995584"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 01 Dec 2024 02:02:45 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHgma-0001S1-1G;
	Sun, 01 Dec 2024 10:02:32 +0000
Date: Sun, 1 Dec 2024 18:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/helpers.c:1260:33-38: ERROR: t is NULL but dereferenced.
Message-ID: <202412011718.lsm0y2Aw-lkp@intel.com>
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
TO: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: b00628b1c7d595ae5b544e059c27b1f5828314b4 bpf: Introduce bpf timers.
date:   3 years, 5 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 years, 5 months ago
config: x86_64-randconfig-102-20241120 (https://download.01.org/0day-ci/archive/20241201/202412011718.lsm0y2Aw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011718.lsm0y2Aw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/helpers.c:1260:33-38: ERROR: t is NULL but dereferenced.

vim +1260 kernel/bpf/helpers.c

b00628b1c7d595 Alexei Starovoitov 2021-07-14  1232  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1233  BPF_CALL_1(bpf_timer_cancel, struct bpf_timer_kern *, timer)
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1234  {
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1235  	struct bpf_hrtimer *t;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1236  	int ret = 0;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1237  
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1238  	if (in_nmi())
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1239  		return -EOPNOTSUPP;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1240  	__bpf_spin_lock_irqsave(&timer->lock);
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1241  	t = timer->timer;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1242  	if (!t) {
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1243  		ret = -EINVAL;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1244  		goto out;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1245  	}
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1246  	if (this_cpu_read(hrtimer_running) == t) {
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1247  		/* If bpf callback_fn is trying to bpf_timer_cancel()
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1248  		 * its own timer the hrtimer_cancel() will deadlock
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1249  		 * since it waits for callback_fn to finish
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1250  		 */
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1251  		ret = -EDEADLK;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1252  		goto out;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1253  	}
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1254  	drop_prog_refcnt(t);
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1255  out:
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1256  	__bpf_spin_unlock_irqrestore(&timer->lock);
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1257  	/* Cancel the timer and wait for associated callback to finish
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1258  	 * if it was running.
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1259  	 */
b00628b1c7d595 Alexei Starovoitov 2021-07-14 @1260  	ret = ret ?: hrtimer_cancel(&t->timer);
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1261  	return ret;
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1262  }
b00628b1c7d595 Alexei Starovoitov 2021-07-14  1263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
