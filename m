Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D95155C87
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192714; cv=none; b=bkdy7Ei080xuVX5e5QuD7D05nF/RUII3pqJjWGCo2ybhbRYVQF5FLYYHTSmgiCT1pHOzwrSs7warofMB4+EOvwrOOYU0G9h6D/1dNliOoPbAs5/xRwwD6QSZ/lR87If+w/d0lu4hF9zyDYolTBKAlHpF27fEp0JhbZWUJhBFr9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192714; c=relaxed/simple;
	bh=ixgJrGa7TVl5saeSm0rhuWUVDS7nDnsBgW4VLS/S6BI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K23S3ZldZXuYwVAokeiNm4DJqKSXE8mdE7W254Tso1HkfizcPoL9eeLN2D/leEdtx6ufdnCPovKCrzOK06F7rTOsxNLKECQu/njhW0c9BsMBuufbXTII7nApeQs3rCVvt4ta0sL9rJZOfVq8rvqP1n06WR4ANBKQzcBemkMTWfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5BJMcCA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5BJMcCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774192713; x=1805728713;
  h=date:from:to:cc:subject:message-id;
  bh=ixgJrGa7TVl5saeSm0rhuWUVDS7nDnsBgW4VLS/S6BI=;
  b=n5BJMcCA3En3w1t9nSOcjxOUCMXpH4e9ENlPqOzKtPuMlW+nZ6l1sGLC
   Zn92cFBoxiw5evrsEuNikN1A1jAe/CpgtKJ2DdIBAAShc2RTHbrB4JBkE
   VIJ9oSkUNpgZUB77p7yLuNID7VZ7I4SIGUJahoykKxirpLyh5NZMvkOZy
   8De++nwdnXjL0OzZyGXv1KGfU7Xr4hzlw2UT61t1HgfwwJ6VwTN09U83A
   9w6aMSz1SYWxnEjVturmXMTG5tnuQsN6ZPzq0v9l/3NsYbwPBvAiqKJeN
   YMuUTkDev/YkiIhLjsdxYx6pCwKqKXuBdbE3C4ABPf0wcB2jqhqpBquIZ
   g==;
X-CSE-ConnectionGUID: 69L6JgN4T4OznCjcEmVPNw==
X-CSE-MsgGUID: MZPr8FpgTDauCiSHFSytsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85837134"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="85837134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 08:18:32 -0700
X-CSE-ConnectionGUID: FKswNkTLRKmliBF8owUfAw==
X-CSE-MsgGUID: clzXHlI4TRKTHtNHuW/lLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="224004009"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2026 08:18:31 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4KZQ-000000002Hh-1NLe;
	Sun, 22 Mar 2026 15:18:28 +0000
Date: Sun, 22 Mar 2026 23:17:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ast-bpf:stacklive 12/29] kernel/bpf/liveness.c:1991
 print_subprog_arg_access() warn: variable dereferenced before check
 'info->at_in' (see line 1953)
