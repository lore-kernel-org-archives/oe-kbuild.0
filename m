Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A831355F
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626163; cv=none; b=aMzOtB3vkgjqMjqUSalidIKbmlMEWHma9XhVoGv0zrfR4oHxpEMZleOTTfliB4wf3I4v1RXGt7vCreHECQ89c/bni4NlX7wG/78vJhdYN7myylyDClQJ1HxP+4kJrhH3eIao+o/XgPDCDrpPXQXkFDZC5OKna3UNcbgDBdLDNWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626163; c=relaxed/simple;
	bh=4iraTdsmLYT16odtBVu8terwDvuqh0eSwap0p3O0rqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+XtjQDG+MoRfz5if5ZzR15hRvafM2WFN+kzWS11O/2S5bWBmVv4z1xv63W+gW8aB5dOvIzErMMjREn0ucTbHoYZ8/pHqasb8X62SaOOc1y8c5GvHkx0kgiz5IGBoqEkcfHPiJXuX848mpuqC0cioti8zy88YDP7g9nbXdQSzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wtROQCvg; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wtROQCvg"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso48965e9.2
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 07:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626160; x=1768230960; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c339wC0UdNsJn297c2pk58jew9sVzzcx4QKGiYbLMbE=;
        b=wtROQCvglc96o1zh9v2KCW5sQJ1LxgAzRcadcW2LD/aqyVeAx0fbIkSDhzcwmsiSlE
         T3gHS0xd33r4dnx/g46PsD5h/UiuEnmedTcllyzHpqyevq5D7zgFba7DdRyS3FfWa8hQ
         KlNBwgx1XnifboZNr7hjQfCnYi6S7q6FwKUGBf/Cogvzq0qVeGYZx/XoGyRlEZAkYjeS
         bF5Ec3pB/AoLNJAXNdABghi4goBj3YX3Hywge/X3+B3fp7zL6IyMlJvz6YzTdKNf8c2x
         17ugLSjnT1kXKpCBC3zekwVhABJsyXmUuQvFXX1V4O5hMaoO8rrJd/CxEV+mTS3qm5xS
         8Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626160; x=1768230960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c339wC0UdNsJn297c2pk58jew9sVzzcx4QKGiYbLMbE=;
        b=UBpZk+G2Ib8qvPD8yZ3BycOhnGLJvgeYW4NbUdrvOK8pSWMHpNnPYEm2bLWwrERdQ2
         maaLMAdbrse6Id5ARN1RlHLPm2sxaJrl3tqOoP2o4530W5o/RVcZFh0Ace3e3dBs0pkS
         SNTolMZ0+Ar3Fhn72gUonvJr9+aWcGduA+lTSJ09+XCKfQkJGrxGrLnu/1xE04deoTxW
         loyyEjCMua8mYnHqZkHLRtHEOlXHdDpIZGUVHqTA7lhP+hk1gGRzbyxnJvKTKHOmwj2S
         Zeo32Qt3DZUKaYr0uwqIwwFKswOrlz1Ut9JnTAoIQmT9rsSfoOkU407QBKaHHC7cZyF8
         D0QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFXz89TnwcBX1OTwv89jUADmozr8ido7IW+o68BaRQAnVNFumHPXx4qv1I+P9itXoWUHrFTlqh66o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgn0k59C/ZhpbR/RGHd80/3Ij03NLgE8iAANJfO5L2P/uCk+V
	1h7anzJPQFSKzjDM0ZieJWsAjCwo6UuUxnuz/zGDL3DBuu/CPbyPs/z6aeb8TezbMPU=
X-Gm-Gg: AY/fxX5S34l68KC6pYFEsisJqVMUM5XLo2PIxZJCNu7PjYx+AEENETxZiGJMi3PqAXo
	E20i/noFBqF3JLqDUQo7qDQig9pkEuKt2b7JpK0A1thb84aSarR1y14/QWlwyEjqmP2ZFDDZwQK
	yyX2DOiq5DIc7ErMz0bEbEFH/KxuaXLvwdnwPGHjUIdA+vuSbe1ysQVMTQ9RAygXlJM81v2OaYm
	96NgtVesI7KUSQk4xUSBY65mDlOfCyQWubRBY462+iiF6s+ljSj63cDwMgOf8lSGHaFE3gIFdxh
	/Xno1qBzvI51g2NTVPbqUgoYeM4pJ+nDgxC0W+0JGkr0+IW5z5S7F4A6PuP/U9uo03zRML9Mpmz
	QuxgRLxt86aNoS7VCuiY9QKxQySL6+fJ54rpVrKjdn6uuVDIvgZnvyPVf+LfHBlOXs369DssXDI
	X5XgIPXJLbWOkFKiDS
X-Google-Smtp-Source: AGHT+IHZ9AMS0s+wHnOq5QWu1kwCrH508KyzuIyXfeZTWfyxeWi5qfJ8J0a7bXjVMtP+zELwI7QTZw==
X-Received: by 2002:a05:600c:1c28:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-47d1954586amr599501395e9.10.1767626159814;
        Mon, 05 Jan 2026 07:15:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d45aa2fsm153951965e9.13.2026.01.05.07.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:15:59 -0800 (PST)
Date: Mon, 5 Jan 2026 18:15:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, oe-kbuild@lists.linux.dev,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we
 previously assumed 'fregs' could be null (see line 830)
