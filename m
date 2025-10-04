Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D1021257B
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Oct 2025 02:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759546585; cv=none; b=KqmePnqJ13K2qkkQyBtZhOA5Y6kq7R9QRRpLwif/gEB2ueAsdtSLVgmsMtQ1rAIcZLZWSVgHLE4cKAMLscwImyT19dOQfnVpiydiNg9vVfWyydAaoqvlHRilsfne7P4KoWLxwaWpHnGcvMmFBmqkdmSaVi549/snlSZ40A04yW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759546585; c=relaxed/simple;
	bh=RsgS7uIbiGme8ARaUth/+GyJFu6E/MdXEoEKMp/mk8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCddnoz+8XMDPVRzHjhY00vjEv3jcmIwhvPIz74GUyQNOLxuBw8z4pddkRsMJf0iHr3cqic6LLcwQJ0x28bALnR78siJ4i0w2C9PoJIdfH5hdTWkvctu2HuW5wl09EpbI7XJDk5Z5My1XgXIKRxmFsK8AASmVcUvGVBJulmdfpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buZbsN0e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buZbsN0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759546583; x=1791082583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RsgS7uIbiGme8ARaUth/+GyJFu6E/MdXEoEKMp/mk8M=;
  b=buZbsN0ef0ncrGOk91dsFXPqBS9Z+bEEZf4lLJOQO+PIMNqXdngDNEmk
   F2ZYxymlse9ka841nUxA9qOkdbqoayJ5lhe3jPdJU/DHm7K/VlaTmjced
   Q4FZfGoG/X6ObhuZkvEUSUv42hiFHTkve1RmFQ18/ygDsB8znSBjdsikQ
   pobQkvKJEWSJBf03f/FeTHGpzD+oLIyswFY6e/wvSZYajfu+8dqH/N534
   ib8Wzauy5u197KUKi+3iKTmeUSsg6fkOBp+ch/sj8JG5I+wfkV84C+GQa
   h3GilmD1XZQN4s+5Jc4yTiDKEonqaYf4IGDeSS/WFaC/CEzpijUZe51cz
   A==;
X-CSE-ConnectionGUID: 83wfLVOBSzOY57My/zrL3A==
X-CSE-MsgGUID: oenLu0QeSJ2EqXtST4xs4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61533075"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="61533075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 19:56:23 -0700
X-CSE-ConnectionGUID: o98UxzuzRWSBXU/0/EhdkQ==
X-CSE-MsgGUID: rIvSAQ2+Tjm8lUKItepXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="210101074"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2025 19:56:22 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v4sRX-000000007a3-2QkI;
	Sat, 04 Oct 2025 02:56:19 +0000
Date: Sat, 4 Oct 2025 04:55:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [perf-tools-next:tmp.perf-tools-next 69/82]
 tools/perf/util/srcline.c: llvm.h is included more than once.
Message-ID: <202510040414.lXMbyKIu-lkp@intel.com>
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
head:   56be0fe5f62c8d165b8c9c3d3bc1dab6e8443146
commit: d9007afca0cf6c549c5049d5a75bce470453b024 [69/82] perf llvm: Move llvm functionality into its own file
:::::: branch date: 7 hours ago
:::::: commit date: 32 hours ago
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510040414.lXMbyKIu-lkp@intel.com/

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
