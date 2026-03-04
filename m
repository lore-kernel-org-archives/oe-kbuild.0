Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79670369973
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772658097; cv=none; b=QaXb0cEZtPf/kEdQZeYh25q/7/HmHnRt6DYdk3q8FFJM8TmIad60TvrEx5yg8Ie60tzS4pxsvik8uevssZirjf8YvNuyi6nI3FvFLHCcRDeUR/xGaDIBuoRO4wOEBavamsUaAkBmB02iFkE4yrRvcA9Z6p9UuzfvcRUwywz92j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772658097; c=relaxed/simple;
	bh=EAh1OZ5G3kL8XclZlZfHFucp/O4fswMsPfgGgpTxEzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kWTDyKtjKw3shPcrRB1JVw46ZswhZ+MijQJf9HXhGjVJceyxvgUkcajtri+peFramCkh6TN8giRueg1UsN7qVsRCHNayFxkmOZYHj+paV0F4D4f4xJfmsemST+JQuw+2/8Jvk1KZ7hgi79wioxLBVD6BxU3gauRBW4xJ0bhlxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEGm/1nF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEGm/1nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772658093; x=1804194093;
  h=date:from:to:cc:subject:message-id;
  bh=EAh1OZ5G3kL8XclZlZfHFucp/O4fswMsPfgGgpTxEzo=;
  b=EEGm/1nF6MOWldMMlZr/nsx36hXImTbUiB/A4VQctIr43n5QL73rDqNc
   L+m+M1jK/8gx585RwI/g7tssySEHJt6PJ/N6iRRWrGqb+vQotTxmMUng9
   lXC9/95kojRig5riazw8xpoIQkbycOg3IolJhHOJmSawL0fYDrfe90Anx
   15M3yh6EvW2TzlXUkhJBxWsbyvqqeSzZ0srKDnSLAtI/R5XWitTViNKrk
   G9iOpxh6VHE3ekBwupBMFmg0L96KTLK/jCwNijUQLhP0t+ANS2EiP64nD
   4rLF/Kuot4ZzHS1y16SCPldCZxsBxW0dyt1TYSd7mT6skzGSgTwYmPDIO
   A==;
X-CSE-ConnectionGUID: y2Msii1CRCOzAn38NVuJqw==
X-CSE-MsgGUID: Efn9KX7PSPOm63ghSx1rDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73703310"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73703310"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 13:01:32 -0800
X-CSE-ConnectionGUID: mfm9zVwQTmi78Zsa4rWgtA==
X-CSE-MsgGUID: pPAm7P7ORIe0fmsmoRJQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216762352"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 13:01:30 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxtLU-000000004V4-2DQn;
	Wed, 04 Mar 2026 21:01:28 +0000
Date: Thu, 05 Mar 2026 05:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/trace_output.c:753 print_function_args() error:
 we previously assumed 't' could be null (see line 736)
Message-ID: <202603050441.tVU9Bcq5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
commit: 76fe0337c2199988cb9ed7e41c05d687d95f2e18 ftrace: Add arguments to function tracer
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r071-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050441.tVU9Bcq5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603050441.tVU9Bcq5-lkp@intel.com/

smatch warnings:
kernel/trace/trace_output.c:753 print_function_args() error: we previously assumed 't' could be null (see line 736)

vim +/t +753 kernel/trace/trace_output.c

