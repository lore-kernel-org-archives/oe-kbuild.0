Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793589449;
	b=IlEb8lXXIw7gclCEM/WaFaZBkEPs+ov2VkO2hpJQhLr2w13+mKqxE533YKLn2Q9exH8I
	 sJxksQhtahrBYtrU54hAWZOlEZZmXy/Zf1ZVOMnA4sSfiLCePLgTAPmyU85He13ZjS/xx
	 SJWXhcbZoQlj7AAsT11HmOQIyVqDYVnPMN9+RZhO3yB2kXJGRMcZx7oJYS11S3PuVD702
	 HrD5hoK6EgmHmnuO/2nKlDI06jj7NImZaZNZzklHgOBQuqy0CJLcC4GLfvSzwyLYfr3Jd
	 TTATLl1a3I8wrhV6cXjCzMcujlKsDyc6PNX8u/iJQfBhf1x5OgT4AxO8nBBfReR8Rhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793589449;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o0WClwL14F6uef0yLpN989qBT6vNRmrWAQmhcKHezsw=;
	b=bVV3wWir+1K+Hv84QPVFUBc1CFDsUO1yh+Zdh0FR3Vt4w6dikJsMGOAKmaw+YjxwxQqe
	 E/mSBrU0qe8alKuC1/tvR/BsLYFIY03+fHOpBAYiptIPHsr4HqESXsujiZysXSU59a0n0
	 M4/vH7wAjXpNeyUF44vaRUJSinitOvQHa66BcIZg/pRxKHirB1CooXHvdKdFzpH/Thu0D
	 CmrF3Bluv9DoXq467TpiXklgNjG38te8VJy1blCTN7euZMz39aAe7IvYpmz54j/8e64sG
	 JGtevYbE/xf4ztCyPD9J8rzmb/edqpd37sEYK9pl92+9xbTZNovltZLy6rgBqV2PlFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="g1+B/OTj";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ECB606A324
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 03:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73ECB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1+B/OTj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793589449; x=1825125449;
  h=date:from:to:cc:subject:message-id;
  bh=lm/T/fGsfkd8Ll6o9DYrAWATeW4rdOIgF0MAWp9hrxM=;
  b=g1+B/OTjgqvdMgwOdYf+fT0wxFAbK/gKxTdMBJbemwKWz2ZpDaZtjmtQ
   9J+I7TC2UoMEysGfK5A2sWgfdT2RLGT+M5Wug1Veu6axk/j6WrYCObgvO
   Ya1Af3NY3AphgtAZLuk1nL9nC6WP2DhbNpy2LsJzhiybgsvc7uZp+vTTu
   HmfvKztmWCy8EgjIJtpbFDVanjfEgFSUvVTrRaROSURPK+Twp68DcuHWN
   ZiQ3S8wjwY41QgtpO+LtrRgNHwsYaTNPhnprHuO3TGp5g60cbu6vS81JA
   pmSuPR4ovdfSShUWFtScT6qJ8ROOP5vwhdlosu18McMEEvbw9NfZS9xJ3
   g==;
X-CSE-ConnectionGUID: gRk/gRUKTYCHj4uHEntH7w==
X-CSE-MsgGUID: T1dVysFESsa6xqR20Lrk2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2276849"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2276849"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 19:17:28 -0800
X-CSE-ConnectionGUID: qDerhx3xRmeFtNzvpUm+OQ==
X-CSE-MsgGUID: LxTM4vHzRH+WwpfAQr7Ebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="7768421"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 01 Nov 2026 19:17:26 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNiY0-000000008Eh-1cnI;
	Mon, 02 Nov 2026 03:17:24 +0000
Date: Mon, 02 Nov 2026 04:17:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/trace/trace_functions_graph.c:955:34-40: opportunity
 for str_true_false(retval)
