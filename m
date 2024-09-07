Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57B012B73
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 02:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725674926; cv=none; b=DdkF0lTE3O/714pLoJ6EsUAziVHSV4uKKXeYsPKDdhJsJKe+p/UVdzds1PMVrDozVJKeKqvnabsHsI0vnK6okVw5tNdwI/BsL2wtpS1EHYgAU3J4KUELeuyLJWXjkDoqmJiD4eV1908s+IXy+svqEXYl72Fhi4W8erMna5ZKoBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725674926; c=relaxed/simple;
	bh=dd1Uhtll0OSdQuehzAVG9/vb3QFlJX22Is6HJH6ZsNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnmNGv4RqfiKMcsQeCxbYjoX/RCNFTzqp7fXUO9xQ/yaGMQWXJV5+uT6zD6T1NAQSUdNPrrUbqFkn3B5pGvUiwlXz2LktNjFPgxS1i6yd/dQVUwZvEBXgKNP/hZC1fT0ptgVxZn2JG+58nZuRwoDtBjZyyXaPiXYuhf1jH5RUoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YC6uyWId; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YC6uyWId"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725674924; x=1757210924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dd1Uhtll0OSdQuehzAVG9/vb3QFlJX22Is6HJH6ZsNg=;
  b=YC6uyWIdeB61Evm8fExle+6h0x5glTKPCLpggWL3Tj7tXVqquWOl6SuG
   0mqhP3Um1sOXYQ/T7PWdWEmB8sEPswfbNNSEo6giUhcxb8NBRAAPkHxyM
   fPddR9glrGc1s5xi5qpNOYuZ7qqEObQjHxH8FX+TSgJuoHOC3CeM5khu3
   Xhbq60ROCsCUjQco3BqICunUFyMz4q/ak+UZN7yRgG5kLxlU8xdBH4b7U
   9I0o2xagpmDC83WYCBEW5+l2MBaQm3DRtS2Jd2hGCt8+PPmwjUf/2t3VH
   DnLsXVLTq/n9duZlP7GWdQ98xO5PcyAlOSD9treB55KR3FuxkdlkTaBro
   A==;
X-CSE-ConnectionGUID: VIKtGYZPTZObQICC9UUFeQ==
X-CSE-MsgGUID: /HDAvtYKQ5u7BZfJIJsOwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24393378"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="24393378"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 19:08:43 -0700
X-CSE-ConnectionGUID: Nm7Z/V0eTVyspDwlmAKCjg==
X-CSE-MsgGUID: L0S8SdZCRe2evuXM24hfxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="65914589"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Sep 2024 19:08:42 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smksR-000C2D-1g;
	Sat, 07 Sep 2024 02:08:39 +0000
Date: Sat, 7 Sep 2024 10:07:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ak-misc:perf/brstack-resolve-1 6/10] util/srcline.c:759:14: error:
 incompatible pointer to integer conversion passing 'unsigned int *' to
 parameter of type 'unsigned int'; dereference with *
Message-ID: <202409071026.EWOx2E0j-lkp@intel.com>
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
TO: Andi Kleen <ak@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git perf/brstack-resolve-1
head:   593712b0a72c83baf16dc245ba6f9cc79984625d
commit: 42ab09253e0220d27a6afdbbba62169b3544405a [6/10] perf: Add plumbling for line/disc for inlines
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409071026.EWOx2E0j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409071026.EWOx2E0j-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc3.g42ab09253e02
   util/srcline.c:710:11: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
     710 |                                       &disc)) {
         |                                       ^~~~~
   util/srcline.c:518:16: note: passing argument to parameter 'disc' here
     518 |                                  unsigned *disc)
         |                                            ^
