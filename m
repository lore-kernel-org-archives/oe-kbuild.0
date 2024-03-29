Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152C344377
	for <oe-kbuild@lists.linux.dev>; Fri, 29 Mar 2024 07:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711698524; cv=none; b=gt40UsWeczyWPrcj9deZq8q3Rkuxr+rWLJLd82QJcmZ9BW7byARjmn6yfL0825zWmbRPZGx0a45WWpOZux15GIUOa69okOvzuDZ8C/CT5pbY0428EDkiCgxQq07E73iDe3fhlSMgxLigKJ/2HR3MduKEMnkngstXw32pLJ49EPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711698524; c=relaxed/simple;
	bh=Vyii/Wrvqp0AEpMmNOd1GqL0xncww80OrwzZv+v+OVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aQKXuUgB8dveresNBw2SPrzdHtWTGePqP0fUCiFZSswWjOEmkfXD7kWVjuSotjrr0HOu7KyjrXyplp8sxDG9cVIsFWbnGwP/ARiMd88xDAdkG54jhkS2LZhJBA+mxfhD4EZNFLcO1F0uS69DJVi+AbxYCuYg/2gEYAoViqtXM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYnQYPBq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYnQYPBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711698522; x=1743234522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vyii/Wrvqp0AEpMmNOd1GqL0xncww80OrwzZv+v+OVY=;
  b=iYnQYPBq2IbFguXBBMdOjIJVjjKHiGjSEQXJljsSJYayK7HowYnw9lx2
   i8amR0KCbP8/Alcq8bbtHWRlCfKk0pV4EwQKErBqFSrbw7iRF5nGkDKKG
   S5F2q6SpOX4RaqMigl46n6gAhiOmLNR2qKZVj0PyqBO0j6tGoUZjWRg0u
   YM8xS7FN13lR9PIS6WLOEiOmNJQrMKq5edAl4c77lzC6XliQuTt21zUwk
   51h4kGSbhn1eYPoxb/c6o5AJuf/sMqvBIlqyvjXhHW+hoVnDJwYd67/sJ
   FYvvwclU6coOQOspeA0mCqas0eKQ6nBJGlQVRqYsidQOH8A94GwbTB+p2
   g==;
X-CSE-ConnectionGUID: AmXL0xgqQNOzNGlvAQZ8Sg==
X-CSE-MsgGUID: dWCRadskR2OOeTIBkE1lsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7480239"
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="7480239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 00:48:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,164,1708416000"; 
   d="scan'208";a="21568660"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Mar 2024 00:48:40 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq6yb-0002xo-2n;
	Fri, 29 Mar 2024 07:48:37 +0000
Date: Fri, 29 Mar 2024 15:48:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [bcachefs:bcachefs-testing 174/177] fs/bcachefs/error.c:360:1-7:
 preceding lock on line 227