Message-ID: <202603222317.iHk1aquO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git stacklive
head:   bbe7785d7fc2e977a12e62212e014ed6ff8f05f2
commit: 732f9788ec36481a13570fef2056408590d06413 [12/29] bpf: Add per-subprog arg tracking analysis
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: microblaze-randconfig-r072-20260322 (https://download.01.org/0day-ci/archive/20260322/202603222317.iHk1aquO-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603222317.iHk1aquO-lkp@intel.com/

smatch warnings:
kernel/bpf/liveness.c:1991 print_subprog_arg_access() warn: variable dereferenced before check 'info->at_in' (see line 1953)

vim +1991 kernel/bpf/liveness.c

732f9788ec3648 Alexei Starovoitov 2026-03-08  1911  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1912  static void print_subprog_arg_access(struct bpf_verifier_env *env,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1913  				     int subprog,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1914  				     struct subprog_at_info *info,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1915  				     struct arg_track (*at_stack_in)[MAX_ARG_SPILL_SLOTS],
732f9788ec3648 Alexei Starovoitov 2026-03-08  1916  				     struct insn_live_regs *state,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1917  				     u64 (*nonlocal_use)[MAX_CALL_FRAMES][2],
732f9788ec3648 Alexei Starovoitov 2026-03-08  1918  				     u64 (*nonlocal_def)[MAX_CALL_FRAMES][2])
732f9788ec3648 Alexei Starovoitov 2026-03-08  1919  {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1920  	struct bpf_insn *insns = env->prog->insnsi;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1921  	int start = env->subprog_info[subprog].start;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1922  	int len = info->len;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1923  	int i, r, f;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1924  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1925  	if (!(env->log.level & BPF_LOG_LEVEL2))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1926  		return;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1927  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1928  	verbose(env, "subprog#%d %s:\n", subprog,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1929  		env->prog->aux->func_info
732f9788ec3648 Alexei Starovoitov 2026-03-08  1930  		? btf_name_by_offset(env->prog->aux->btf,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1931  				     btf_type_by_id(env->prog->aux->btf,
732f9788ec3648 Alexei Starovoitov 2026-03-08  1932  						    env->prog->aux->func_info[subprog].type_id)->name_off)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1933  		: "");
732f9788ec3648 Alexei Starovoitov 2026-03-08  1934  	for (i = 0; i < len; i++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1935  		int idx = start + i;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1936  		bool has_extra = false;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1937  		u8 cls = BPF_CLASS(insns[idx].code);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1938  		bool is_ldx_stx_call = cls == BPF_LDX || cls == BPF_STX ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1939  				       insns[idx].code == (BPF_JMP | BPF_CALL);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1940  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1941  		verbose(env, "%3d: ", idx);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1942  		verbose_insn(env, &insns[idx]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1943  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1944  		/* Collect what needs printing */
732f9788ec3648 Alexei Starovoitov 2026-03-08  1945  		has_extra = !spis_is_zero(state[idx].stack_def) ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1946  			    !spis_is_zero(state[idx].stack_use);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1947  		for (f = 0; f < MAX_CALL_FRAMES; f++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1948  			if (!spis_is_zero(nonlocal_use[i][f]) ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1949  			    !spis_is_zero(nonlocal_def[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1950  				has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1951  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1952  		if (is_ldx_stx_call &&
732f9788ec3648 Alexei Starovoitov 2026-03-08 @1953  		    info->at_in[i][0].frame != ARG_UNVISITED) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1954  			for (r = 0; r < MAX_BPF_REG - 1; r++)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1955  				if (info->at_in[i][r].frame != ARG_NONE &&
732f9788ec3648 Alexei Starovoitov 2026-03-08  1956  				    info->at_in[i][r].frame != ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1957  					has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1958  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1959  		if (is_ldx_stx_call) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1960  			for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1961  				if (at_stack_in[i][r].frame != ARG_NONE &&
732f9788ec3648 Alexei Starovoitov 2026-03-08  1962  				    at_stack_in[i][r].frame != ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1963  					has_extra = true;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1964  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1965  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1966  		if (!has_extra) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1967  			if (bpf_is_ldimm64(&insns[idx]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1968  				i++;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1969  			continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1970  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1971  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1972  		bpf_vlog_reset(&env->log, env->log.end_pos - 1);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1973  		verbose(env, " //");
732f9788ec3648 Alexei Starovoitov 2026-03-08  1974  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1975  		if (!spis_is_zero(state[idx].stack_def))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1976  			verbose(env, " stack_def=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1977  				state[idx].stack_def[1], state[idx].stack_def[0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1978  		if (!spis_is_zero(state[idx].stack_use))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1979  			verbose(env, " stack_use=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1980  				state[idx].stack_use[1], state[idx].stack_use[0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1981  
732f9788ec3648 Alexei Starovoitov 2026-03-08  1982  		for (f = 0; f < MAX_CALL_FRAMES; f++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1983  			if (!spis_is_zero(nonlocal_use[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1984  				verbose(env, " nonlocal_use[%d]=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1985  					f, nonlocal_use[i][f][1], nonlocal_use[i][f][0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1986  			if (!spis_is_zero(nonlocal_def[i][f]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  1987  				verbose(env, " nonlocal_def[%d]=%llx:%llx",
732f9788ec3648 Alexei Starovoitov 2026-03-08  1988  					f, nonlocal_def[i][f][1], nonlocal_def[i][f][0]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1989  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  1990  
732f9788ec3648 Alexei Starovoitov 2026-03-08 @1991  		if (is_ldx_stx_call && info->at_in &&
732f9788ec3648 Alexei Starovoitov 2026-03-08  1992  		    info->at_in[i][0].frame != ARG_UNVISITED) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1993  			for (r = 0; r < MAX_BPF_REG - 1; r++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  1994  				if (info->at_in[i][r].frame == ARG_NONE ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  1995  				    info->at_in[i][r].frame == ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  1996  					continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  1997  				verbose(env, " r%d=", r);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1998  				verbose_arg_track(env, &info->at_in[i][r]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  1999  			}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2000  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2001  
732f9788ec3648 Alexei Starovoitov 2026-03-08  2002  		if (is_ldx_stx_call) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  2003  			for (r = 0; r < MAX_ARG_SPILL_SLOTS; r++) {
732f9788ec3648 Alexei Starovoitov 2026-03-08  2004  				if (at_stack_in[i][r].frame == ARG_NONE ||
732f9788ec3648 Alexei Starovoitov 2026-03-08  2005  				    at_stack_in[i][r].frame == ARG_UNVISITED)
732f9788ec3648 Alexei Starovoitov 2026-03-08  2006  					continue;
732f9788ec3648 Alexei Starovoitov 2026-03-08  2007  				verbose(env, " fp%+d=", -(r + 1) * 8);
732f9788ec3648 Alexei Starovoitov 2026-03-08  2008  				verbose_arg_track(env, &at_stack_in[i][r]);
732f9788ec3648 Alexei Starovoitov 2026-03-08  2009  			}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2010  		}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2011  
732f9788ec3648 Alexei Starovoitov 2026-03-08  2012  		verbose(env, "\n");
732f9788ec3648 Alexei Starovoitov 2026-03-08  2013  		if (bpf_is_ldimm64(&insns[idx]))
732f9788ec3648 Alexei Starovoitov 2026-03-08  2014  			i++;
732f9788ec3648 Alexei Starovoitov 2026-03-08  2015  	}
732f9788ec3648 Alexei Starovoitov 2026-03-08  2016  }
732f9788ec3648 Alexei Starovoitov 2026-03-08  2017  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
