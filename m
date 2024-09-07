Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044B24C62
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 00:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725668725; cv=none; b=os5fJjkSTFYX8kcelW4FvfH9/yWC57D8LblAQqPk9b2fmOalLyd4DfCm2FLAjgUA30LlrF+Xa5gJOk1vUsYimwYmDVbigUg7vBJefc4e9GTmzxE7qUnTUzi36QYSxYOsC4ILYEIbfKOMxj8AFGzYQKgYw0yhVvfh9MTmuVjZ6rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725668725; c=relaxed/simple;
	bh=Ld8wxd9iHZtJi7RWE14fMfq6B1ElEC22KKAmJpFDFRA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TAjTeD8v+SBOpfBUyYzYGKT9J+INTyxPTNlvgTEYnOW87JC47dyUODbtgQQGrKqPaR2YrxskEPBD70E35oJtNtzRczmZ7tUsmr3nnLPK+OvsxFlWM1AqnnQLFhUG6MjYx1GiKZloj3mwgKMN8bJK9H7Z/xk0jlSR6rpYCiJP1xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+4QN0KC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+4QN0KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725668723; x=1757204723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ld8wxd9iHZtJi7RWE14fMfq6B1ElEC22KKAmJpFDFRA=;
  b=O+4QN0KC9AEZkR1Qk/TuCrulcWOEMjFofzwBoGHu8QmGMLC/5v9JGynx
   tnIJi+aQ2Yu1a5bRlDW7VjDq9N3gHWbIqET3R4rTaBeMUD4f9yvGBCsgz
   ZmTNjSFbs3cwTJH4VF5phz9Ruva7hu4ZBXSIaCLuOFHM5FwahHNXA/pCC
   2hWg8FRYpa7D+JUifOyODJbeUJFemy7xO9oaZRoul5E/h+rUfvq3+QgT5
   RRICVV05Y5TNsIEg1gXh2NaDEHGF7Rwqco7m5qtqHD+MAjB84LIgl1vpq
   bwe3T5LnRkVHE9QTb8+atodTNm0mKfBH1I+LuiiGLNjgglrOvzWuBUJwT
   A==;
X-CSE-ConnectionGUID: rtPQsLw1SNqUSz0sbJzsHw==
X-CSE-MsgGUID: 9x+4j3QaTjq5QHvo6/JwxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35037574"
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="35037574"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 17:25:22 -0700
X-CSE-ConnectionGUID: eOQ4o+NtQxyEXknx5qX2og==
X-CSE-MsgGUID: uZYftUvXRM6Wu4kr+OdQmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,209,1719903600"; 
   d="scan'208";a="70922154"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Sep 2024 17:25:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smjGQ-000Bth-2K;
	Sat, 07 Sep 2024 00:25:18 +0000
Date: Sat, 7 Sep 2024 08:24:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ak-misc:perf/brstack-resolve-1 2/10] util/srcline.c:705:11: error:
 incompatible pointer types passing 'unsigned int **' to parameter of type
 'unsigned int *'; remove &
Message-ID: <202409070859.dPaL35uu-lkp@intel.com>
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
commit: d0f1631ca16c114053cf48cf517b4e2f5d4c186e [2/10] perf: Support discriminator in addr2line
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070859.dPaL35uu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409070859.dPaL35uu-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:671: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.11.rc3.gd0f1631ca16c
>> util/srcline.c:705:11: error: incompatible pointer types passing 'unsigned int **' to parameter of type 'unsigned int *'; remove & [-Werror,-Wincompatible-pointer-types]
     705 |                                       &disc)) {
         |                                       ^~~~~
   util/srcline.c:514:16: note: passing argument to parameter 'disc' here
     514 |                                  unsigned *disc)
         |                                            ^
   1 error generated.
   make[7]: *** [tools/build/Makefile.build:106: tools/perf/util/srcline.o] Error 1
   make[7]: *** Waiting for unfinished jobs....
   make[6]: *** [tools/build/Makefile.build:158: util] Error 2
   make[5]: *** [Makefile.perf:789: tools/perf/perf-util-in.o] Error 2
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:292: sub-make] Error 2
   make[3]: *** [Makefile:76: all] Error 2


vim +705 tools/perf/util/srcline.c

