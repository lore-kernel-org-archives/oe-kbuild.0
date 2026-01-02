Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96966224AF1
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Jan 2026 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767365387; cv=none; b=KOq2zQlJiMxcporQaQx5OGfkXUmRolHE6BJPsz3z2gU7vpfS44oIBszOl13fcFPLHWqcnqPRMOK95puMsemSugzqPuEfep1hLloIbyZ6Jx6kxjDOXHXiXQO5Wn5hwKjykUw4aN8VedsKRP9LfJJ3vXBZMLl1LyYS+FYiZPRc5Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767365387; c=relaxed/simple;
	bh=CUM8SWey49IY454Cqm5r4265//7UfKy+pC3HLEFDWdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7Y4+QJ3OmJLsRbghjCbOacDC1Dtbai9odm+PrWo7rW0DQdMfoVB3TzNlahoPtHlgYn8+ZzIduAV5NDpqkSb+TU3R7ObX8xG8bx+m5xc+mzDKJ1tsVOhuB9B1frGv2GXfIPL3H78Dy3r78M/J4mTw432mqAc1UTY2D0eS/ZJ0yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUSUXyaI; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUSUXyaI"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477632d9326so74308725e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 02 Jan 2026 06:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767365384; x=1767970184; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjMCcg/MDTN/xKiOvEQlPAUaIosRslZ1GZtEMqixl5c=;
        b=FUSUXyaI8AfSt+w9N6C5SdnVC2Z3ftg7bzSaQBJT99xpo+nFcPRFT1ioMJ6l8eV4lW
         v1rcTd+WiBXkI7oIiLMvitWcWtNaNNLaX1dU/xRu0hald5jxaUOJbgVR1mlLiZg5XilI
         YysdpUzIM4GJ5USEnsuYcJLqzj1lkA3db4IUmpozrGsXRJPkAZ1RQ2+BfLRnSg61HBPT
         sQ4IiVigrdZ51FgRCERc9MNmtuyKucJ7pSRHMWAARczcaVyhlPuSVNxC8YkC1nvfW4M+
         NWkVFR++NOpokS7xhsrIvYmAjsHyyRFxqYLJOuloT+vDqiitkN4Yb2cgEKZaD1JM4d+J
         8Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767365384; x=1767970184;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjMCcg/MDTN/xKiOvEQlPAUaIosRslZ1GZtEMqixl5c=;
        b=TmY8i9YYYvrwmm1Ii5KMlIMiTmHv9P/pEno8c3dBt+Z1Bv2L9Z4X1cMGEPE99nD9KI
         dR9fabuvO7+pXaxkp1/95L4Xep81XJVEW2e4qdVyOCGmKGZnvgDLcOd4pzqEONDVxL3Q
         bShY5YlgkQcG+D9P2c/ketnHlrNLOEfR10FpOza+BQQGpGwWfO+lh5r/StW2zAkwHYoT
         xx9LZznPIC97kI080uKKGx2Jn6GXLflLFJFY0M10kZ+7n+p084NMz9Sr2sw+friZVYGl
         6OXtmXOpc0PEsi0isuC3P+F96ueMxXAMYv9v5X10GPu2P7yBm3owNfIcpqTHnndtD8dE
         /ZQw==
X-Gm-Message-State: AOJu0Yz83VbGV659Pdcrd7aVEMDruxB/yEb0BqkVBmE1a/HdtXK4PIrG
	PcOI3Wx2obyCulzsfQwQsiHbiAVXjjZFPTlPoHdT+KdlidinBznSI7Az1luJq0jjK4EVkmNLC2a
	9886z7w4=
X-Gm-Gg: AY/fxX6wHb7sTL2xv7EAO3UDiwgGBLhrFY2woh4ijqzpeqvMWK/A/rH/n+qMEaI0CLH
	tFvuGSBi5sjxcDHQoxm7kk1INKNqt2msRqO3Zi+5rEF/TtnHoe44I5kLRrJ88ejSY3QcN7fLc9Q
	3kOaKMUXmiHJQcpeUXduTfVYwMeBLopHzrGnDx+xNpdH4iJQIe5ZVBTXVmX1nuYNZH8Bhh1aeXl
	r5WaL2esL9Zg3TtIB7ZBsij+79keMuvZI9jLg9awFLd8TY+p+Syy7cNgQh5vPFhrP+uFBotC+SJ
	KyIth67WHaKAeAVjiFWHKM9fWMNHAWFK0L4+U7oX/hanXuAwn8kwQOcLjKZRub4A0b7bAYOyAtp
	iWij/LCkCte8WG7+FSObFTE4bDM3QTgJusphax19mH1eANFZ7S0HBtPkHfc3lWqNQLJD0YRpuWI
	pT51U/Nt39eJw63HfG
X-Google-Smtp-Source: AGHT+IFhicLtOgLW5YhNppgbobIblo2mgTPdzhYu4oOqTVS2NcDuC+HmtEtmYQP1aF1z6wPu4tx3cA==
X-Received: by 2002:a05:600c:1f13:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-47d68569c53mr46877375e9.23.1767365383541;
        Fri, 02 Jan 2026 06:49:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm775669275e9.4.2026.01.02.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 06:49:43 -0800 (PST)
Date: Fri, 2 Jan 2026 17:49:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we
 previously assumed 'fregs' could be null (see line 830)
Message-ID: <202512131657.JQUt5fXQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260102144939.AtbTiBqaA4SoGR0IFe39SKZkEUeX6n6Ouw5Hql5xLKw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a919610db43b34621d0c3b333e12db9002caf5da
commit: 2ca8c112c9676e2394d76760db78ffddf21d93b5 fgraph: Pass ftrace_regs to retfunc
config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131657.JQUt5fXQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512131657.JQUt5fXQ-lkp@intel.com/

smatch warnings:
kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we previously assumed 'fregs' could be null (see line 830)

vim +/fregs +834 kernel/trace/fgraph.c

a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  810) static inline unsigned long
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  811) __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointer)
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  812) {
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  813) 	struct ftrace_ret_stack *ret_stack;
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  814) 	struct ftrace_graph_ret trace;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  815) 	unsigned long bitmap;
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  816) 	unsigned long ret;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  817) 	int offset;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  818) 	int i;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  819) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  820) 	ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer, &offset);
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  821) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  822) 	if (unlikely(!ret_stack)) {
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  823) 		ftrace_graph_stop();
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  824) 		WARN_ON(1);
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  825) 		/* Might as well panic. What else to do? */
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  826) 		return (unsigned long)panic;
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  827) 	}
d864a3ca883095 Steven Rostedt (VMware    2018-11-12  828) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  829) 	trace.rettime = trace_clock_local();
2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26 @830) 	if (fregs)

It's strange that Smatch is only now complaining about something which
is from 2024...  This line assumes "freqs" can be NULL.

2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  831) 		ftrace_regs_set_instruction_pointer(fregs, ret);
2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  832) 
a1be9ccc57f07d Donglin Peng              2023-04-08  833  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26 @834) 	trace.retval = ftrace_regs_get_return_value(fregs);
                                                                                                            ^^^^^
Unchecked dereference.

a1be9ccc57f07d Donglin Peng              2023-04-08  835  #endif
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  836) 
7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  837) 	bitmap = get_bitmap_bits(current, offset);
420e1354bcb6f0 Steven Rostedt (Google    2024-06-03  838) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