Message-ID: <aVvVrFgh8ieFVbn4@stanley.mountain>
References: <202512131657.JQUt5fXQ-lkp@intel.com>
 <20260102120913.15e5fc1b@gandalf.local.home>
 <20260105111355.47965a0e4d52b0ffdc102330@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105111355.47965a0e4d52b0ffdc102330@kernel.org>

On Mon, Jan 05, 2026 at 11:13:55AM +0900, Masami Hiramatsu wrote:
> On Fri, 2 Jan 2026 12:09:13 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > On Fri, 2 Jan 2026 17:49:39 +0300
> > Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   a919610db43b34621d0c3b333e12db9002caf5da
> > > commit: 2ca8c112c9676e2394d76760db78ffddf21d93b5 fgraph: Pass ftrace_regs to retfunc
> > > config: arm64-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512131657.JQUt5fXQ-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202512131657.JQUt5fXQ-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > kernel/trace/fgraph.c:834 __ftrace_return_to_handler() error: we previously assumed 'fregs' could be null (see line 830)
> > > 
> > > vim +/fregs +834 kernel/trace/fgraph.c
> > > 
> > > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  810) static inline unsigned long
> > > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26  811) __ftrace_return_to_handler(struct ftrace_regs *fregs, unsigned long frame_pointer)
> > > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  812) {
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  813) 	struct ftrace_ret_stack *ret_stack;
> > > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  814) 	struct ftrace_graph_ret trace;
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  815) 	unsigned long bitmap;
> > > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  816) 	unsigned long ret;
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  817) 	int offset;
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  818) 	int i;
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  819) 
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  820) 	ret_stack = ftrace_pop_return_trace(&trace, &ret, frame_pointer, &offset);
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  821) 
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  822) 	if (unlikely(!ret_stack)) {
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  823) 		ftrace_graph_stop();
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  824) 		WARN_ON(1);
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  825) 		/* Might as well panic. What else to do? */
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  826) 		return (unsigned long)panic;
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  827) 	}
> > > d864a3ca883095 Steven Rostedt (VMware    2018-11-12  828) 
> > > 7aa1eaef9f4282 Steven Rostedt (VMware    2024-06-03  829) 	trace.rettime = trace_clock_local();
> > > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26 @830) 	if (fregs)
> > > 
> > > It's strange that Smatch is only now complaining about something which
> > > is from 2024...  This line assumes "freqs" can be NULL.
> > 
> > Hmm, OK, I can see why smatch is complaining. But it is missing a dependency.
> > 
> > This is called by:
> > 
> > #ifdef CONFIG_HAVE_FUNCTION_GRAPH_FREGS
> > unsigned long ftrace_return_to_handler(struct ftrace_regs *fregs)
> > {
> > 	return __ftrace_return_to_handler(fregs,
> > 				ftrace_regs_get_frame_pointer(fregs));
> > }
> > #else
> > unsigned long ftrace_return_to_handler(unsigned long frame_pointer)
> > {
> > 	return __ftrace_return_to_handler(NULL, frame_pointer);
> > }
> > #endif
> > 
> > Where if HAVE_FUNCTION_GRAPH_FREGS is true, then fregs is always set.
> > 
> > > 
> > > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  831) 		ftrace_regs_set_instruction_pointer(fregs, ret);
> > > 2ca8c112c9676e Masami Hiramatsu (Google  2024-12-26  832) 
> > > a1be9ccc57f07d Donglin Peng              2023-04-08  833  #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> > > a3ed4157b7d898 Masami Hiramatsu (Google  2024-12-26 @834) 	trace.retval = ftrace_regs_get_return_value(fregs);
> > >                                                                                                             ^^^^^
> > > Unchecked dereference.
> > 
> > Here FUNCTION_GRAPH_RETVAL has this in the Kconfig:
> > 
> > config FUNCTION_GRAPH_RETVAL
> > 	bool "Kernel Function Graph Return Value"
> > 	depends on HAVE_FUNCTION_GRAPH_FREGS
> > 
> > It depends on HAVE_FUNCTION_GRAPH_FREGS
> > 
> > Thus, it can't be called without fregs being valid.
> > 
> > Ideas on how to tell smatch about this?
> > 
> > Hmm, I wonder if we could change this to:
> > 
> > 	/* fregs is always set when configured */
> > 	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
> > 		ftrace_regs_set_instruction_pointer(fregs, ret);
> > 
> > And also add:
> > 
> > #ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> > 	/* The below is always true, but makes smatch happy */
> > 	if (IS_ENABLED(CONFIG_HAVE_FUNCTION_GRAPH_FREGS))
> > 		trace.retval = ftrace_regs_get_return_value(fregs);
> > #endif
> > 
> > ?
> 
> Can smatch understand fregs is not NULL if the
> CONFIG_HAVE_FUNCTION_GRAPH_FREGS=y? If it can, I think this
> can skip unneeded NULL pointer check at runtime.
> 
> (Or, define those macros to do nothing if CONFIG_HAVE_FUNCTION_GRAPH_FREGS=n)
> 
> Thank you,

We could just ignore this...  The explanation is on the list if people
have questions.

The problem is that this is only called from assembly which smatch
doesn't understand.

regards,
dan carpenter

