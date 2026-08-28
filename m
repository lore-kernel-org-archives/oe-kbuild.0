Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361EF3DAAA6
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Aug 2026 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916164; cv=none; b=u3mXTunTLO6Z3Irl1U7dAEZ0ys+oe8YPPMYWzFrdEBLI2YQ8fUcRHtR44udSCd6wpuQB0KD/SE1fzINr1HSCRIYsinF0SpbEib2aS4d3mDkkI4BOB9Y6T7TPM4Y5aAb1dfRr6OO8uiBB3d/tSVO9FVmXyXJWga4NClAEotaqPWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916164; c=relaxed/simple;
	bh=3HAbX7ixpCvbTlP8R1Wornaf+BhTpH/ho7Sx7zU0c+Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EuhiokMN4AMLd4tT5j2Lfhq0nfgcudoTloRlGBVO1fQ/4Yhn50SWXfZuROJFkMXdM9bgiwjmTbciYe6PFPcCcqG7KuXvK4vVYqv0UMhc1plnfAooIa+7qoKm1ZMA+bCE6zpTPrgTNKGbLDTnDYylVdjUYEop/Fokl1SUm/Rb7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZbAun0K9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZbAun0K9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787916162; x=1819452162;
  h=date:from:to:cc:subject:message-id;
  bh=3HAbX7ixpCvbTlP8R1Wornaf+BhTpH/ho7Sx7zU0c+Y=;
  b=ZbAun0K9RJKzMzh6vYfQnyoHq1UoBsu1aihxdVEvKqBbWGKCad6Vbnf7
   96wdzgaCgJPCwYHji8f+9G/Q98lG0hUiXS/g0swsJW31NlyDxStp1EBsL
   hjptTh0fm+tPbD3kbswjq8zH/mnliesax9u756199+gzPf0ph+MT92ZK3
   ZI5TwazZSLc7l09k+6qvbRqCPdTJoxmlS652O07N/OzxtiqNy/93Ua3TR
   tYTwk7YH/amHUGF/wZoJD7NlLOCo45fhMKSq6mNEUMQTaa+UqBI/QZPBo
   caTU5m+n8I0JhkuFg8cSJPMlEZt8zTz/KZPUybj7v+JrxYtFxEKUS4yQX
   g==;
X-CSE-ConnectionGUID: mPDBNxx6QoOwhEmBAGRe3Q==
X-CSE-MsgGUID: e+lbkeIITSix/ZtjiaJohQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88449664"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88449664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 04:22:41 -0700
X-CSE-ConnectionGUID: 199eBGPDQaC6XSPQSV4bYQ==
X-CSE-MsgGUID: 9zs9ilbORkSLe6ErlkK8aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="272348017"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Aug 2026 04:22:40 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzufO-00000000AxJ-11cv;
	Fri, 28 Aug 2026 11:22:38 +0000
Date: Fri, 28 Aug 2026 19:22:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpirko-mlxsw:wip_ctlv_pre_rfc_draft1 5/9]
 drivers/ctlv/core.c:845 ctlv_op_exec() warn: missing unwind goto?