Message-ID: <202611020428.L48GPs7r-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: pengdonglin <pengdonglin@xiaomi.com>
CC: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: 2557f93014d8d3dcab9dda20130412df591fd996 fgraph: Enhance funcgraph-retval with BTF-based type-aware output
date:   2 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r2106-20261101 (https://download.01.org/0day-ci/archive/20261102/202611020428.L48GPs7r-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2557f93014d8 ("fgraph: Enhance funcgraph-retval with BTF-based type-aware output")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611020428.L48GPs7r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/trace_functions_graph.c:955:34-40: opportunity for str_true_false(retval)

vim +955 kernel/trace/trace_functions_graph.c

a1be9ccc57f07d Donglin Peng   2023-04-08  893  
2557f93014d8d3 pengdonglin    2026-09-16  894  	if (print_retval) {
2557f93014d8d3 pengdonglin    2026-09-16  895  		int fmt = RETVAL_FMT_HEX;
2557f93014d8d3 pengdonglin    2026-09-16  896  
2557f93014d8d3 pengdonglin    2026-09-16  897  		hex_format = !!(opt_flags & TRACE_GRAPH_PRINT_RETVAL_HEX);
2557f93014d8d3 pengdonglin    2026-09-16  898  		btf_trim_retval((unsigned long)func, &retval, &print_retval, &fmt,
2557f93014d8d3 pengdonglin    2026-09-16  899  				hex_format);
2557f93014d8d3 pengdonglin    2026-09-16  900  		if (print_retval) {
2557f93014d8d3 pengdonglin    2026-09-16  901  			if (hex_format)
2557f93014d8d3 pengdonglin    2026-09-16  902  				retval_fmt = RETVAL_FMT_HEX;
2557f93014d8d3 pengdonglin    2026-09-16  903  
2557f93014d8d3 pengdonglin    2026-09-16  904  			if (retval && retval_fmt != RETVAL_FMT_HEX &&
2557f93014d8d3 pengdonglin    2026-09-16  905  			    !(fmt & RETVAL_FMT_BTF)) {
a1be9ccc57f07d Donglin Peng   2023-04-08  906  				/* Check if the return value matches the negative format */
a1be9ccc57f07d Donglin Peng   2023-04-08  907  				if (IS_ENABLED(CONFIG_64BIT) && (retval & BIT(31)) &&
a1be9ccc57f07d Donglin Peng   2023-04-08  908  					(((u64)retval) >> 32) == 0) {
21e92806d39c68 Donglin Peng   2024-09-14  909  					err_code = sign_extend64(retval, 31);
a1be9ccc57f07d Donglin Peng   2023-04-08  910  				} else {
a1be9ccc57f07d Donglin Peng   2023-04-08  911  					err_code = retval;
a1be9ccc57f07d Donglin Peng   2023-04-08  912  				}
a1be9ccc57f07d Donglin Peng   2023-04-08  913  
a1be9ccc57f07d Donglin Peng   2023-04-08  914  				if (!IS_ERR_VALUE(err_code))
a1be9ccc57f07d Donglin Peng   2023-04-08  915  					err_code = 0;
21e92806d39c68 Donglin Peng   2024-09-14  916  			}
a1be9ccc57f07d Donglin Peng   2023-04-08  917  
2557f93014d8d3 pengdonglin    2026-09-16  918  			if (retval_fmt == RETVAL_FMT_HEX) {
2557f93014d8d3 pengdonglin    2026-09-16  919  				retval_fmt |= (fmt & RETVAL_FMT_TRUNC);
2557f93014d8d3 pengdonglin    2026-09-16  920  			} else {
2557f93014d8d3 pengdonglin    2026-09-16  921  				if (err_code && fmt & RETVAL_FMT_HEX)
2557f93014d8d3 pengdonglin    2026-09-16  922  					fmt = (fmt & ~RETVAL_FMT_HEX) | RETVAL_FMT_DEC;
2557f93014d8d3 pengdonglin    2026-09-16  923  				retval_fmt = fmt;
2557f93014d8d3 pengdonglin    2026-09-16  924  			}
2557f93014d8d3 pengdonglin    2026-09-16  925  		}
2557f93014d8d3 pengdonglin    2026-09-16  926  	}
2557f93014d8d3 pengdonglin    2026-09-16  927  
21e92806d39c68 Donglin Peng   2024-09-14  928  	if (entry) {
21e92806d39c68 Donglin Peng   2024-09-14  929  		if (entry->ent.type != TRACE_GRAPH_RETADDR_ENT)
21e92806d39c68 Donglin Peng   2024-09-14  930  			print_retaddr = false;
21e92806d39c68 Donglin Peng   2024-09-14  931  
ff5c9c576e7545 Sven Schnelle  2025-02-27  932  		trace_seq_printf(s, "%ps", func);
ff5c9c576e7545 Sven Schnelle  2025-02-27  933  
ff5c9c576e7545 Sven Schnelle  2025-02-27  934  		if (args_size >= FTRACE_REGS_MAX_ARGS * sizeof(long)) {
c9703d17d2c86e Donglin Peng   2026-01-12  935  			print_function_args(s, FGRAPH_ENTRY_ARGS(entry), (unsigned long)func);
ff5c9c576e7545 Sven Schnelle  2025-02-27  936  			trace_seq_putc(s, ';');
ff5c9c576e7545 Sven Schnelle  2025-02-27  937  		} else
ff5c9c576e7545 Sven Schnelle  2025-02-27  938  			trace_seq_puts(s, "();");
ff5c9c576e7545 Sven Schnelle  2025-02-27  939  
21e92806d39c68 Donglin Peng   2024-09-14  940  		if (print_retval || print_retaddr)
21e92806d39c68 Donglin Peng   2024-09-14  941  			trace_seq_puts(s, " /*");
a1be9ccc57f07d Donglin Peng   2023-04-08  942  	} else {
21e92806d39c68 Donglin Peng   2024-09-14  943  		print_retaddr = false;
21e92806d39c68 Donglin Peng   2024-09-14  944  		trace_seq_printf(s, "} /* %ps", func);
21e92806d39c68 Donglin Peng   2024-09-14  945  	}
21e92806d39c68 Donglin Peng   2024-09-14  946  
21e92806d39c68 Donglin Peng   2024-09-14  947  	if (print_retaddr)
21e92806d39c68 Donglin Peng   2024-09-14  948  		print_graph_retaddr(s, (struct fgraph_retaddr_ent_entry *)entry,
21e92806d39c68 Donglin Peng   2024-09-14  949  				    trace_flags, false);
21e92806d39c68 Donglin Peng   2024-09-14  950  
21e92806d39c68 Donglin Peng   2024-09-14  951  	if (print_retval) {
2557f93014d8d3 pengdonglin    2026-09-16  952  		if (retval_fmt & RETVAL_FMT_HEX)
21e92806d39c68 Donglin Peng   2024-09-14  953  			trace_seq_printf(s, " ret=0x%lx", retval);
2557f93014d8d3 pengdonglin    2026-09-16  954  		else if (retval_fmt & RETVAL_FMT_BOOL)
2557f93014d8d3 pengdonglin    2026-09-16 @955  			trace_seq_printf(s, " ret=%s", retval ? "true" : "false");
2557f93014d8d3 pengdonglin    2026-09-16  956  		else if (retval_fmt & RETVAL_FMT_UNSIGNED)
2557f93014d8d3 pengdonglin    2026-09-16  957  			trace_seq_printf(s, " ret=%lu", retval);
a1be9ccc57f07d Donglin Peng   2023-04-08  958  		else
2557f93014d8d3 pengdonglin    2026-09-16  959  			trace_seq_printf(s, " ret=%ld", err_code ?: retval);
2557f93014d8d3 pengdonglin    2026-09-16  960  
2557f93014d8d3 pengdonglin    2026-09-16  961  		if (retval_fmt & RETVAL_FMT_TRUNC)
2557f93014d8d3 pengdonglin    2026-09-16  962  			trace_seq_printf(s, "(trunc)");
a1be9ccc57f07d Donglin Peng   2023-04-08  963  	}
21e92806d39c68 Donglin Peng   2024-09-14  964  
21e92806d39c68 Donglin Peng   2024-09-14  965  	if (!entry || print_retval || print_retaddr)
485acd207d7daf Steven Rostedt 2025-04-11  966  		trace_seq_puts(s, " */");
a1be9ccc57f07d Donglin Peng   2023-04-08  967  }
a1be9ccc57f07d Donglin Peng   2023-04-08  968  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
