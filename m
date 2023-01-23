Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B56133D8;
	Mon, 23 Jan 2023 15:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xIM3Eqis0AWL0GAdNIQKrmEW61e6EXinuhOhAd2GUIQ=; b=EmeG6w3pDlKrN5JZ3YnN+PHEoA
	g+QaxUoOBievcBGzT3096c51rQx4/xe9GMjSqgSNOWb6CGz3sxjqcVI7I6IsaLTBQvbYfb15747lr
	b1eM/twUa0C2SsCK40eeJfL5HwQanPw7jN0HCy9Jf/RbxlODAopdXL5RW06PuK95J1EainV5xOwXZ
	AJKZlEN91842MV/Ycmuc0JgZU9gR6eZP5faf6wMNSLD+pShAYYAwx47e6FcsYssKLTmhOHXatpz4H
	DwVxvZBZyMe1eJviqv+Gsbs8sSD1dAj6fDMb0VKmeZKlaod593i1NKymJ2DjUbn07Gfa/zvlEhasw
	QPKBHdmQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pJyer-001ZUy-0V;
	Mon, 23 Jan 2023 15:22:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 14F12300327;
	Mon, 23 Jan 2023 16:23:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id F3C1F202441DC; Mon, 23 Jan 2023 16:23:21 +0100 (CET)
Date: Mon, 23 Jan 2023 16:23:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:x86/core 3/3] arch/x86/kernel/static_call.c:98
 __static_call_transform() error: uninitialized symbol 'op'.
Message-ID: <Y86maRy5ILlUBo/9@hirez.programming.kicks-ass.net>
References: <Y853bqEhA5NDC3Ar@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y853bqEhA5NDC3Ar@kadam>

On Mon, Jan 23, 2023 at 03:02:54PM +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
> head:   700f4c6d925823018a2d09f92de5405065d2ffec
> commit: 700f4c6d925823018a2d09f92de5405065d2ffec [3/3] x86/static_call: Add support for Jcc tail-calls
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230121/202301211834.noGVyk06-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> arch/x86/kernel/static_call.c:98 __static_call_transform() error: uninitialized symbol 'op'.
> 
> vim +/op +98 arch/x86/kernel/static_call.c
> 
> c27c753ea6fd12 Thomas Gleixner 2022-07-12   53  static void __ref __static_call_transform(void *insn, enum insn_type type,
> c27c753ea6fd12 Thomas Gleixner 2022-07-12   54  					  void *func, bool modinit)
> e6d6c071f22de2 Josh Poimboeuf  2020-08-18   55  {
> 3f2a8fc4b15de1 Peter Zijlstra  2021-01-18   56  	const void *emulate = NULL;
> 452cddbff74b6a Peter Zijlstra  2020-08-18   57  	int size = CALL_INSN_SIZE;
> 452cddbff74b6a Peter Zijlstra  2020-08-18   58  	const void *code;
> 700f4c6d925823 Peter Zijlstra  2023-01-20   59  	u8 op, buf[6];
> 700f4c6d925823 Peter Zijlstra  2023-01-20   60  
> 700f4c6d925823 Peter Zijlstra  2023-01-20   61  	if ((type == JMP || type == RET) && (op = __is_Jcc(insn)))
> 700f4c6d925823 Peter Zijlstra  2023-01-20   62  		type = JCC;
> 
> Smatch is concerned that type can start as "JCC".

It can't. What's the normal way to shut this kind of warnings up?

Something like BUG_ON(type==JCC); should squash that value I suppose,
but it does seems a bit crude.