Message-ID: <202608281950.7Qfe3qeH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jiri Pirko <jiri@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw wip_ctlv_pre_rfc_draft1
head:   4eda7d4542d069851be1ad674bf0cdc69bbb9dad
commit: c409a67efc51991693868510e18e38856c709009 [5/9] ctlv: Add the framework
:::::: branch date: 24 hours ago
:::::: commit date: 26 hours ago
config: sparc-randconfig-r073-20260828 (https://download.01.org/0day-ci/archive/20260828/202608281950.7Qfe3qeH-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608281950.7Qfe3qeH-lkp@intel.com/

smatch warnings:
drivers/ctlv/core.c:845 ctlv_op_exec() warn: missing unwind goto?

vim +845 drivers/ctlv/core.c

c409a67efc5199 Jiri Pirko 2026-08-26  765  
c409a67efc5199 Jiri Pirko 2026-08-26  766  /*
c409a67efc5199 Jiri Pirko 2026-08-26  767   * Everything that needs the device to still have a family. @reply is built
c409a67efc5199 Jiri Pirko 2026-08-26  768   * here and becomes the caller's to free, to copy out once the family is gone.
c409a67efc5199 Jiri Pirko 2026-08-26  769   */
c409a67efc5199 Jiri Pirko 2026-08-26  770  static int ctlv_op_exec(struct ctlv_file *cfile, struct file *filp,
c409a67efc5199 Jiri Pirko 2026-08-26  771  			struct ctlv_op_exec *exec, void **reply,
c409a67efc5199 Jiri Pirko 2026-08-26  772  			u32 *reply_len)
c409a67efc5199 Jiri Pirko 2026-08-26  773  {
c409a67efc5199 Jiri Pirko 2026-08-26  774  	struct ctlv_device *ctlvdev = cfile->ctlvdev;
c409a67efc5199 Jiri Pirko 2026-08-26  775  	const struct ctlv_op_entry *op;
c409a67efc5199 Jiri Pirko 2026-08-26  776  	struct ctlv_op_ctx ctx = {};
c409a67efc5199 Jiri Pirko 2026-08-26  777  	struct ctlv_attr empty;
c409a67efc5199 Jiri Pirko 2026-08-26  778  	u32 capacity;
c409a67efc5199 Jiri Pirko 2026-08-26  779  	int ret;
c409a67efc5199 Jiri Pirko 2026-08-26  780  
c409a67efc5199 Jiri Pirko 2026-08-26  781  	/* No family numbers an op zero, so a zero here is an unset field. */
c409a67efc5199 Jiri Pirko 2026-08-26  782  	if (!exec->op_id)
c409a67efc5199 Jiri Pirko 2026-08-26  783  		return -EINVAL;
c409a67efc5199 Jiri Pirko 2026-08-26  784  	op = ctlv_op_find(ctlvdev, exec->op_id);
c409a67efc5199 Jiri Pirko 2026-08-26  785  	if (!op)
c409a67efc5199 Jiri Pirko 2026-08-26  786  		return -EOPNOTSUPP;
c409a67efc5199 Jiri Pirko 2026-08-26  787  	ret = ctlv_op_check_mode(filp, op);
c409a67efc5199 Jiri Pirko 2026-08-26  788  	if (ret)
c409a67efc5199 Jiri Pirko 2026-08-26  789  		return ret;
c409a67efc5199 Jiri Pirko 2026-08-26  790  	/*
c409a67efc5199 Jiri Pirko 2026-08-26  791  	 * Only a query resumes. A cursor says which fragment this is, so a
c409a67efc5199 Jiri Pirko 2026-08-26  792  	 * generation without one continues what was never started.
c409a67efc5199 Jiri Pirko 2026-08-26  793  	 */
c409a67efc5199 Jiri Pirko 2026-08-26  794  	if (op->schema->type == CTLV_OP_TYPE_QUERY) {
c409a67efc5199 Jiri Pirko 2026-08-26  795  		if (!exec->cursor && exec->generation)
c409a67efc5199 Jiri Pirko 2026-08-26  796  			return -EINVAL;
c409a67efc5199 Jiri Pirko 2026-08-26  797  		ctx.frag.generation = exec->generation;
c409a67efc5199 Jiri Pirko 2026-08-26  798  		ctx.frag.cursor = exec->cursor;
c409a67efc5199 Jiri Pirko 2026-08-26  799  	} else if (exec->generation || exec->cursor) {
c409a67efc5199 Jiri Pirko 2026-08-26  800  		return -EINVAL;
c409a67efc5199 Jiri Pirko 2026-08-26  801  	}
c409a67efc5199 Jiri Pirko 2026-08-26  802  
c409a67efc5199 Jiri Pirko 2026-08-26  803  	/* Before the callback, so a buffer too small mutates nothing. */
c409a67efc5199 Jiri Pirko 2026-08-26  804  	if (exec->reply_len < ctlv_reply_needed(op))
c409a67efc5199 Jiri Pirko 2026-08-26  805  		return -EMSGSIZE;
c409a67efc5199 Jiri Pirko 2026-08-26  806  	/* And no longer than a message of this framework may be. */
c409a67efc5199 Jiri Pirko 2026-08-26  807  	if (exec->reply_len > CTLV_MAX_INLINE_MESSAGE_LEN)
c409a67efc5199 Jiri Pirko 2026-08-26  808  		return -EINVAL;
c409a67efc5199 Jiri Pirko 2026-08-26  809  
c409a67efc5199 Jiri Pirko 2026-08-26  810  	ctx.ctlvdev = ctlvdev;
c409a67efc5199 Jiri Pirko 2026-08-26  811  	ctx.leaf = ctlvdev->family->schema;
c409a67efc5199 Jiri Pirko 2026-08-26  812  	ctx.file = cfile;
c409a67efc5199 Jiri Pirko 2026-08-26  813  	/* Whose memory a blob descriptor of this request describes. */
c409a67efc5199 Jiri Pirko 2026-08-26  814  	ctx.submitter = current;
c409a67efc5199 Jiri Pirko 2026-08-26  815  	ctx.op = op;
c409a67efc5199 Jiri Pirko 2026-08-26  816  
c409a67efc5199 Jiri Pirko 2026-08-26  817  	void *snapshot __free(kvfree) = NULL;
c409a67efc5199 Jiri Pirko 2026-08-26  818  	void *out __free(kvfree) = NULL;
c409a67efc5199 Jiri Pirko 2026-08-26  819  
c409a67efc5199 Jiri Pirko 2026-08-26  820  	if (exec->request_len) {
c409a67efc5199 Jiri Pirko 2026-08-26  821  		if (exec->request_len < sizeof(struct ctlv_attr) ||
c409a67efc5199 Jiri Pirko 2026-08-26  822  		    exec->request_len > CTLV_MAX_INLINE_MESSAGE_LEN)
c409a67efc5199 Jiri Pirko 2026-08-26  823  			return -EINVAL;
c409a67efc5199 Jiri Pirko 2026-08-26  824  		/* Everything after this reads the snapshot, never userspace. */
c409a67efc5199 Jiri Pirko 2026-08-26  825  		snapshot = kvmalloc(exec->request_len, GFP_KERNEL_ACCOUNT);
c409a67efc5199 Jiri Pirko 2026-08-26  826  		if (!snapshot)
c409a67efc5199 Jiri Pirko 2026-08-26  827  			return -ENOMEM;
c409a67efc5199 Jiri Pirko 2026-08-26  828  		if (copy_from_user(snapshot, u64_to_user_ptr(exec->request),
c409a67efc5199 Jiri Pirko 2026-08-26  829  				   exec->request_len))
c409a67efc5199 Jiri Pirko 2026-08-26  830  			return -EFAULT;
c409a67efc5199 Jiri Pirko 2026-08-26  831  	}
c409a67efc5199 Jiri Pirko 2026-08-26  832  	/* Before any hook, so that no family code sees an unchecked attr. */
c409a67efc5199 Jiri Pirko 2026-08-26  833  	ret = ctlv_request_validate(&ctx, exec, snapshot, &empty);
c409a67efc5199 Jiri Pirko 2026-08-26  834  	if (ret)
c409a67efc5199 Jiri Pirko 2026-08-26  835  		goto out_error_info;
c409a67efc5199 Jiri Pirko 2026-08-26  836  
c409a67efc5199 Jiri Pirko 2026-08-26  837  	capacity = ctlv_reply_capacity(op, exec);
c409a67efc5199 Jiri Pirko 2026-08-26  838  	if (capacity) {
c409a67efc5199 Jiri Pirko 2026-08-26  839  		/*
c409a67efc5199 Jiri Pirko 2026-08-26  840  		 * Not zeroed: a byte is copied out only once the root's
c409a67efc5199 Jiri Pirko 2026-08-26  841  		 * length covers it, padding included.
c409a67efc5199 Jiri Pirko 2026-08-26  842  		 */
c409a67efc5199 Jiri Pirko 2026-08-26  843  		out = kvmalloc(capacity, GFP_KERNEL_ACCOUNT);
c409a67efc5199 Jiri Pirko 2026-08-26  844  		if (!out)
c409a67efc5199 Jiri Pirko 2026-08-26 @845  			return -ENOMEM;
c409a67efc5199 Jiri Pirko 2026-08-26  846  		ctlv_msg_output(&ctx.output, &ctx, out, capacity,
c409a67efc5199 Jiri Pirko 2026-08-26  847  				&op->schema->reply);
c409a67efc5199 Jiri Pirko 2026-08-26  848  		ctlv_msg_root(&ctx.output_root, &ctx.output);
c409a67efc5199 Jiri Pirko 2026-08-26  849  		ctx.deepest = &ctx.output_root;
c409a67efc5199 Jiri Pirko 2026-08-26  850  	}
c409a67efc5199 Jiri Pirko 2026-08-26  851  
c409a67efc5199 Jiri Pirko 2026-08-26  852  	ret = ctlv_op_dispatch(&ctx);
c409a67efc5199 Jiri Pirko 2026-08-26  853  	if (ret)
c409a67efc5199 Jiri Pirko 2026-08-26  854  		goto out_error_info;
c409a67efc5199 Jiri Pirko 2026-08-26  855  
c409a67efc5199 Jiri Pirko 2026-08-26  856  	/* Where the caller carries on from, zero for anything but a query. */
c409a67efc5199 Jiri Pirko 2026-08-26  857  	exec->generation = ctx.frag.reported;
c409a67efc5199 Jiri Pirko 2026-08-26  858  	exec->cursor = ctx.frag.next_cursor;
c409a67efc5199 Jiri Pirko 2026-08-26  859  	*reply_len = ctx.output.root ? ctx.output.root->len : 0;
c409a67efc5199 Jiri Pirko 2026-08-26  860  	*reply = no_free_ptr(out);
c409a67efc5199 Jiri Pirko 2026-08-26  861  	return 0;
c409a67efc5199 Jiri Pirko 2026-08-26  862  
c409a67efc5199 Jiri Pirko 2026-08-26  863  out_error_info:
c409a67efc5199 Jiri Pirko 2026-08-26  864  	ctlv_error_info(&ctx, exec->reply_len, reply, reply_len);
c409a67efc5199 Jiri Pirko 2026-08-26  865  	return ret;
c409a67efc5199 Jiri Pirko 2026-08-26  866  }
c409a67efc5199 Jiri Pirko 2026-08-26  867  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
