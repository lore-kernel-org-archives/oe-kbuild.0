Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14763375C3
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Jan 2026 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626618; cv=none; b=fMUJImqwsEr+Q3GewE0LyQu/1MT51YMQGQ70O3MCxQAsUSRvgdqTLSQr5JN6ba0veEH3ORmigp0UcCBfFZ7h8J/8t3saPm9cAjg2LVkbeypa4GFeI2OMEVbXqC7DmE5o4Gdmgoc3sF4YL2uk098D4n73NhoVFaQvooZ9NqtrA1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626618; c=relaxed/simple;
	bh=HKueogURHSYT6ByKs0shdGR/psbijyhL9NrCI/IzZ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oixTWGhJmwzYQlvn4QxzYxdt9TVLBcVrVFdOZmeby3iWVxQRhd0c64ZXQ07OojvYDLl4HSk6O7NTjwL/r6ocAZh++SucaHhNq+nGh1AR7JdSh6AO+rntny8S0rSFiJOBu2Mx1D21xB/MCmwKzPCDBCS039QzSI9KIUHMaNaT5PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gSXtB9oE; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gSXtB9oE"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fbc305882so6803620f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 05 Jan 2026 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767626615; x=1768231415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HaYTQ7BWPsiVNKxI7qR6p+hkO0uDJULloleKtGqvInE=;
        b=gSXtB9oEbOXv7QpfVCE0W9Rqnn42HlbyV27YyJq76EyINeRh7gRELB0FrDeMb1cHY8
         2EqIzUs2FbDUKQlkNjkn5dmmQh36l3CAkkDnEJ7TiggcwSmBmjAqUkclNFWrIEQEZzQt
         kvFZ8XNVlviSJWLF5+t0qz2a+hR/VrS8lKJgm3mmeo1iL6s2sbJq1aPuX6ju535o9elg
         ujh3Oc/Us63bYIw1Wg1skKnVlHJnX/E9iu2ydQCQN25KcDW9RI0UR2rPsnhz/RB48RDF
         8U1B0Hl0Msbaa/jk5kh8mPlyn0NEEEqEXf4UfIXWgXXm2A4uOdsKzaMJLW8BtDmKrkpL
         s5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767626615; x=1768231415;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaYTQ7BWPsiVNKxI7qR6p+hkO0uDJULloleKtGqvInE=;
        b=cH5hZxKOw3CaC3jdvGqNjiqhuxTdSA2uGl/IFwlKWkGTgVFJzoYoshhq9gx2vdlLtn
         5+qWdKQT+KFSg2g2xVfhhAy/sYn9XfFl+abFQZKVf0efbHgkkKasTEKX/ulOogYUB2ah
         6oXr4b5/fVUCO+sf060muRLWVM4aiwmqCYt5FcsizFp6NLjW/SyTESfA4vMjhMnQ7EqP
         ro6A9JqT3yf202MakYf3hGM6KdxJqH7X+VHyyMGAMceuqRqln2XtlnIoBvASogqiVkn5
         VLpkpbwsyesRPDZ3Vf/hGjH/6ocB1iLwPag22H+L+XT1ITwWdQi5tlnVq0KebeuKpHtD
         Orjg==
X-Gm-Message-State: AOJu0Yzv4wTYmFMwxQFgxdYQb7aR50BlW35wAloghu7rRKqkQxK8D9oq
	rZC+cOeDT5SD4rLkO8pju1bXDW0x2NevHSbJz12bvpV5aNCxlg8SG6whRvWxMNe0AZ9+ku6rawn
	m3W2u
X-Gm-Gg: AY/fxX4ofYUaL0FR5x84zr/uauYxbS0HOz9Hf45syF3sDgvA/4/oUKCZHR4gAiS2WiI
	8LvdquGU7+j/RoUDqO0/B4WtMDOfBcW4dNugjWot1zgbY71K1tZ2sijmrkfWn/mTpRjxd9zfk0j
	K/D9jH2r61aYjL1BgmyavMX2Eb30bm6giqH7haHZ5gUX5M8n7m75SJWyickY3f+JfBA68Rq/dWx
	V5ISX1kl8XfR4m9vtxPwpOe9YhbGpAlzhD6aeFUp19t65h6KDVleujlnmEM4I35pMmdqoaBNrwT
	w41B7iQ3RecbvZxNtP9LqBPEgv2F8qCTKvbfsFzYXfwa309bk1zI4VyrG98BIAK4kv31RMZgbuk
	rk0ZgSMV1lQJyZmQquXFIjVFh+DlTNZKmOzAp4xGhSnh+INEgubq1qf8pmBTvRSxZbarKhyDX1E
	hUzKOn/Gx8Ov8F6EAY