>> util/srcline.c:759:14: error: incompatible pointer to integer conversion passing 'unsigned int *' to parameter of type 'unsigned int'; dereference with * [-Wint-conversion]
     759 |                                                        disc)) {
         |                                                        ^~~~
         |                                                        *
   util/srcline.c:644:24: note: passing argument to parameter 'disc' here
     644 |                                       unsigned int disc)
         |                                                    ^
   util/srcline.c:777:30: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
     777 |                                                       &record_line_nr, &disc)) == 1) {
         |                                                                        ^~~~~
   util/srcline.c:518:16: note: passing argument to parameter 'disc' here
     518 |                                  unsigned *disc)
         |                                            ^
   util/srcline.c:782:30: error: incompatible pointer to integer conversion passing 'unsigned int *' to parameter of type 'unsigned int'; dereference with * [-Wint-conversion]
     782 |                                                        record_line_nr, disc)) {
         |                                                                        ^~~~
         |                                                                        *
   util/srcline.c:644:24: note: passing argument to parameter 'disc' here
     644 |                                       unsigned int disc)
         |                                                    ^
   4 errors generated.
   make[7]: *** [tools/build/Makefile.build:105: tools/perf/util/srcline.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +759 tools/perf/util/srcline.c

a64489c56c307b Jin Yao            2017-03-26  650  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  651  static int addr2line(const char *dso_name, u64 addr,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  652  		     char **file, unsigned int *line_nr,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  653  		     struct dso *dso,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  654  		     bool unwind_inlines,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  655  		     struct inline_node *node,
d0f1631ca16c11 Andi Kleen         2024-08-09  656  		     struct symbol *sym __maybe_unused,
d0f1631ca16c11 Andi Kleen         2024-08-09  657  		     unsigned *disc)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  658  {
ee756ef7491eaf Ian Rogers         2024-05-04  659  	struct child_process *a2l = dso__a2l(dso);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  660  	char *record_function = NULL;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  661  	char *record_filename = NULL;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  662  	unsigned int record_line_nr = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  663  	int record_status = -1;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  664  	int ret = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  665  	size_t inline_count = 0;
b3801e7912316c Ian Rogers         2023-04-03  666  	int len;
b3801e7912316c Ian Rogers         2023-04-03  667  	char buf[128];
b3801e7912316c Ian Rogers         2023-04-03  668  	ssize_t written;
701677b95764c0 Ian Rogers         2023-06-07  669  	struct io io = { .eof = false };
2c4b9280748394 Ian Rogers         2023-04-03  670  	enum a2l_style a2l_style;
a64489c56c307b Jin Yao            2017-03-26  671  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  672  	if (!a2l) {
3b27222dd6cf75 Namhyung Kim       2022-12-15  673  		if (!filename__has_section(dso_name, ".debug_line"))
3b27222dd6cf75 Namhyung Kim       2022-12-15  674  			goto out;
3b27222dd6cf75 Namhyung Kim       2022-12-15  675  
ee756ef7491eaf Ian Rogers         2024-05-04  676  		dso__set_a2l(dso,
ee756ef7491eaf Ian Rogers         2024-05-04  677  			     addr2line_subprocess_init(symbol_conf.addr2line_path, dso_name));
ee756ef7491eaf Ian Rogers         2024-05-04  678  		a2l = dso__a2l(dso);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  679  	}
7285cf3325b4a1 Namhyung Kim       2017-10-31  680  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  681  	if (a2l == NULL) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  682  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  683  			pr_warning("%s %s: addr2line_subprocess_init failed\n", __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  684  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  685  	}
c7a0023a149535 Ian Rogers         2023-06-12  686  	a2l_style = addr2line_configure(a2l, dso_name);
c7a0023a149535 Ian Rogers         2023-06-12  687  	if (a2l_style == BROKEN)
2c4b9280748394 Ian Rogers         2023-04-03  688  		goto out;
7285cf3325b4a1 Namhyung Kim       2017-10-31  689  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  690  	/*
e90208e9ffe6cb Ian Rogers         2023-06-14  691  	 * Send our request and then *deliberately* send something that can't be
e90208e9ffe6cb Ian Rogers         2023-06-14  692  	 * interpreted as a valid address to ask addr2line about (namely,
e90208e9ffe6cb Ian Rogers         2023-06-14  693  	 * ","). This causes addr2line to first write out the answer to our
e90208e9ffe6cb Ian Rogers         2023-06-14  694  	 * request, in an unbounded/unknown number of records, and then to write
e90208e9ffe6cb Ian Rogers         2023-06-14  695  	 * out the lines "0x0...0", "??" and "??:0", for GNU binutils, or ","
e90208e9ffe6cb Ian Rogers         2023-06-14  696  	 * for llvm-addr2line, so that we can detect when it has finished giving
e90208e9ffe6cb Ian Rogers         2023-06-14  697  	 * us anything useful.
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  698  	 */
b3801e7912316c Ian Rogers         2023-04-03  699  	len = snprintf(buf, sizeof(buf), "%016"PRIx64"\n,\n", addr);
b3801e7912316c Ian Rogers         2023-04-03  700  	written = len > 0 ? write(a2l->in, buf, len) : -1;
b3801e7912316c Ian Rogers         2023-04-03  701  	if (written != len) {
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  702  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  703  			pr_warning("%s %s: could not send request\n", __func__, dso_name);
7285cf3325b4a1 Namhyung Kim       2017-10-31  704  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  705  	}
b3801e7912316c Ian Rogers         2023-04-03  706  	io__init(&io, a2l->out, buf, sizeof(buf));
701677b95764c0 Ian Rogers         2023-06-07  707  	io.timeout_ms = addr2line_timeout_ms;
e90208e9ffe6cb Ian Rogers         2023-06-14  708  	switch (read_addr2line_record(&io, a2l_style, dso_name, addr, /*first=*/true,
d0f1631ca16c11 Andi Kleen         2024-08-09  709  				      &record_function, &record_filename, &record_line_nr,
d0f1631ca16c11 Andi Kleen         2024-08-09  710  				      &disc)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  711  	case -1:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  712  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  713  			pr_warning("%s %s: could not read first record\n", __func__, dso_name);
a64489c56c307b Jin Yao            2017-03-26  714  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  715  	case 0:
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  716  		/*
8dc26b6f718a81 Ian Rogers         2023-06-12  717  		 * The first record was invalid, so return failure, but first
8dc26b6f718a81 Ian Rogers         2023-06-12  718  		 * read another record, since we sent a sentinel ',' for the
e90208e9ffe6cb Ian Rogers         2023-06-14  719  		 * sake of detected the last inlined function. Treat this as the
e90208e9ffe6cb Ian Rogers         2023-06-14  720  		 * first of a record as the ',' generates a new start with GNU
e90208e9ffe6cb Ian Rogers         2023-06-14  721  		 * binutils, also force a non-zero address as we're no longer
e90208e9ffe6cb Ian Rogers         2023-06-14  722  		 * reading that record.
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  723  		 */
e90208e9ffe6cb Ian Rogers         2023-06-14  724  		switch (read_addr2line_record(&io, a2l_style, dso_name,
e90208e9ffe6cb Ian Rogers         2023-06-14  725  					      /*addr=*/1, /*first=*/true,
d0f1631ca16c11 Andi Kleen         2024-08-09  726  					      NULL, NULL, NULL, NULL)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  727  		case -1:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  728  			if (!symbol_conf.disable_add2line_warn)
e90208e9ffe6cb Ian Rogers         2023-06-14  729  				pr_warning("%s %s: could not read sentinel record\n",
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  730  					   __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  731  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  732  		case 0:
e90208e9ffe6cb Ian Rogers         2023-06-14  733  			/* The sentinel as expected. */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  734  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  735  		default:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  736  			if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  737  				pr_warning("%s %s: unexpected record instead of sentinel",
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  738  					   __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  739  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  740  		}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  741  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  742  	default:
e90208e9ffe6cb Ian Rogers         2023-06-14  743  		/* First record as expected. */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  744  		break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  745  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  746  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  747  	if (file) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  748  		*file = strdup(record_filename);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  749  		ret = 1;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  750  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  751  	if (line_nr)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  752  		*line_nr = record_line_nr;
a64489c56c307b Jin Yao            2017-03-26  753  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  754  	if (unwind_inlines) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  755  		if (node && inline_list__append_record(dso, node, sym,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  756  						       record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  757  						       record_filename,
42ab09253e0220 Andi Kleen         2024-09-04  758  						       record_line_nr,
42ab09253e0220 Andi Kleen         2024-09-04 @759  						       disc)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  760  			ret = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  761  			goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  762  		}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  763  	}
7285cf3325b4a1 Namhyung Kim       2017-10-31  764  
e90208e9ffe6cb Ian Rogers         2023-06-14  765  	/*
e90208e9ffe6cb Ian Rogers         2023-06-14  766  	 * We have to read the records even if we don't care about the inline
e90208e9ffe6cb Ian Rogers         2023-06-14  767  	 * info. This isn't the first record and force the address to non-zero
e90208e9ffe6cb Ian Rogers         2023-06-14  768  	 * as we're reading records beyond the first.
e90208e9ffe6cb Ian Rogers         2023-06-14  769  	 */
b3801e7912316c Ian Rogers         2023-04-03  770  	while ((record_status = read_addr2line_record(&io,
2c4b9280748394 Ian Rogers         2023-04-03  771  						      a2l_style,
e90208e9ffe6cb Ian Rogers         2023-06-14  772  						      dso_name,
e90208e9ffe6cb Ian Rogers         2023-06-14  773  						      /*addr=*/1,
e90208e9ffe6cb Ian Rogers         2023-06-14  774  						      /*first=*/false,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  775  						      &record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  776  						      &record_filename,
42ab09253e0220 Andi Kleen         2024-09-04  777  						      &record_line_nr, &disc)) == 1) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  778  		if (unwind_inlines && node && inline_count++ < MAX_INLINE_NEST) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  779  			if (inline_list__append_record(dso, node, sym,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  780  						       record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  781  						       record_filename,
42ab09253e0220 Andi Kleen         2024-09-04  782  						       record_line_nr, disc)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  783  				ret = 0;
a64489c56c307b Jin Yao            2017-03-26  784  				goto out;
a64489c56c307b Jin Yao            2017-03-26  785  			}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  786  			ret = 1; /* found at least one inline frame */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  787  		}
7285cf3325b4a1 Namhyung Kim       2017-10-31  788  	}
a64489c56c307b Jin Yao            2017-03-26  789  
a64489c56c307b Jin Yao            2017-03-26  790  out:
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  791  	free(record_function);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  792  	free(record_filename);
701677b95764c0 Ian Rogers         2023-06-07  793  	if (io.eof) {
ee756ef7491eaf Ian Rogers         2024-05-04  794  		dso__set_a2l(dso, NULL);
701677b95764c0 Ian Rogers         2023-06-07  795  		addr2line_subprocess_cleanup(a2l);
701677b95764c0 Ian Rogers         2023-06-07  796  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  797  	return ret;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  798  }
a64489c56c307b Jin Yao            2017-03-26  799  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
