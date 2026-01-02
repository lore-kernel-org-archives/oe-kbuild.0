Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C401E531;
	Fri,  2 Jan 2026 17:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767373750; cv=none; b=QMhcqslMYAopDcvIx8EOrmL1l+G8qpOsIIv+g7STrEPYzsJjc5fgXm6xk/DjNw+L5Htic4/P1D26FgTLnSC6C6+QkMDquEplzdNLWUwptGFA22v9CjbuMrCI1XEh6CtUNywsbHChuWL4gYRMbPx4Zcy0KsfdwCzS52eQkLM7c7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767373750; c=relaxed/simple;
	bh=z5qBOYo7vxG1LptSihDNrbjdC1et9PcTHUktq8Rowr4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bRU44tyO0CIRIHcxEpq1JZTn7XE944iRTjSpLJweaBY8puiDOcGyGecHsBAAwupBmac14yvs2Gc2bfJT3OWoH/+gnvUqPMWsYH+rQ8Q652szWTuAronqAizBJ6d18cMNQRkzO9o7VXIQk1S2A1rZxFqoWVfClXaJh/B7zihldx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id D6DDF160756;
	Fri,  2 Jan 2026 17:09:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id 0BEB520028;
	Fri,  2 Jan 2026 17:08:58 +0000 (UTC)
Date: Fri, 2 Jan 2026 12:09:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error:
 we previously assumed 'fregs' could be null (see line 830)
Message-ID: <20260102120913.15e5fc1b@gandalf.local.home>
In-Reply-To: <202512131657.JQUt5fXQ-lkp@intel.com>
References: <202512131657.JQUt5fXQ-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 0BEB520028
X-Stat-Signature: irhdgt779q68j3rapboqctc544u31jb8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+ZH7PhUWDNkBUisCCa+xi6lEXVzv/M4cY=
X-HE-Tag: 1767373738-495255
X-HE-Meta: U2FsdGVkX18kfwind9L+Magb7pEZYMwgRbWegtBhuyva3Ja4B/tWNCqGIoLAJ/qhj2NmQiXbhDdoDyZMqirLJoPanGETdVgABFtNVvKue8zLkIT7F1UpJjxgFnSdYGU7EuPRWQXlQFh2AP41vYI318FuCAU2s4XyZIOApkwJcXUkpiJdDqev9asMH9sClzT8Wd/dfEx8QGuG8MKcyQG2eqab80dwTvE1vO7tlOtr4bzi48R0mz9amy7HXMzOnDanyBEpGNYJQYgxhbm577wYercSNKV/u4L9IAC0uBBneVZdqVg5zmjB+QcomxiHH8tcTIoDX0mc7OaKPIv6ZgSJbJ1oZN5Mb2L7SA3mHtslL9I3uhnEoJ/m9FTHcjgBTjr9LGuWCTnWlG/cX+YfJyVcpNEGM5Z7KAB8cPhT3+Y35ISTEAeqhOCF/y0hAO83IsUH/jFHhfSwCONWE2Pb1auL/fQrfKWMi7Yk61M6Y7DXi7Q0NVyqD+p0VUFzuti33Kfw

On Fri, 2 Jan 2026 17:49:39 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   a919610db43b34621d0c3b333e12db9002caf5da
> commit: 2ca8c112c9676e2394d76760db78ffddf21d93b5 fgraph: Pass ftrace_regs to retfunc
> config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131657.JQUt5fXQ-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512131657.JQUt5fXQ-lkp@intel.com/
> 
> smatch warnings:
> kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we previously assumed 'fregs' could be null (see line 830)
> 
> vim +/fregs +834 kernel/trace/fgraph.c
> 
> a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  810) static inline unsigned long
> a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  811) __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointer)
> d864a3ca883095 Steven Rostedt (VMware    2018-11-12  812) {
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  813) 	struct ftrace_ret_stack *ret_stack;
> d864a3ca883095 Steven Rostedt (VMware    2018-11-12  814) 	struct ftrace_graph_ret trace;
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  815) 	unsigned long bitmap;
> d864a3ca883095 Steven Rostedt (VMware    2018-11-12  816) 	unsigned long ret;
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  817) 	int offset;
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  818) 	int i;
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  819) 
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  820) 	ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer, &offset);
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  821) 
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  822) 	if (unlikely(!ret_stack)) {
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  823) 		ftrace_graph_stop();
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  824) 		WARN_ON(1);
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  825) 		/* Might as well panic. What else to do? */
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  826) 		return (unsigned long)panic;
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  827) 	}
> d864a3ca883095 Steven Rostedt (VMware    2018-11-12  828) 
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  829) 	trace.rettime = trace_clock_local();
> 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26 @830) 	if (fregs)
> 
> It's strange that Smatch is only now complaining about something which
> is from 2024...  This line assumes "freqs" can be NULL.

Hmm, OK, I can see why smatch is complaining. But it is missing a dependency.

This is called by:

#ifdef CONFIG_HAVE_FUNCTION_GRAPH_FREGS
unsigned long ftrace_return_to_handler(struct ftrace_regs *fregs)
{
	return __ftrace_return_to_handler(fregs,
				ftrace_regs_get_frame_pointer(fregs));
}
#else
unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
{
	return __ftrace_return_to_handler(NULL, frame_pointer);
}
#endif

Where if HAVE_FUNCTION_GRAPH_FREGS is true, then fregs is always set.

> 
> 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  831) 		ftrace_regs_set_instruction_pointer(fregs, ret);
> 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  832) 
> a1be9ccc57f07d Donglin Peng              2023-04-08  833  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26 @834) 	trace.retval = ftrace_regs_get_return_value(fregs);
>                                                                                                             ^^^^^
> Unchecked dereference.

Here FUNCTION_GRAPH_RETVAL has this in the Kconfig:

config FUNCTION_GRAPH_RETVAL
	bool "Kernel Function Graph Return Value"
	depends on HAVE_FUNCTION_GRAPH_FREGS

It depends on HAVE_FUNCTION_GRAPH_FREGS

Thus, it can't be called without fregs being valid.

Ideas on how to tell smatch about this?

Hmm, I wonder if we could change this to:

	/* fregs is always set when configured */
	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
		ftrace_regs_set_instruction_pointer(fregs, ret);

And also add:

#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
	/* The below is always true, but makes smatch happy */
	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
		trace.retval = ftrace_regs_get_return_value(fregs);
#endif

?

-- Steve



> 
> a1be9ccc57f07d Donglin Peng              2023-04-08  835  #endif
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  836) 
> 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  837) 	bitmap = get_bitmap_bits(current, offset);
> 420e1354bcb6f0 Steven Rostedt (Google    2024-06-03  838) 
> 

