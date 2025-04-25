Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD30D2594B9
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Apr 2025 14:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745590887; cv=none; b=lWNwSq9V9hrBwYhCnhJW3Hzfk9nl77/UroGEnVMBKVtowLCGy6LRtuaEdOGxaeAGpSvKFmShJsrzWSksJdcC1h8H+VODUSeKx4VLhlobHD26SRyxpBjrVz064YIHRgvauHbVSNahp6peZ0J+VlGCnkYlpswghpbJc1U80XXs3b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745590887; c=relaxed/simple;
	bh=1I390Dq8VOnLoUtSxoUs3hb7NTphcCYQl7POqaplf0U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A8ScFgBwLAjhHgXoYVihsBt9dqQ+nnuAOYZyJpiHXgaHScpfPCoT5rB+DC9NXRaXoDRDYRi49W/9+ifbhCQkkieK4olxP8veAyRfWJRerP6DS8mkHnK8R3TsCZD6iivGpyKyliTIOYMf4tBUxH1Hq0YK793O1tpRz1zq2K8N+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi3a5djI; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi3a5djI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745590886; x=1777126886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1I390Dq8VOnLoUtSxoUs3hb7NTphcCYQl7POqaplf0U=;
  b=Gi3a5djIz+D8Ts6P9ENM1b7fzKwqmR0gkaKidKqrwfmWJbsgVbTUalq2
   t9bZuGsrou6UQeRQ8TVoEwwn0YJAtqcWsZ0aOydSvDI0CSN6IYj55Iz/v
   FlCoP06k+x+Eoq1lKyRo2ViT1q4OnqcOugiq87VYSkhaTIddKtYoqmn+g
   BQHcq7wQ0ewrX9dFqwJs8y7gLvfvun/wyYTW0x6Sxd68NrIQFEbGPy3w2
   yF/PyD8ZlEXt3I4p2GzRyDDv8rih5g1weHg4YxTloFA1vCjyNoHy4/aVI
   nzzwTbTTwPTt0/bLh/ic7zLFeDdxHG8WK9yHthH9RWkY5gjmbXUv3Yzk6
   A==;
X-CSE-ConnectionGUID: W33cdbJPSxKTPFLBdb3Mjw==
X-CSE-MsgGUID: sFFyb2dkSWSq0ClQXoFCKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51075003"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51075003"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 07:21:24 -0700
X-CSE-ConnectionGUID: UL+Nh/dBQlSDI4qdpfhTbQ==
X-CSE-MsgGUID: 9jNpB7GCRQOHYtK55Au8bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="137732500"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Apr 2025 07:21:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Jvd-0005Gn-2I;
	Fri, 25 Apr 2025 14:21:21 +0000
Date: Fri, 25 Apr 2025 22:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 5/68]
 tools/perf/util/srcline.c: llvm.h is included more than once.
Message-ID: <202504252201.A1xphely-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Ian Rogers <irogers@google.com>
CC: Arnaldo Carvalho de Melo <acme@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   24c0c35d4640052c61ed539a777bd3bd60d62bbf
commit: 75d9abd1032f15e85079687a30cf8edd70c6a7ce [5/68] perf llvm: Move llvm functionality into its own file
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504252201.A1xphely-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> tools/perf/util/srcline.c: llvm.h is included more than once.

vim +20 tools/perf/util/srcline.c

    15	
    16	#include "util/dso.h"
    17	#include "util/debug.h"
    18	#include "util/callchain.h"
    19	#include "util/symbol_conf.h"
  > 20	#include "llvm.h"
    21	#include "srcline.h"
    22	#include "string2.h"
    23	#include "symbol.h"
    24	#include "subcmd/run-command.h"
    25	
    26	/* If addr2line doesn't return data for 1 second then timeout. */
    27	int addr2line_timeout_ms = 1 * 1000;
    28	bool srcline_full_filename;
    29	
    30	char *srcline__unknown = (char *)"??:0";
    31	
    32	static const char *srcline_dso_name(struct dso *dso)
    33	{
    34		const char *dso_name;
    35	
    36		if (dso__symsrc_filename(dso))
    37			dso_name = dso__symsrc_filename(dso);
    38		else
    39			dso_name = dso__long_name(dso);
    40	
    41		if (dso_name[0] == '[')
    42			return NULL;
    43	
    44		if (is_perf_pid_map_name(dso_name))
    45			return NULL;
    46	
    47		return dso_name;
    48	}
    49	
    50	int inline_list__append(struct symbol *symbol, char *srcline, struct inline_node *node)
    51	{
    52		struct inline_list *ilist;
    53	
    54		ilist = zalloc(sizeof(*ilist));
    55		if (ilist == NULL)
    56			return -1;
    57	
    58		ilist->symbol = symbol;
    59		ilist->srcline = srcline;
    60	
    61		if (callchain_param.order == ORDER_CALLEE)
    62			list_add_tail(&ilist->list, &node->val);
    63		else
    64			list_add(&ilist->list, &node->val);
    65	
    66		return 0;
    67	}
    68	
    69	/* basename version that takes a const input string */
    70	static const char *gnu_basename(const char *path)
    71	{
    72		const char *base = strrchr(path, '/');
    73	
    74		return base ? base + 1 : path;
    75	}
    76	
    77	char *srcline_from_fileline(const char *file, unsigned int line)
    78	{
    79		char *srcline;
    80	
    81		if (!file)
    82			return NULL;
    83	
    84		if (!srcline_full_filename)
    85			file = gnu_basename(file);
    86	
    87		if (asprintf(&srcline, "%s:%u", file, line) < 0)
    88			return NULL;
    89	
    90		return srcline;
    91	}
    92	
    93	struct symbol *new_inline_sym(struct dso *dso,
    94				      struct symbol *base_sym,
    95				      const char *funcname)
    96	{
    97		struct symbol *inline_sym;
    98		char *demangled = NULL;
    99	
   100		if (!funcname)
   101			funcname = "??";
   102	
   103		if (dso) {
   104			demangled = dso__demangle_sym(dso, 0, funcname);
   105			if (demangled)
   106				funcname = demangled;
   107		}
   108	
   109		if (base_sym && strcmp(funcname, base_sym->name) == 0) {
   110			/* reuse the real, existing symbol */
   111			inline_sym = base_sym;
   112			/* ensure that we don't alias an inlined symbol, which could
   113			 * lead to double frees in inline_node__delete
   114			 */
   115			assert(!base_sym->inlined);
   116		} else {
   117			/* create a fake symbol for the inline frame */
   118			inline_sym = symbol__new(base_sym ? base_sym->start : 0,
   119						 base_sym ? (base_sym->end - base_sym->start) : 0,
   120						 base_sym ? base_sym->binding : 0,
   121						 base_sym ? base_sym->type : 0,
   122						 funcname);
   123			if (inline_sym)
   124				inline_sym->inlined = 1;
   125		}
   126	
   127		free(demangled);
   128	
   129		return inline_sym;
   130	}
   131	
   132	#define MAX_INLINE_NEST 1024
   133	
   134	#ifdef HAVE_LIBLLVM_SUPPORT
 > 135	#include "llvm.h"
   136	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