a64489c56c307b Jin Yao            2017-03-26  645  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  646  static int addr2line(const char *dso_name, u64 addr,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  647  		     char **file, unsigned int *line_nr,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  648  		     struct dso *dso,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  649  		     bool unwind_inlines,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  650  		     struct inline_node *node,
d0f1631ca16c11 Andi Kleen         2024-08-09  651  		     struct symbol *sym __maybe_unused,
d0f1631ca16c11 Andi Kleen         2024-08-09  652  		     unsigned *disc)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  653  {
ee756ef7491eaf Ian Rogers         2024-05-04  654  	struct child_process *a2l = dso__a2l(dso);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  655  	char *record_function = NULL;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  656  	char *record_filename = NULL;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  657  	unsigned int record_line_nr = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  658  	int record_status = -1;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  659  	int ret = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  660  	size_t inline_count = 0;
b3801e7912316c Ian Rogers         2023-04-03  661  	int len;
b3801e7912316c Ian Rogers         2023-04-03  662  	char buf[128];
b3801e7912316c Ian Rogers         2023-04-03  663  	ssize_t written;
701677b95764c0 Ian Rogers         2023-06-07  664  	struct io io = { .eof = false };
2c4b9280748394 Ian Rogers         2023-04-03  665  	enum a2l_style a2l_style;
a64489c56c307b Jin Yao            2017-03-26  666  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  667  	if (!a2l) {
3b27222dd6cf75 Namhyung Kim       2022-12-15  668  		if (!filename__has_section(dso_name, ".debug_line"))
3b27222dd6cf75 Namhyung Kim       2022-12-15  669  			goto out;
3b27222dd6cf75 Namhyung Kim       2022-12-15  670  
ee756ef7491eaf Ian Rogers         2024-05-04  671  		dso__set_a2l(dso,
ee756ef7491eaf Ian Rogers         2024-05-04  672  			     addr2line_subprocess_init(symbol_conf.addr2line_path, dso_name));
ee756ef7491eaf Ian Rogers         2024-05-04  673  		a2l = dso__a2l(dso);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  674  	}
7285cf3325b4a1 Namhyung Kim       2017-10-31  675  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  676  	if (a2l == NULL) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  677  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  678  			pr_warning("%s %s: addr2line_subprocess_init failed\n", __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  679  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  680  	}
c7a0023a149535 Ian Rogers         2023-06-12  681  	a2l_style = addr2line_configure(a2l, dso_name);
c7a0023a149535 Ian Rogers         2023-06-12  682  	if (a2l_style == BROKEN)
2c4b9280748394 Ian Rogers         2023-04-03  683  		goto out;
7285cf3325b4a1 Namhyung Kim       2017-10-31  684  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  685  	/*
e90208e9ffe6cb Ian Rogers         2023-06-14  686  	 * Send our request and then *deliberately* send something that can't be
e90208e9ffe6cb Ian Rogers         2023-06-14  687  	 * interpreted as a valid address to ask addr2line about (namely,
e90208e9ffe6cb Ian Rogers         2023-06-14  688  	 * ","). This causes addr2line to first write out the answer to our
e90208e9ffe6cb Ian Rogers         2023-06-14  689  	 * request, in an unbounded/unknown number of records, and then to write
e90208e9ffe6cb Ian Rogers         2023-06-14  690  	 * out the lines "0x0...0", "??" and "??:0", for GNU binutils, or ","
e90208e9ffe6cb Ian Rogers         2023-06-14  691  	 * for llvm-addr2line, so that we can detect when it has finished giving
e90208e9ffe6cb Ian Rogers         2023-06-14  692  	 * us anything useful.
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  693  	 */
b3801e7912316c Ian Rogers         2023-04-03  694  	len = snprintf(buf, sizeof(buf), "%016"PRIx64"\n,\n", addr);
b3801e7912316c Ian Rogers         2023-04-03  695  	written = len > 0 ? write(a2l->in, buf, len) : -1;
b3801e7912316c Ian Rogers         2023-04-03  696  	if (written != len) {
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  697  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  698  			pr_warning("%s %s: could not send request\n", __func__, dso_name);
7285cf3325b4a1 Namhyung Kim       2017-10-31  699  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  700  	}
b3801e7912316c Ian Rogers         2023-04-03  701  	io__init(&io, a2l->out, buf, sizeof(buf));
701677b95764c0 Ian Rogers         2023-06-07  702  	io.timeout_ms = addr2line_timeout_ms;
e90208e9ffe6cb Ian Rogers         2023-06-14  703  	switch (read_addr2line_record(&io, a2l_style, dso_name, addr, /*first=*/true,
d0f1631ca16c11 Andi Kleen         2024-08-09  704  				      &record_function, &record_filename, &record_line_nr,
d0f1631ca16c11 Andi Kleen         2024-08-09 @705  				      &disc)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  706  	case -1:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  707  		if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  708  			pr_warning("%s %s: could not read first record\n", __func__, dso_name);
a64489c56c307b Jin Yao            2017-03-26  709  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  710  	case 0:
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  711  		/*
8dc26b6f718a81 Ian Rogers         2023-06-12  712  		 * The first record was invalid, so return failure, but first
8dc26b6f718a81 Ian Rogers         2023-06-12  713  		 * read another record, since we sent a sentinel ',' for the
e90208e9ffe6cb Ian Rogers         2023-06-14  714  		 * sake of detected the last inlined function. Treat this as the
e90208e9ffe6cb Ian Rogers         2023-06-14  715  		 * first of a record as the ',' generates a new start with GNU
e90208e9ffe6cb Ian Rogers         2023-06-14  716  		 * binutils, also force a non-zero address as we're no longer
e90208e9ffe6cb Ian Rogers         2023-06-14  717  		 * reading that record.
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  718  		 */
e90208e9ffe6cb Ian Rogers         2023-06-14  719  		switch (read_addr2line_record(&io, a2l_style, dso_name,
e90208e9ffe6cb Ian Rogers         2023-06-14  720  					      /*addr=*/1, /*first=*/true,
d0f1631ca16c11 Andi Kleen         2024-08-09  721  					      NULL, NULL, NULL, NULL)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  722  		case -1:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  723  			if (!symbol_conf.disable_add2line_warn)
e90208e9ffe6cb Ian Rogers         2023-06-14  724  				pr_warning("%s %s: could not read sentinel record\n",
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  725  					   __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  726  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  727  		case 0:
e90208e9ffe6cb Ian Rogers         2023-06-14  728  			/* The sentinel as expected. */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  729  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  730  		default:
d5e33ce06ba4a0 Namhyung Kim       2022-12-15  731  			if (!symbol_conf.disable_add2line_warn)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  732  				pr_warning("%s %s: unexpected record instead of sentinel",
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  733  					   __func__, dso_name);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  734  			break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  735  		}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  736  		goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  737  	default:
e90208e9ffe6cb Ian Rogers         2023-06-14  738  		/* First record as expected. */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  739  		break;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  740  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  741  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  742  	if (file) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  743  		*file = strdup(record_filename);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  744  		ret = 1;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  745  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  746  	if (line_nr)
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  747  		*line_nr = record_line_nr;
a64489c56c307b Jin Yao            2017-03-26  748  
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  749  	if (unwind_inlines) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  750  		if (node && inline_list__append_record(dso, node, sym,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  751  						       record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  752  						       record_filename,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  753  						       record_line_nr)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  754  			ret = 0;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  755  			goto out;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  756  		}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  757  	}
7285cf3325b4a1 Namhyung Kim       2017-10-31  758  
e90208e9ffe6cb Ian Rogers         2023-06-14  759  	/*
e90208e9ffe6cb Ian Rogers         2023-06-14  760  	 * We have to read the records even if we don't care about the inline
e90208e9ffe6cb Ian Rogers         2023-06-14  761  	 * info. This isn't the first record and force the address to non-zero
e90208e9ffe6cb Ian Rogers         2023-06-14  762  	 * as we're reading records beyond the first.
e90208e9ffe6cb Ian Rogers         2023-06-14  763  	 */
b3801e7912316c Ian Rogers         2023-04-03  764  	while ((record_status = read_addr2line_record(&io,
2c4b9280748394 Ian Rogers         2023-04-03  765  						      a2l_style,
e90208e9ffe6cb Ian Rogers         2023-06-14  766  						      dso_name,
e90208e9ffe6cb Ian Rogers         2023-06-14  767  						      /*addr=*/1,
e90208e9ffe6cb Ian Rogers         2023-06-14  768  						      /*first=*/false,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  769  						      &record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  770  						      &record_filename,
d0f1631ca16c11 Andi Kleen         2024-08-09  771  						      &record_line_nr, NULL)) == 1) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  772  		if (unwind_inlines && node && inline_count++ < MAX_INLINE_NEST) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  773  			if (inline_list__append_record(dso, node, sym,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  774  						       record_function,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  775  						       record_filename,
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  776  						       record_line_nr)) {
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  777  				ret = 0;
a64489c56c307b Jin Yao            2017-03-26  778  				goto out;
a64489c56c307b Jin Yao            2017-03-26  779  			}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  780  			ret = 1; /* found at least one inline frame */
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  781  		}
7285cf3325b4a1 Namhyung Kim       2017-10-31  782  	}
a64489c56c307b Jin Yao            2017-03-26  783  
a64489c56c307b Jin Yao            2017-03-26  784  out:
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  785  	free(record_function);
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  786  	free(record_filename);
701677b95764c0 Ian Rogers         2023-06-07  787  	if (io.eof) {
ee756ef7491eaf Ian Rogers         2024-05-04  788  		dso__set_a2l(dso, NULL);
701677b95764c0 Ian Rogers         2023-06-07  789  		addr2line_subprocess_cleanup(a2l);
701677b95764c0 Ian Rogers         2023-06-07  790  	}
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  791  	return ret;
be8ecc57f18041 Tony Garnock-Jones 2021-09-16  792  }
a64489c56c307b Jin Yao            2017-03-26  793  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
