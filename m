Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135EF7082C
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Oct 2024 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730026148; cv=none; b=lpXfFBnpRPsMmiH9l+xk0dMlebV+l3a3zUK6exCQwoL4OM741ObzCD+95j9eL6bu2Ixb/7IFT3yl2w0Wo3dBsqTW7HsFFGwbhOr0n+SAh7Ql5ZgV8EaDzGUPpYwjVVON15Z3abYvTPZrjheeDEFyjVT0/CZNjejEilhznB3fIRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730026148; c=relaxed/simple;
	bh=UtqLI/5qCCXXPYZ7dJCq4NCWhNA1r49lD2xYc+lKVsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHeqFg6D/pIFmTGPp51S8j5L5BuOzEKa/pu+GsP7HN2PVcjWmpymZxirRvvmEArphHKqi3KPqrQQo/sthtW+1SBdE/IbxFi95wqTyp1QkyVavY4otwlKemO8VftTmag5Jv3SURLdcLxvOc5WZOH0BCR7q0k79ZkoyMWuTi5IvQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0REhYe/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0REhYe/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730026145; x=1761562145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UtqLI/5qCCXXPYZ7dJCq4NCWhNA1r49lD2xYc+lKVsM=;
  b=X0REhYe/hZazcWfNn+b9zls+qP2nJJYN6h8GJGUbFHO3K1vdcekr58ew
   0GrzikVGmcL2ye5Y64Ywg554icfy6rGGNsInWdkUh61jVXsEtA0YhFzXZ
   Yd1esGH9ikF2pdwO1iDJksYY47rXi6VHq6QhuRFFnbW8TJIvo7vbiyULK
   vwbN6HAe1WCVPxXExDGmRak0RuDnU8vQfa3Oj/CW40Xv+6LOgaitQ49Lu
   laOPZCMENeXVDuXR0csoOOkihsw8uY5kKpj7YBpXa+rGmbAaCN3ZSslAS
   pJKxTF9hRGg1XSY8j5kvHMlQjyh087tfz7P4uGZ+q20hJ51naJ3gnRes/
   g==;
X-CSE-ConnectionGUID: CIiC3BbeTYW7Zrx4Pw185g==
X-CSE-MsgGUID: WUQUHczATHqayF8eYpyItg==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="33552312"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="33552312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 03:49:04 -0700
X-CSE-ConnectionGUID: 2SeVqhe+RMa/0JbS3EhW6w==
X-CSE-MsgGUID: np4jpZXXQnCuCqjdnS6Bmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="81666918"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2024 03:49:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t50pQ-000ad6-1H;
	Sun, 27 Oct 2024 10:49:00 +0000
Date: Sun, 27 Oct 2024 18:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jpoimboe:sframe 11/20] kernel/unwind/user.c:78 unwind_user_next()
 error: uninitialized symbol 'ret'.
Message-ID: <202410271820.7yFzLFqs-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   a6a5b6724f859f25dbab8402cfe47a695bc719b3
commit: 389362462e2cfd21bed4b33d8336c24973166b5b [11/20] unwind: Add deferred userspace unwinding API
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271820.7yFzLFqs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410271820.7yFzLFqs-lkp@intel.com/

smatch warnings:
kernel/unwind/user.c:78 unwind_user_next() error: uninitialized symbol 'ret'.
kernel/unwind/user.c:140 unwind_user_deferred() warn: unsigned 'idx' is never less than zero.
kernel/unwind/user.c:213 unwind_user_task_work() error: uninitialized symbol 'cookie'.

vim +/ret +78 kernel/unwind/user.c

