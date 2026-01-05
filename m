Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9552C0284;
	Mon,  5 Jan 2026 02:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579239; cv=none; b=GPi5g53fUbt8Ja3cgfdGSjHBNkSKdNQr0YsW6m0YLlfuuIeXqDC0P7zbdV0I8/kODB93g/XFUei3gp6vCHUso7bmBwR6+MdwX2KFQfiTd/dQPYZsNcKui09dIISQO4Vq5PC0tgzgm2mLLPs/AttBs9XSWoOm0LqsQvsuujeuBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579239; c=relaxed/simple;
	bh=7qEnV/Sa+t2o7OeiQX2A+W/HG0cKRT6kUazjV3jY8/8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fjgBioqfoA9eN8TgESnZfxHYtTUUA3IyVZHDAOY6ZFhZZuCaMHzP7hKzrxZacoii56PJvJo4j2pNGIdxP/OQXk16t54oPCp3jkvZW4Wiw1J9ltdhAbwN/FPZSfDquBArA1ljRMQp4QFDt0lvJQ8kVlSUctlVc0olZGWl2kfTcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paIhoqpP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paIhoqpP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92513C116C6;
	Mon,  5 Jan 2026 02:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767579239;
	bh=7qEnV/Sa+t2o7OeiQX2A+W/HG0cKRT6kUazjV3jY8/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=paIhoqpPAdDvy+QzokfioEUpe2j8PgnjZ5fKBCm4TbMsRBUkMxH9q+CpBfEVh3Uuo
	 lEeZ8dpt9iXrnEw2zsQdcMQZKFLhToUlDl87LwW6xkBTteyTzHnKqRu9VjGyVUWdBZ
	 ohS2J/zzFEYkxzzSvJAZ58vtHQYuCoSesgaaDomqgmLEcFekQ+sn8oXbqvH6bM1QuP
	 HWPQGUeJ8TJtcr/xKbb4nykSZMuq6nu3kVKfhvi4KFPYZCDWMHwIy8zG5jeXByuCRY
	 Mopoj5VWsJG5KDibP1V0KnYgevQLBCRu/1ezlhblePGcvTtvK9+DNodB9xZKMFwUac
	 Ps0VHsJEKMetA==
Date: Mon, 5 Jan 2026 11:13:55 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error:
 we previously assumed 'fregs' could be null (see line 830)
Message-Id: <20260105111355.47965a0e4d52b0ffdc102330@kernel.org>
In-Reply-To: <20260102120913.15e5fc1b@gandalf.local.home>
References: <202512131657.JQUt5fXQ-lkp@intel.com>
	<20260102120913.15e5fc1b@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Jan 2026 12:09:13 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Fri, 2 Jan 2026 17:49:39 +0300
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   a919610db43b34621d0c3b333e12db9002caf5da
> > commit: 2ca8c112c9676e2394d76760db78ffddf21d93b5 fgraph: Pass ftrace_regs to retfunc
> > config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131657.JQUt5fXQ-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202512131657.JQUt5fXQ-lkp@intel.com/
> > 
> > smatch warnings:
> > kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we previously assumed 'fregs' could be null (see line 830)
> > 
> > vim +/fregs +834 kernel/trace/fgraph.c
> > 
> > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  810) static inline unsigned long
> > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  811) __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointer)
> > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  812) {
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  813) 	struct ftrace_ret_stack *ret_stack;
> > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  814) 	struct ftrace_graph_ret trace;
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  815) 	unsigned long bitmap;
> > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  816) 	unsigned long ret;
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  817) 	int offset;
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  818) 	int i;
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  819) 
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  820) 	ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer, &offset);
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  821) 
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  822) 	if (unlikely(!ret_stack)) {
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  823) 		ftrace_graph_stop();
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  824) 		WARN_ON(1);
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  825) 		/* Might as well panic. What else to do? */
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  826) 		return (unsigned long)panic;
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  827) 	}
> > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  828) 
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  829) 	trace.rettime = trace_clock_local();
> > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26 @830) 	if (fregs)
> > 
> > It's strange that Smatch is only now complaining about something which
> > is from 2024...  This line assumes "freqs" can be NULL.
> 
> Hmm, OK, I can see why smatch is complaining. But it is missing a dependency.
> 
> This is called by:
> 
> #ifdef CONFIG_HAVE_FUNCTION_GRAPH_FREGS
> unsigned long ftrace_return_to_handler(struct ftrace_regs *fregs)
> {
> 	return __ftrace_return_to_handler(fregs,
> 				ftrace_regs_get_frame_pointer(fregs));
> }
> #else
> unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
> {
> 	return __ftrace_return_to_handler(NULL, frame_pointer);
> }
> #endif
> 
> Where if HAVE_FUNCTION_GRAPH_FREGS is true, then fregs is always set.
> 
> > 
> > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  831) 		ftrace_regs_set_instruction_pointer(fregs, ret);
> > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  832) 
> > a1be9ccc57f07d Donglin Peng              2023-04-08  833  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26 @834) 	trace.retval = ftrace_regs_get_return_value(fregs);
> >                                                                                                             ^^^^^
> > Unchecked dereference.
> 
> Here FUNCTION_GRAPH_RETVAL has this in the Kconfig:
> 
> config FUNCTION_GRAPH_RETVAL
> 	bool "Kernel Function Graph Return Value"
> 	depends on HAVE_FUNCTION_GRAPH_FREGS
> 
> It depends on HAVE_FUNCTION_GRAPH_FREGS
> 
> Thus, it can't be called without fregs being valid.
> 
> Ideas on how to tell smatch about this?
> 
> Hmm, I wonder if we could change this to:
> 
> 	/* fregs is always set when configured */
> 	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
> 		ftrace_regs_set_instruction_pointer(fregs, ret);
> 
> And also add:
> 
> #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> 	/* The below is always true, but makes smatch happy */
> 	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
> 		trace.retval = ftrace_regs_get_return_value(fregs);
> #endif
> 
> ?

Can smatch understand fregs is not NULL if the
CONFIG_HAVE_FUNCTION_GRAPH_FREGS=y? If it can, I think this
can skip unneeded NULL pointer check at runtime.

(Or, define those macros to do nothing if CONFIG_HAVE_FUNCTION_GRAPH_FREGS=n)

Thank you,

> 
> -- Steve
> 
> 
> 
> > 
> > a1be9ccc57f07d Donglin Peng              2023-04-08  835  #endif
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  836) 
> > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  837) 	bitmap = get_bitmap_bits(current, offset);
> > 420e1354bcb6f0 Steven Rostedt (Google    2024-06-03  838) 
> > 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