c4a8e8be2d43cc2 Frederic Weisbecker 2009-02-02  689  
533c20b062d7c25 Sven Schnelle       2025-02-27  690  #ifdef CONFIG_FUNCTION_TRACE_ARGS
533c20b062d7c25 Sven Schnelle       2025-02-27  691  void print_function_args(struct trace_seq *s, unsigned long *args,
533c20b062d7c25 Sven Schnelle       2025-02-27  692  			 unsigned long func)
533c20b062d7c25 Sven Schnelle       2025-02-27  693  {
533c20b062d7c25 Sven Schnelle       2025-02-27  694  	const struct btf_param *param;
533c20b062d7c25 Sven Schnelle       2025-02-27  695  	const struct btf_type *t;
533c20b062d7c25 Sven Schnelle       2025-02-27  696  	const char *param_name;
533c20b062d7c25 Sven Schnelle       2025-02-27  697  	char name[KSYM_NAME_LEN];
533c20b062d7c25 Sven Schnelle       2025-02-27  698  	unsigned long arg;
533c20b062d7c25 Sven Schnelle       2025-02-27  699  	struct btf *btf;
533c20b062d7c25 Sven Schnelle       2025-02-27  700  	s32 tid, nr = 0;
533c20b062d7c25 Sven Schnelle       2025-02-27  701  	int a, p, x;
533c20b062d7c25 Sven Schnelle       2025-02-27  702  
533c20b062d7c25 Sven Schnelle       2025-02-27  703  	trace_seq_printf(s, "(");
533c20b062d7c25 Sven Schnelle       2025-02-27  704  
533c20b062d7c25 Sven Schnelle       2025-02-27  705  	if (!args)
533c20b062d7c25 Sven Schnelle       2025-02-27  706  		goto out;
533c20b062d7c25 Sven Schnelle       2025-02-27  707  	if (lookup_symbol_name(func, name))
533c20b062d7c25 Sven Schnelle       2025-02-27  708  		goto out;
533c20b062d7c25 Sven Schnelle       2025-02-27  709  
533c20b062d7c25 Sven Schnelle       2025-02-27  710  	/* TODO: Pass module name here too */
533c20b062d7c25 Sven Schnelle       2025-02-27  711  	t = btf_find_func_proto(name, &btf);
533c20b062d7c25 Sven Schnelle       2025-02-27  712  	if (IS_ERR_OR_NULL(t))
533c20b062d7c25 Sven Schnelle       2025-02-27  713  		goto out;
533c20b062d7c25 Sven Schnelle       2025-02-27  714  
533c20b062d7c25 Sven Schnelle       2025-02-27  715  	param = btf_get_func_param(t, &nr);
533c20b062d7c25 Sven Schnelle       2025-02-27  716  	if (!param)
533c20b062d7c25 Sven Schnelle       2025-02-27  717  		goto out_put;
533c20b062d7c25 Sven Schnelle       2025-02-27  718  
533c20b062d7c25 Sven Schnelle       2025-02-27  719  	for (a = 0, p = 0; p < nr; a++, p++) {
533c20b062d7c25 Sven Schnelle       2025-02-27  720  		if (p)
533c20b062d7c25 Sven Schnelle       2025-02-27  721  			trace_seq_puts(s, ", ");
533c20b062d7c25 Sven Schnelle       2025-02-27  722  
533c20b062d7c25 Sven Schnelle       2025-02-27  723  		/* This only prints what the arch allows (6 args by default) */
533c20b062d7c25 Sven Schnelle       2025-02-27  724  		if (a == FTRACE_REGS_MAX_ARGS) {
533c20b062d7c25 Sven Schnelle       2025-02-27  725  			trace_seq_puts(s, "...");
533c20b062d7c25 Sven Schnelle       2025-02-27  726  			break;
533c20b062d7c25 Sven Schnelle       2025-02-27  727  		}
533c20b062d7c25 Sven Schnelle       2025-02-27  728  
533c20b062d7c25 Sven Schnelle       2025-02-27  729  		arg = args[a];
533c20b062d7c25 Sven Schnelle       2025-02-27  730  
533c20b062d7c25 Sven Schnelle       2025-02-27  731  		param_name = btf_name_by_offset(btf, param[p].name_off);
533c20b062d7c25 Sven Schnelle       2025-02-27  732  		if (param_name)
533c20b062d7c25 Sven Schnelle       2025-02-27  733  			trace_seq_printf(s, "%s=", param_name);
533c20b062d7c25 Sven Schnelle       2025-02-27  734  		t = btf_type_skip_modifiers(btf, param[p].type, &tid);
533c20b062d7c25 Sven Schnelle       2025-02-27  735  
533c20b062d7c25 Sven Schnelle       2025-02-27 @736  		switch (t ? BTF_INFO_KIND(t->info) : BTF_KIND_UNKN) {
533c20b062d7c25 Sven Schnelle       2025-02-27  737  		case BTF_KIND_UNKN:
533c20b062d7c25 Sven Schnelle       2025-02-27  738  			trace_seq_putc(s, '?');
533c20b062d7c25 Sven Schnelle       2025-02-27  739  			/* Still print unknown type values */
533c20b062d7c25 Sven Schnelle       2025-02-27  740  			fallthrough;
533c20b062d7c25 Sven Schnelle       2025-02-27  741  		case BTF_KIND_PTR:
533c20b062d7c25 Sven Schnelle       2025-02-27  742  			trace_seq_printf(s, "0x%lx", arg);
533c20b062d7c25 Sven Schnelle       2025-02-27  743  			break;
533c20b062d7c25 Sven Schnelle       2025-02-27  744  		case BTF_KIND_INT:
533c20b062d7c25 Sven Schnelle       2025-02-27  745  			trace_seq_printf(s, "%ld", arg);
533c20b062d7c25 Sven Schnelle       2025-02-27  746  			break;
533c20b062d7c25 Sven Schnelle       2025-02-27  747  		case BTF_KIND_ENUM:
533c20b062d7c25 Sven Schnelle       2025-02-27  748  			trace_seq_printf(s, "%ld", arg);
533c20b062d7c25 Sven Schnelle       2025-02-27  749  			break;
533c20b062d7c25 Sven Schnelle       2025-02-27  750  		default:
533c20b062d7c25 Sven Schnelle       2025-02-27  751  			/* This does not handle complex arguments */
533c20b062d7c25 Sven Schnelle       2025-02-27  752  			trace_seq_printf(s, "(%s)[0x%lx", btf_type_str(t), arg);
533c20b062d7c25 Sven Schnelle       2025-02-27 @753  			for (x = sizeof(long); x < t->size; x += sizeof(long)) {
533c20b062d7c25 Sven Schnelle       2025-02-27  754  				trace_seq_putc(s, ':');
533c20b062d7c25 Sven Schnelle       2025-02-27  755  				if (++a == FTRACE_REGS_MAX_ARGS) {
533c20b062d7c25 Sven Schnelle       2025-02-27  756  					trace_seq_puts(s, "...]");
533c20b062d7c25 Sven Schnelle       2025-02-27  757  					goto out_put;
533c20b062d7c25 Sven Schnelle       2025-02-27  758  				}
533c20b062d7c25 Sven Schnelle       2025-02-27  759  				trace_seq_printf(s, "0x%lx", args[a]);
533c20b062d7c25 Sven Schnelle       2025-02-27  760  			}
533c20b062d7c25 Sven Schnelle       2025-02-27  761  			trace_seq_putc(s, ']');
533c20b062d7c25 Sven Schnelle       2025-02-27  762  			break;
533c20b062d7c25 Sven Schnelle       2025-02-27  763  		}
533c20b062d7c25 Sven Schnelle       2025-02-27  764  	}
533c20b062d7c25 Sven Schnelle       2025-02-27  765  out_put:
533c20b062d7c25 Sven Schnelle       2025-02-27  766  	btf_put(btf);
533c20b062d7c25 Sven Schnelle       2025-02-27  767  out:
533c20b062d7c25 Sven Schnelle       2025-02-27  768  	trace_seq_printf(s, ")");
533c20b062d7c25 Sven Schnelle       2025-02-27  769  }
533c20b062d7c25 Sven Schnelle       2025-02-27  770  #endif
533c20b062d7c25 Sven Schnelle       2025-02-27  771  

:::::: The code at line 753 was first introduced by commit
:::::: 533c20b062d7c25cbcbadb31e3ecb95a08ddb877 ftrace: Add print_function_args()

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