389362462e2cfd Josh Poimboeuf 2024-09-16   28  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   29  int unwind_user_next(struct unwind_user_state *state)
de711b1e7fe245 Josh Poimboeuf 2024-09-16   30  {
de711b1e7fe245 Josh Poimboeuf 2024-09-16   31  	struct unwind_user_frame _frame;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   32  	struct unwind_user_frame *frame = &_frame;
389362462e2cfd Josh Poimboeuf 2024-09-16   33  	unsigned long prev_ip, cfa, fp, ra = 0;
389362462e2cfd Josh Poimboeuf 2024-09-16   34  	int ret;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   35  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   36  	if (state->done)
de711b1e7fe245 Josh Poimboeuf 2024-09-16   37  		return -EINVAL;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   38  
389362462e2cfd Josh Poimboeuf 2024-09-16   39  	prev_ip = state->ip;
389362462e2cfd Josh Poimboeuf 2024-09-16   40  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   41  	switch (state->type) {
de711b1e7fe245 Josh Poimboeuf 2024-09-16   42  	case UNWIND_USER_TYPE_FP:
de711b1e7fe245 Josh Poimboeuf 2024-09-16   43  		frame = &fp_frame;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   44  		break;
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   45  	case UNWIND_USER_TYPE_SFRAME:
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   46  		ret = sframe_find(state->ip, frame);
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   47  		if (ret)
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   48  			goto the_end;
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   49  		break;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   50  	default:
de711b1e7fe245 Josh Poimboeuf 2024-09-16   51  		BUG();
de711b1e7fe245 Josh Poimboeuf 2024-09-16   52  	}
de711b1e7fe245 Josh Poimboeuf 2024-09-16   53  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   54  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   55  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   56  	if (frame->ra_off && get_user(ra, (unsigned long __user *)(cfa + frame->ra_off)))
de711b1e7fe245 Josh Poimboeuf 2024-09-16   57  		goto the_end;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   58  
389362462e2cfd Josh Poimboeuf 2024-09-16   59  	if (ra == prev_ip) {
389362462e2cfd Josh Poimboeuf 2024-09-16   60  		ret = -EINVAL;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   61  		goto the_end;
389362462e2cfd Josh Poimboeuf 2024-09-16   62  	}
389362462e2cfd Josh Poimboeuf 2024-09-16   63  
389362462e2cfd Josh Poimboeuf 2024-09-16   64  	if (frame->fp_off && get_user(fp, (unsigned long __user *)(cfa + frame->fp_off))) {
389362462e2cfd Josh Poimboeuf 2024-09-16   65  		ret = -EINVAL;
389362462e2cfd Josh Poimboeuf 2024-09-16   66  		goto the_end;
389362462e2cfd Josh Poimboeuf 2024-09-16   67  	}
de711b1e7fe245 Josh Poimboeuf 2024-09-16   68  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   69  	state->sp = cfa;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   70  	state->ip = ra;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   71  	if (frame->fp_off)
de711b1e7fe245 Josh Poimboeuf 2024-09-16   72  		state->fp = fp;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   73  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   74  	return 0;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   75  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   76  the_end:
de711b1e7fe245 Josh Poimboeuf 2024-09-16   77  	state->done = true;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  @78  	return ret;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   79  }
de711b1e7fe245 Josh Poimboeuf 2024-09-16   80  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   81  int unwind_user_start(struct unwind_user_state *state)
de711b1e7fe245 Josh Poimboeuf 2024-09-16   82  {
de711b1e7fe245 Josh Poimboeuf 2024-09-16   83  	struct pt_regs *regs = task_pt_regs(current);
de711b1e7fe245 Josh Poimboeuf 2024-09-16   84  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   85  	memset(state, 0, sizeof(*state));
de711b1e7fe245 Josh Poimboeuf 2024-09-16   86  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   87  	if (!current->mm) {
de711b1e7fe245 Josh Poimboeuf 2024-09-16   88  		state->done = true;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   89  		return -EINVAL;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   90  	}
de711b1e7fe245 Josh Poimboeuf 2024-09-16   91  
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   92  	if (current_has_sframe())
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   93  		state->type = UNWIND_USER_TYPE_SFRAME;
9532f4aa18dfb4 Josh Poimboeuf 2024-09-16   94  	else
de711b1e7fe245 Josh Poimboeuf 2024-09-16   95  		state->type = UNWIND_USER_TYPE_FP;
de711b1e7fe245 Josh Poimboeuf 2024-09-16   96  
de711b1e7fe245 Josh Poimboeuf 2024-09-16   97  	state->sp = user_stack_pointer(regs);
de711b1e7fe245 Josh Poimboeuf 2024-09-16   98  	state->ip = instruction_pointer(regs);
de711b1e7fe245 Josh Poimboeuf 2024-09-16   99  	state->fp = frame_pointer(regs);
de711b1e7fe245 Josh Poimboeuf 2024-09-16  100  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  101  	return 0;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  102  }
de711b1e7fe245 Josh Poimboeuf 2024-09-16  103  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  104  int unwind_user(struct unwind_stacktrace *trace, unsigned int max_entries)
de711b1e7fe245 Josh Poimboeuf 2024-09-16  105  {
de711b1e7fe245 Josh Poimboeuf 2024-09-16  106  	struct unwind_user_state state;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  107  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  108  	trace->nr = 0;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  109  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  110  	if (!max_entries)
de711b1e7fe245 Josh Poimboeuf 2024-09-16  111  		return -EINVAL;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  112  
389362462e2cfd Josh Poimboeuf 2024-09-16  113  	if (!current->mm)
389362462e2cfd Josh Poimboeuf 2024-09-16  114  		return 0;
389362462e2cfd Josh Poimboeuf 2024-09-16  115  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  116  	for_each_user_frame(&state) {
de711b1e7fe245 Josh Poimboeuf 2024-09-16  117  		trace->entries[trace->nr++] = state.ip;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  118  		if (trace->nr >= max_entries)
de711b1e7fe245 Josh Poimboeuf 2024-09-16  119  			break;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  120  	}
de711b1e7fe245 Josh Poimboeuf 2024-09-16  121  
de711b1e7fe245 Josh Poimboeuf 2024-09-16  122  	return 0;
de711b1e7fe245 Josh Poimboeuf 2024-09-16  123  }
389362462e2cfd Josh Poimboeuf 2024-09-16  124  
389362462e2cfd Josh Poimboeuf 2024-09-16  125  static u64 ctx_to_cookie(u64 cpu, u64 ctx)
389362462e2cfd Josh Poimboeuf 2024-09-16  126  {
389362462e2cfd Josh Poimboeuf 2024-09-16  127  	BUILD_BUG_ON(NR_CPUS > 65535);
389362462e2cfd Josh Poimboeuf 2024-09-16  128  	return (ctx & ((1UL << 48) - 1)) | cpu;
389362462e2cfd Josh Poimboeuf 2024-09-16  129  }
389362462e2cfd Josh Poimboeuf 2024-09-16  130  
389362462e2cfd Josh Poimboeuf 2024-09-16  131  int unwind_user_deferred(struct unwind_callback *callback, u64 *ctx_cookie, void *data)
389362462e2cfd Josh Poimboeuf 2024-09-16  132  {
389362462e2cfd Josh Poimboeuf 2024-09-16  133  	struct unwind_user_info *info = &current->unwind_user_info;
389362462e2cfd Josh Poimboeuf 2024-09-16  134  	u64 cookie = info->ctx_cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  135  	u32 idx = callback->idx;
389362462e2cfd Josh Poimboeuf 2024-09-16  136  
389362462e2cfd Josh Poimboeuf 2024-09-16  137  	if (WARN_ON_ONCE(in_nmi() || !irqs_disabled()))
389362462e2cfd Josh Poimboeuf 2024-09-16  138  		return -EINVAL;
389362462e2cfd Josh Poimboeuf 2024-09-16  139  
389362462e2cfd Josh Poimboeuf 2024-09-16 @140  	if (WARN_ON_ONCE(!callback->func || idx < 0))
389362462e2cfd Josh Poimboeuf 2024-09-16  141  		return -EINVAL;
389362462e2cfd Josh Poimboeuf 2024-09-16  142  
389362462e2cfd Josh Poimboeuf 2024-09-16  143  	if (!current->mm)
389362462e2cfd Josh Poimboeuf 2024-09-16  144  		return -EINVAL;
389362462e2cfd Josh Poimboeuf 2024-09-16  145  
389362462e2cfd Josh Poimboeuf 2024-09-16  146  	if (cookie && (info->pending_callbacks & (1 << idx)))
389362462e2cfd Josh Poimboeuf 2024-09-16  147  		goto done;
389362462e2cfd Josh Poimboeuf 2024-09-16  148  
389362462e2cfd Josh Poimboeuf 2024-09-16  149  	if (!cookie) {
389362462e2cfd Josh Poimboeuf 2024-09-16  150  		u64 ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
389362462e2cfd Josh Poimboeuf 2024-09-16  151  		u64 cpu = raw_smp_processor_id();
389362462e2cfd Josh Poimboeuf 2024-09-16  152  
389362462e2cfd Josh Poimboeuf 2024-09-16  153  		cookie = ctx_to_cookie(cpu, ctx_ctr);
389362462e2cfd Josh Poimboeuf 2024-09-16  154  
389362462e2cfd Josh Poimboeuf 2024-09-16  155  		// TODO: this may miss - that's ok, just duplicate
389362462e2cfd Josh Poimboeuf 2024-09-16  156  		if (cookie == info->last_cookies[idx])
389362462e2cfd Josh Poimboeuf 2024-09-16  157  			goto done;
389362462e2cfd Josh Poimboeuf 2024-09-16  158  
389362462e2cfd Josh Poimboeuf 2024-09-16  159  		info->ctx_cookie = cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  160  		task_work_add(current, &info->work, TWA_RESUME);
389362462e2cfd Josh Poimboeuf 2024-09-16  161  	}
389362462e2cfd Josh Poimboeuf 2024-09-16  162  
389362462e2cfd Josh Poimboeuf 2024-09-16  163  	info->pending_callbacks |= (1 << idx);
389362462e2cfd Josh Poimboeuf 2024-09-16  164  	info->privs[idx] = data;
389362462e2cfd Josh Poimboeuf 2024-09-16  165  	info->last_cookies[idx] = cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  166  
389362462e2cfd Josh Poimboeuf 2024-09-16  167  done:
389362462e2cfd Josh Poimboeuf 2024-09-16  168  	if (ctx_cookie)
389362462e2cfd Josh Poimboeuf 2024-09-16  169  		*ctx_cookie = cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  170  	return 0;
389362462e2cfd Josh Poimboeuf 2024-09-16  171  }
389362462e2cfd Josh Poimboeuf 2024-09-16  172  
389362462e2cfd Josh Poimboeuf 2024-09-16  173  static void unwind_user_task_work(struct callback_head *unused)
389362462e2cfd Josh Poimboeuf 2024-09-16  174  {
389362462e2cfd Josh Poimboeuf 2024-09-16  175  	struct unwind_user_info *info = &current->unwind_user_info;
389362462e2cfd Josh Poimboeuf 2024-09-16  176  	struct unwind_stacktrace trace;
389362462e2cfd Josh Poimboeuf 2024-09-16  177  	unsigned long pending_callbacks;
389362462e2cfd Josh Poimboeuf 2024-09-16  178  	u64 cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  179  	u64 cpu, ctx_ctr;
389362462e2cfd Josh Poimboeuf 2024-09-16  180  	int i;
389362462e2cfd Josh Poimboeuf 2024-09-16  181  
389362462e2cfd Josh Poimboeuf 2024-09-16  182  	BUILD_BUG_ON(UNWIND_MAX_CALLBACKS > 32);
389362462e2cfd Josh Poimboeuf 2024-09-16  183  
389362462e2cfd Josh Poimboeuf 2024-09-16  184  	if (WARN_ON_ONCE(!info->ctx_cookie || !info->pending_callbacks))
389362462e2cfd Josh Poimboeuf 2024-09-16  185  		return;
389362462e2cfd Josh Poimboeuf 2024-09-16  186  
389362462e2cfd Josh Poimboeuf 2024-09-16  187  	scoped_guard(irqsave) {
389362462e2cfd Josh Poimboeuf 2024-09-16  188  		pending_callbacks = info->pending_callbacks;
389362462e2cfd Josh Poimboeuf 2024-09-16  189  		cookie = info->ctx_cookie;
389362462e2cfd Josh Poimboeuf 2024-09-16  190  
389362462e2cfd Josh Poimboeuf 2024-09-16  191  		info->pending_callbacks = 0;
389362462e2cfd Josh Poimboeuf 2024-09-16  192  		info->ctx_cookie = 0;
389362462e2cfd Josh Poimboeuf 2024-09-16  193  
389362462e2cfd Josh Poimboeuf 2024-09-16  194  		cpu = raw_smp_processor_id();
389362462e2cfd Josh Poimboeuf 2024-09-16  195  		ctx_ctr = __this_cpu_read(unwind_ctx_ctr);
389362462e2cfd Josh Poimboeuf 2024-09-16  196  	}
389362462e2cfd Josh Poimboeuf 2024-09-16  197  
389362462e2cfd Josh Poimboeuf 2024-09-16  198  	if (!info->entries) {
389362462e2cfd Josh Poimboeuf 2024-09-16  199  		info->entries = kmalloc(UNWIND_MAX_ENTRIES * sizeof(long),
389362462e2cfd Josh Poimboeuf 2024-09-16  200  					GFP_KERNEL);
389362462e2cfd Josh Poimboeuf 2024-09-16  201  		if (!info->entries)
389362462e2cfd Josh Poimboeuf 2024-09-16  202  			return;
389362462e2cfd Josh Poimboeuf 2024-09-16  203  	}
389362462e2cfd Josh Poimboeuf 2024-09-16  204  
389362462e2cfd Josh Poimboeuf 2024-09-16  205  	trace.entries = info->entries;
389362462e2cfd Josh Poimboeuf 2024-09-16  206  	trace.nr = 0;
389362462e2cfd Josh Poimboeuf 2024-09-16  207  	unwind_user(&trace, UNWIND_MAX_ENTRIES);
389362462e2cfd Josh Poimboeuf 2024-09-16  208  
389362462e2cfd Josh Poimboeuf 2024-09-16  209  	guard(rwsem_read)(&callbacks_rwsem);
389362462e2cfd Josh Poimboeuf 2024-09-16  210  
389362462e2cfd Josh Poimboeuf 2024-09-16  211  	for_each_set_bit(i, &pending_callbacks, UNWIND_MAX_CALLBACKS) {
389362462e2cfd Josh Poimboeuf 2024-09-16  212  		if (callbacks[i])
389362462e2cfd Josh Poimboeuf 2024-09-16 @213  			callbacks[i]->func(&trace, cookie, info->privs[i]);
389362462e2cfd Josh Poimboeuf 2024-09-16  214  	}
389362462e2cfd Josh Poimboeuf 2024-09-16  215  }
389362462e2cfd Josh Poimboeuf 2024-09-16  216  

:::::: The code at line 78 was first introduced by commit
:::::: de711b1e7fe24512bf5cf4e1297f4141d95dc274 unwind: Add userspace unwinding API

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
