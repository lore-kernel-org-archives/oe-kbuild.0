Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB9E17CA1B
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 08:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104389; cv=none; b=Boux7LA1U9AzSfJWNcVCeT2pCn+4RDsKCywuai14ohJbLyTSgezwdIFHWrg4JrKhyLysU1t61PhX8IaQuXmcplKkMxgIXpcBh24dJR97FTaBZPmG8yWTsnfwSceA5B5X01dfw6AdQqE/YsW4KIHmRM7O3neGv8CIj4tC9m7yw5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104389; c=relaxed/simple;
	bh=+shj6A+kX8FFfuZY2jklioY30+ZndpOmmIBj/2E/WC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=noO/l5vkzhJK+Xtiq7TB0TtWqpwF8Mufv4V1cYVOzHmUDtOFLtNKgcQNzvq+EPr7rnFlmU1lcG3YhtOBPX8l8qysLugCgEPCAxqlMnsvQE4jznkMpiCmGu9C1szoghr2PiObS7t9hFGVpVMwXAgS/ImF8RS4h99Uz7kh5ffQ+x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+GJ8+DO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+GJ8+DO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4314c452180so34091425e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 01:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104384; x=1730709184; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u48dJ1t7DXU2jstcAt9l/Lx66dBUXNbaTMKUit1v10s=;
        b=s+GJ8+DOngU76XOHOFZToYuMmNyWOCe58uc49NkYrVhev1SEDxeEAl8Ah/rNhhOxO3
         H8oSEUYO81CInF4x2dHiSANIC+0nxZwboeCj4UvW0kY7whei4QmxmO9RfBMbf0JC0Hh8
         x8yclTDBfhAUhF3QhlhudmzzHjQlZDC9RW4dqDQhA77l3hTbUkxdEPP/wK9DSAFUHbfs
         LlOuTd56+CpemI4TwVJaePMXAriKsfDsiIIBkBTr18cjMeDvj6YT9VQyxjapxbT2DLdv
         CnNNo27bTdajth8HEJyPA3tbbkSipnPQGR6C0exvNltS6DrcdoqR8vt3VBK0nvJu7MIH
         +6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104384; x=1730709184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u48dJ1t7DXU2jstcAt9l/Lx66dBUXNbaTMKUit1v10s=;
        b=Y70tDjbmSSWlVhzQSxmNVWIgkczMFJTXTW16xTekZ8b1JN/XrmceOwtmok0MSMtMQr
         QJtEuocCJoR21b59nO/qsIkzGP14qdrQsxLc279343Hz5hREX2NZkurMCce6EnSBJRMt
         sLxwICDSUPWmcKLExKAEtAbxsiEWlg5eoeNb4xh3T/6t8Jas8R27Ekg9qViGh3LCIgqo
         GKjCnjZ9KGs6OPKOLQPVfRVqso7KsQJU62H/gSHMJ/TT2j7H0UaNipvZnIF9GgIf48BJ
         UADq7AdQvsy3JmFmSBGE3UDpxWXSBFeRGpChxsCARBE65CGmt4g/Fh2KCPadIGN9PbdF
         qBDQ==
X-Gm-Message-State: AOJu0YwrfgnRJZIczkbPhEgRRvg6a8Y7OFYYsoV9NcNZqvcSESDuN4hm
	l/MbMaMtBKIbNeRz/w7vBmVvtwCBcowaQyXFfvLBXfXY4ZIdf7MMme2S4FDLqrewzb7sguYySHx
	LPUo=
X-Google-Smtp-Source: AGHT+IH+DlEsclWhzphbzR8RqAon8tg3GEn5HgADaRa5A+tDQxakIb9y58+raykdUDRw98Zq4KdtjA==
X-Received: by 2002:adf:e34a:0:b0:374:c157:a84a with SMTP id ffacd0b85a97d-38060ec0728mr4720328f8f.16.1730104383795;
        Mon, 28 Oct 2024 01:33:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c4d8sm8874836f8f.2.2024.10.28.01.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:33:03 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:33:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 11/20] kernel/unwind/user.c:78 unwind_user_next()
 error: uninitialized symbol 'ret'.
Message-ID: <dac139ea-e499-4a08-b5c8-5a3dbb20b80a@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   a6a5b6724f859f25dbab8402cfe47a695bc719b3
commit: 389362462e2cfd21bed4b33d8336c24973166b5b [11/20] unwind: Add deferred userspace unwinding API
config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271820.7yFzLFqs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410271820.7yFzLFqs-lkp@intel.com/

smatch warnings:
kernel/unwind/user.c:78 unwind_user_next() error: uninitialized symbol 'ret'.
kernel/unwind/user.c:140 unwind_user_deferred() warn: unsigned 'idx' is never less than zero.

vim +/ret +78 kernel/unwind/user.c

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

ret not set.

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
                                                                                    ^^^^^^^
idx is unsigned.  Should there be a idx > 31 upper bounds check as well?

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