X-Google-Smtp-Source: AGHT+IEbzAH4Mwt8s7uaZyKDja05IxXDpz9rS7YosY9x88I2jrHj3aj2heYz9G34c7JpuT0cp6DgjA==
X-Received: by 2002:a05:6000:40ce:b0:431:8f8:7f17 with SMTP id ffacd0b85a97d-432bca2c441mr136677f8f.10.1767626614828;
        Mon, 05 Jan 2026 07:23:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bc9dfaa2sm152913f8f.0.2026.01.05.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 07:23:34 -0800 (PST)
Date: Mon, 5 Jan 2026 18:23:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 3/5] tracing: Have tracer option be instance specific
Message-ID: <202511071533.domGENBS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105161935.545400234@kernel.org>
Message-ID: <20260105152331.vi9L8jYR9bbnjwYsKkkNeSdMZ0vPh6wfbIV8S9HIsII@z>

Hi Steven,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Remove-dummy-options-and-flags/20251106-010511
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251105161935.545400234%40kernel.org
patch subject: [PATCH 3/5] tracing: Have tracer option be instance specific
config: i386-randconfig-r072-20251107 (https://download.01.org/0day-ci/archive/20251107/202511071533.domGENBS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511071533.domGENBS-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:6313 tracing_set_tracer() warn: iterator used outside loop: 't'

vim +/t +6313 kernel/trace/trace.c

9c5b9d3d65e4858 Masami Hiramatsu         2020-01-11  6285  int tracing_set_tracer(struct trace_array *tr, const char *buf)
09d23a1d8a82e81 Steven Rostedt (Red Hat  2015-02-03  6286) {
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6287  	struct tracer *trace;
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6288  	struct tracers *t;
12883efb670c28d Steven Rostedt (Red Hat  2013-03-05  6289) #ifdef CONFIG_TRACER_MAX_TRACE
34600f0e9c33c9c Steven Rostedt           2013-01-22  6290  	bool had_max_tr;
12883efb670c28d Steven Rostedt (Red Hat  2013-03-05  6291) #endif
d33b10c0c73adca Steven Rostedt           2024-12-24  6292  	int ret;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6293  
d33b10c0c73adca Steven Rostedt           2024-12-24  6294  	guard(mutex)(&trace_types_lock);
1027fcb206a0fb8 Steven Rostedt           2009-03-12  6295  
7a1d1e4b9639ff0 Steven Rostedt (Google   2024-06-12  6296) 	update_last_data(tr);
7a1d1e4b9639ff0 Steven Rostedt (Google   2024-06-12  6297) 
a1f157c7a3bb342 Zheng Yejian             2023-09-06  6298  	if (!tr->ring_buffer_expanded) {
2b6080f28c7cc3e Steven Rostedt           2012-05-11  6299  		ret = __tracing_resize_ring_buffer(tr, trace_buf_size,
438ced1720b5840 Vaibhav Nagarnaik        2012-02-02  6300  						RING_BUFFER_ALL_CPUS);
73c5162aa362a54 Steven Rostedt           2009-03-11  6301  		if (ret < 0)
d33b10c0c73adca Steven Rostedt           2024-12-24  6302  			return ret;
73c5162aa362a54 Steven Rostedt           2009-03-11  6303  		ret = 0;
73c5162aa362a54 Steven Rostedt           2009-03-11  6304  	}
73c5162aa362a54 Steven Rostedt           2009-03-11  6305  
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6306  	list_for_each_entry(t, &tr->tracers, list) {
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6307  		if (strcmp(t->tracer->name, buf) == 0)
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6308  			break;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6309  	}
d33b10c0c73adca Steven Rostedt           2024-12-24  6310  	if (!t)

t can't be NULL here.  It needs to be if (list_entry_is_head()) return;

d33b10c0c73adca Steven Rostedt           2024-12-24  6311  		return -EINVAL;
d33b10c0c73adca Steven Rostedt           2024-12-24  6312  
4699bbb369ba1d3 Steven Rostedt           2025-11-05 @6313  	if (t->tracer == tr->current_trace)
d33b10c0c73adca Steven Rostedt           2024-12-24  6314  		return 0;
bc0c38d139ec7fc Steven Rostedt           2008-05-12  6315  
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6316  	trace = t->tracer;
4699bbb369ba1d3 Steven Rostedt           2025-11-05  6317  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