Message-ID: <202403291555.i4InFfIm-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3e556288d52a623a50e81b3686e596a9bdd9d382
commit: 8e8e3bb58523eb25f81be05c8dd36324b1e23e3b [174/177] bcachefs: allow for custom action in fsck error messages
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-102-20240329 (https://download.01.org/0day-ci/archive/20240329/202403291555.i4InFfIm-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403291555.i4InFfIm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/error.c:360:1-7: preceding lock on line 227

vim +360 fs/bcachefs/error.c

8e8e3bb58523eb Kent Overstreet 2024-03-28  191  
b65db750e2bb92 Kent Overstreet 2023-10-24  192  int bch2_fsck_err(struct bch_fs *c,
b65db750e2bb92 Kent Overstreet 2023-10-24  193  		  enum bch_fsck_flags flags,
b65db750e2bb92 Kent Overstreet 2023-10-24  194  		  enum bch_sb_error_id err,
b65db750e2bb92 Kent Overstreet 2023-10-24  195  		  const char *fmt, ...)
dbb9936b0dc905 Kent Overstreet 2022-09-25  196  {
dbb9936b0dc905 Kent Overstreet 2022-09-25  197  	struct fsck_err_state *s = NULL;
dbb9936b0dc905 Kent Overstreet 2022-09-25  198  	va_list args;
22f51621335837 Kent Overstreet 2022-10-09  199  	bool print = true, suppressing = false, inconsistent = false;
dbb9936b0dc905 Kent Overstreet 2022-09-25  200  	struct printbuf buf = PRINTBUF, *out = &buf;
dbb9936b0dc905 Kent Overstreet 2022-09-25  201  	int ret = -BCH_ERR_fsck_ignore;
8e8e3bb58523eb Kent Overstreet 2024-03-28  202  	const char *action_orig = "fix?", *action = action_orig;
dbb9936b0dc905 Kent Overstreet 2022-09-25  203  
a64a37338d49a7 Kent Overstreet 2024-01-03  204  	if ((flags & FSCK_CAN_FIX) &&
a64a37338d49a7 Kent Overstreet 2024-01-03  205  	    test_bit(err, c->sb.errors_silent))
8b16413cda7c46 Kent Overstreet 2023-12-29  206  		return -BCH_ERR_fsck_fix;
8b16413cda7c46 Kent Overstreet 2023-12-29  207  
b65db750e2bb92 Kent Overstreet 2023-10-24  208  	bch2_sb_error_count(c, err);
b65db750e2bb92 Kent Overstreet 2023-10-24  209  
9c5d38bba03425 Kent Overstreet 2023-02-16  210  	va_start(args, fmt);
9c5d38bba03425 Kent Overstreet 2023-02-16  211  	prt_vprintf(out, fmt, args);
9c5d38bba03425 Kent Overstreet 2023-02-16  212  	va_end(args);
9c5d38bba03425 Kent Overstreet 2023-02-16  213  
8e8e3bb58523eb Kent Overstreet 2024-03-28  214  	/* Custom fix/continue/recreate/etc.? */
8e8e3bb58523eb Kent Overstreet 2024-03-28  215  	if (out->buf[out->pos - 1] == '?') {
8e8e3bb58523eb Kent Overstreet 2024-03-28  216  		const char *p = strrchr(out->buf, ',');
8e8e3bb58523eb Kent Overstreet 2024-03-28  217  		if (p) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  218  			out->pos = p - out->buf;
8e8e3bb58523eb Kent Overstreet 2024-03-28  219  			action = kstrdup(p + 2, GFP_KERNEL);
8e8e3bb58523eb Kent Overstreet 2024-03-28  220  			if (!action) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  221  				ret = -ENOMEM;
8e8e3bb58523eb Kent Overstreet 2024-03-28  222  				goto err;
8e8e3bb58523eb Kent Overstreet 2024-03-28  223  			}
8e8e3bb58523eb Kent Overstreet 2024-03-28  224  		}
8e8e3bb58523eb Kent Overstreet 2024-03-28  225  	}
8e8e3bb58523eb Kent Overstreet 2024-03-28  226  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25 @227  	mutex_lock(&c->fsck_error_msgs_lock);
dbb9936b0dc905 Kent Overstreet 2022-09-25  228  	s = fsck_err_get(c, fmt);
dbb9936b0dc905 Kent Overstreet 2022-09-25  229  	if (s) {
c8d5b714114731 Kent Overstreet 2023-04-25  230  		/*
c8d5b714114731 Kent Overstreet 2023-04-25  231  		 * We may be called multiple times for the same error on
c8d5b714114731 Kent Overstreet 2023-04-25  232  		 * transaction restart - this memoizes instead of asking the user
c8d5b714114731 Kent Overstreet 2023-04-25  233  		 * multiple times for the same error:
c8d5b714114731 Kent Overstreet 2023-04-25  234  		 */
9c5d38bba03425 Kent Overstreet 2023-02-16  235  		if (s->last_msg && !strcmp(buf.buf, s->last_msg)) {
9c5d38bba03425 Kent Overstreet 2023-02-16  236  			ret = s->ret;
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  237  			mutex_unlock(&c->fsck_error_msgs_lock);
8e8e3bb58523eb Kent Overstreet 2024-03-28  238  			goto err;
9c5d38bba03425 Kent Overstreet 2023-02-16  239  		}
9c5d38bba03425 Kent Overstreet 2023-02-16  240  
9c5d38bba03425 Kent Overstreet 2023-02-16  241  		kfree(s->last_msg);
9c5d38bba03425 Kent Overstreet 2023-02-16  242  		s->last_msg = kstrdup(buf.buf, GFP_KERNEL);
8e8e3bb58523eb Kent Overstreet 2024-03-28  243  		if (!s->last_msg) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  244  			ret = -ENOMEM;
8e8e3bb58523eb Kent Overstreet 2024-03-28  245  			goto err;
8e8e3bb58523eb Kent Overstreet 2024-03-28  246  		}
9c5d38bba03425 Kent Overstreet 2023-02-16  247  
e2ee3eaab72a05 Kent Overstreet 2019-11-06  248  		if (c->opts.ratelimit_errors &&
0806151913dff8 Kent Overstreet 2021-06-21  249  		    !(flags & FSCK_NO_RATELIMIT) &&
e2ee3eaab72a05 Kent Overstreet 2019-11-06  250  		    s->nr >= FSCK_ERR_RATELIMIT_NR) {
e2ee3eaab72a05 Kent Overstreet 2019-11-06  251  			if (s->nr == FSCK_ERR_RATELIMIT_NR)
e2ee3eaab72a05 Kent Overstreet 2019-11-06  252  				suppressing = true;
e2ee3eaab72a05 Kent Overstreet 2019-11-06  253  			else
e2ee3eaab72a05 Kent Overstreet 2019-11-06  254  				print = false;
e2ee3eaab72a05 Kent Overstreet 2019-11-06  255  		}
dbb9936b0dc905 Kent Overstreet 2022-09-25  256  
dbb9936b0dc905 Kent Overstreet 2022-09-25  257  		s->nr++;
dbb9936b0dc905 Kent Overstreet 2022-09-25  258  	}
dbb9936b0dc905 Kent Overstreet 2022-09-25  259  
b2d1d56b1d34bc Kent Overstreet 2022-11-13  260  #ifdef BCACHEFS_LOG_PREFIX
dbb9936b0dc905 Kent Overstreet 2022-09-25  261  	if (!strncmp(fmt, "bcachefs:", 9))
dbb9936b0dc905 Kent Overstreet 2022-09-25  262  		prt_printf(out, bch2_log_msg(c, ""));
b2d1d56b1d34bc Kent Overstreet 2022-11-13  263  #endif
dbb9936b0dc905 Kent Overstreet 2022-09-25  264  
d55ddf6e7a81e1 Kent Overstreet 2023-12-31  265  	if (!test_bit(BCH_FS_fsck_running, &c->flags)) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  266  		if (c->opts.errors != BCH_ON_ERROR_continue ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  267  		    !(flags & (FSCK_CAN_FIX|FSCK_CAN_IGNORE))) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  268  			prt_str(out, ", shutting down");
22f51621335837 Kent Overstreet 2022-10-09  269  			inconsistent = true;
dbb9936b0dc905 Kent Overstreet 2022-09-25  270  			ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  271  		} else if (flags & FSCK_CAN_FIX) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  272  			prt_str(out, ", ");
8e8e3bb58523eb Kent Overstreet 2024-03-28  273  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  274  			ret = -BCH_ERR_fsck_fix;
dbb9936b0dc905 Kent Overstreet 2022-09-25  275  		} else {
dbb9936b0dc905 Kent Overstreet 2022-09-25  276  			prt_str(out, ", continuing");
dbb9936b0dc905 Kent Overstreet 2022-09-25  277  			ret = -BCH_ERR_fsck_ignore;
dbb9936b0dc905 Kent Overstreet 2022-09-25  278  		}
a0f8faea5f47d6 Kent Overstreet 2023-07-11  279  	} else if (c->opts.fix_errors == FSCK_FIX_exit) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  280  		prt_str(out, ", exiting");
dbb9936b0dc905 Kent Overstreet 2022-09-25  281  		ret = -BCH_ERR_fsck_errors_not_fixed;
0bc166ff564f9e Kent Overstreet 2019-03-28  282  	} else if (flags & FSCK_CAN_FIX) {
853b7393c20d5e Kent Overstreet 2023-04-15  283  		int fix = s && s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  284  			? s->fix
853b7393c20d5e Kent Overstreet 2023-04-15  285  			: c->opts.fix_errors;
853b7393c20d5e Kent Overstreet 2023-04-15  286  
a0f8faea5f47d6 Kent Overstreet 2023-07-11  287  		if (fix == FSCK_FIX_ask) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  288  			prt_str(out, ", ");
8e8e3bb58523eb Kent Overstreet 2024-03-28  289  			prt_str(out, action);
853b7393c20d5e Kent Overstreet 2023-04-15  290  
96f37eabe7a5cb Kent Overstreet 2023-12-31  291  			if (bch2_fs_stdio_redirect(c))
96f37eabe7a5cb Kent Overstreet 2023-12-31  292  				bch2_print(c, "%s", out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  293  			else
dbb9936b0dc905 Kent Overstreet 2022-09-25  294  				bch2_print_string_as_lines(KERN_ERR, out->buf);
dbb9936b0dc905 Kent Overstreet 2022-09-25  295  			print = false;
853b7393c20d5e Kent Overstreet 2023-04-15  296  
8e8e3bb58523eb Kent Overstreet 2024-03-28  297  			int ask = bch2_fsck_ask_yn(c);
853b7393c20d5e Kent Overstreet 2023-04-15  298  
853b7393c20d5e Kent Overstreet 2023-04-15  299  			if (ask >= YN_ALLNO && s)
853b7393c20d5e Kent Overstreet 2023-04-15  300  				s->fix = ask == YN_ALLNO
a0f8faea5f47d6 Kent Overstreet 2023-07-11  301  					? FSCK_FIX_no
a0f8faea5f47d6 Kent Overstreet 2023-07-11  302  					: FSCK_FIX_yes;
853b7393c20d5e Kent Overstreet 2023-04-15  303  
853b7393c20d5e Kent Overstreet 2023-04-15  304  			ret = ask & 1
dbb9936b0dc905 Kent Overstreet 2022-09-25  305  				? -BCH_ERR_fsck_fix
dbb9936b0dc905 Kent Overstreet 2022-09-25  306  				: -BCH_ERR_fsck_ignore;
a0f8faea5f47d6 Kent Overstreet 2023-07-11  307  		} else if (fix == FSCK_FIX_yes ||
1c6fdbd8f2465d Kent Overstreet 2017-03-16  308  			   (c->opts.nochanges &&
1c6fdbd8f2465d Kent Overstreet 2017-03-16  309  			    !(flags & FSCK_CAN_IGNORE))) {
8e8e3bb58523eb Kent Overstreet 2024-03-28  310  			prt_str(out, ", ");
8e8e3bb58523eb Kent Overstreet 2024-03-28  311  			prt_actioning(out, action);
dbb9936b0dc905 Kent Overstreet 2022-09-25  312  			ret = -BCH_ERR_fsck_fix;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  313  		} else {
8e8e3bb58523eb Kent Overstreet 2024-03-28  314  			prt_str(out, ", not ");
8e8e3bb58523eb Kent Overstreet 2024-03-28  315  			prt_actioning(out, action);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  316  		}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  317  	} else if (flags & FSCK_NEED_FSCK) {
dbb9936b0dc905 Kent Overstreet 2022-09-25  318  		prt_str(out, " (run fsck to correct)");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  319  	} else {
dbb9936b0dc905 Kent Overstreet 2022-09-25  320  		prt_str(out, " (repair unimplemented)");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  321  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  322  
dbb9936b0dc905 Kent Overstreet 2022-09-25  323  	if (ret == -BCH_ERR_fsck_ignore &&
a0f8faea5f47d6 Kent Overstreet 2023-07-11  324  	    (c->opts.fix_errors == FSCK_FIX_exit ||
dbb9936b0dc905 Kent Overstreet 2022-09-25  325  	     !(flags & FSCK_CAN_IGNORE)))
dbb9936b0dc905 Kent Overstreet 2022-09-25  326  		ret = -BCH_ERR_fsck_errors_not_fixed;
dbb9936b0dc905 Kent Overstreet 2022-09-25  327  
96f37eabe7a5cb Kent Overstreet 2023-12-31  328  	if (print) {
96f37eabe7a5cb Kent Overstreet 2023-12-31  329  		if (bch2_fs_stdio_redirect(c))
96f37eabe7a5cb Kent Overstreet 2023-12-31  330  			bch2_print(c, "%s\n", out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  331  		else
dbb9936b0dc905 Kent Overstreet 2022-09-25  332  			bch2_print_string_as_lines(KERN_ERR, out->buf);
96f37eabe7a5cb Kent Overstreet 2023-12-31  333  	}
dbb9936b0dc905 Kent Overstreet 2022-09-25  334  
d55ddf6e7a81e1 Kent Overstreet 2023-12-31  335  	if (test_bit(BCH_FS_fsck_running, &c->flags) &&
dbb9936b0dc905 Kent Overstreet 2022-09-25  336  	    (ret != -BCH_ERR_fsck_fix &&
dbb9936b0dc905 Kent Overstreet 2022-09-25  337  	     ret != -BCH_ERR_fsck_ignore))
dbb9936b0dc905 Kent Overstreet 2022-09-25  338  		bch_err(c, "Unable to continue, halting");
dbb9936b0dc905 Kent Overstreet 2022-09-25  339  	else if (suppressing)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  340  		bch_err(c, "Ratelimiting new instances of previous error");
1c6fdbd8f2465d Kent Overstreet 2017-03-16  341  
9c5d38bba03425 Kent Overstreet 2023-02-16  342  	if (s)
9c5d38bba03425 Kent Overstreet 2023-02-16  343  		s->ret = ret;
9c5d38bba03425 Kent Overstreet 2023-02-16  344  
f5d26fa31ed2e2 Kent Overstreet 2023-10-25  345  	mutex_unlock(&c->fsck_error_msgs_lock);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  346  
22f51621335837 Kent Overstreet 2022-10-09  347  	if (inconsistent)
22f51621335837 Kent Overstreet 2022-10-09  348  		bch2_inconsistent_error(c);
22f51621335837 Kent Overstreet 2022-10-09  349  
dbb9936b0dc905 Kent Overstreet 2022-09-25  350  	if (ret == -BCH_ERR_fsck_fix) {
3c471b65889aa2 Kent Overstreet 2023-11-26  351  		set_bit(BCH_FS_errors_fixed, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  352  	} else {
3c471b65889aa2 Kent Overstreet 2023-11-26  353  		set_bit(BCH_FS_errors_not_fixed, &c->flags);
3c471b65889aa2 Kent Overstreet 2023-11-26  354  		set_bit(BCH_FS_error, &c->flags);
0bc166ff564f9e Kent Overstreet 2019-03-28  355  	}
8e8e3bb58523eb Kent Overstreet 2024-03-28  356  err:
8e8e3bb58523eb Kent Overstreet 2024-03-28  357  	if (action != action_orig)
8e8e3bb58523eb Kent Overstreet 2024-03-28  358  		kfree(action);
8e8e3bb58523eb Kent Overstreet 2024-03-28  359  	printbuf_exit(&buf);
dbb9936b0dc905 Kent Overstreet 2022-09-25 @360  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  361  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  362  

:::::: The code at line 360 was first introduced by commit
:::::: dbb9936b0dc905657db6e5289be18e425f1b60d3 bcachefs: Improve bch2_fsck_err()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
