Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF05201249
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 07:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344467; cv=none; b=ll/tcyoMxwxyv6CftP7/opCreFEyRfNHbUyw+clY0cHsq1s+LeXupre0ilzrlQEzcOI0d7lBsuL2ObD1wGcZv/qU9+fP53ZzoZoHwg8qNOtQJQ5u9v5ExpdGlYA/F2rVcN8XnG5Qw+ahvLpF7p/2X4spZ//oSZnEv7aTUChYTwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344467; c=relaxed/simple;
	bh=j6JE8Hgt2otoP2Cd3JRv9WRbmo4jJe/LmBWvsADKfoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5XNwmsgzOzcmmjSrNKan9soqQLCK0d85mUs3fbW/gXWyBWMnbV+iRn5ygZ6JBnHNDbtIrB+hkB4BCpcZ2Qxo0h334KaeRwo24qfxtVAFNLWywzT3ovFWIqsSTaEdkkH/x584wkjnmjF7bck5PnsTafVC3FuIP93p+ffWVc6+BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=heZRERaS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="heZRERaS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7f42ee3ecso82704366b.0
        for <oe-kbuild@lists.linux.dev>; Tue, 11 Feb 2025 23:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739344464; x=1739949264; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IcRo2mLuLppF89p7qalQVVIl9otgMGV6R/tX138Yi2k=;
        b=heZRERaSSssIgoiL7UnBW9pA3LIytpX31veyYVx2rbul77o2sJU3Qf5k5c7bo4Oa2K
         8KgyEWPN3b6uJEp1nLKiIMRUQXZk8998ncu1+flRGST8aaQBLsuzDEW81oD4VfVZekW5
         hO7rOTry+6reM0Euu1d8IUaoeKuMiWL8Qh4zTwMj55aKdtq43xeL43rZzg6xGG8SEHDw
         ersti1sFOtOx9h2bXdfzQehQraaXe5fQyfkUNSg7lrsFmzjcQEkKA/wetWXgKktfHBUW
         tgTsHMq+V59vxivkZrq0OE2buIHqtFkPo83I1lPqR1RusXqQKUOpO5duSWL6Ik2MrH55
         v6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739344464; x=1739949264;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IcRo2mLuLppF89p7qalQVVIl9otgMGV6R/tX138Yi2k=;
        b=pfjWgmguFXWNxyET1u8YDqpA256CcdIy1Jz7ETdOKfqcPik6wn14OC+3d+XN+J2eDr
         jycLM675GhmcQaxEbQtrRMm7Or6F81fOki+slfLq3wV7S8UKdOMC9kTuwD5Ge9y9SRBx
         SaECPzN97K+LKse1bhM4WHj9w0U/Ez5/W6+PHcrQcA5M6UWIA6lwn5skNY8ZDM7e7rCo
         ubznNdpF/rET6HEH5Dzn4fmja2LxTQ67MtVU+sovJo/ctZL1BsciD3ul9HISQYhb2dWt
         6LVW5Y8QzOfya308xnYc8dszbB8U94oyfZEtFqweXZin0Lg3SOobW08QtlOECMxAGute
         Pdyg==
X-Gm-Message-State: AOJu0YzHqV9JvkClgEQZ579fkmfzK/ksYwhoHGxPtfxQQUbtNt62DAnk
	cP+2X7/t6VuNSGGQNgOt+ooy/4QjwulClrQ4E0k5pmF+JNxy2SD3PaTDoI3qK2gcmDDBdn0vx4t
	R
X-Gm-Gg: ASbGncvh/1SPhAMg/5JfSq15gn+nXXQPNooa3UxW3YIq+eekNCPNT3vCmCZhqpUwEiw
	ZfdqpASSuoEWxeGzSdrN0wpFPpffiTM8OUAKRZoJEhq054R8cYEPb7H89Qo8VqNxZiYY4nVGC0p
	e9LKuY8Ek2yKK/HgQDjqMC28OAuJ8fWvUsinVxyD0UXDRnw59b5nFh1oAh53WAkVQFIcONW8TEh
	mxwEXJdwU+N6YYSljFKg/l0lMKCl7JCFHssdX9VGI/ydtFTYSaD9aYPe0uuEulJbGBTatdLJcGy
	JRQYOrqm2zqlz2S9cb1g
X-Google-Smtp-Source: AGHT+IFA337F5rcZ/SLySUMlmBUKximSXXcbYVdDK1Uyw/tZpabgTbOrGJJPwcThu1lPZa67vpeW3g==
X-Received: by 2002:a17:907:3da5:b0:ab7:d179:2496 with SMTP id a640c23a62f3a-ab7f3365a09mr186804866b.6.1739344463790;
        Tue, 11 Feb 2025 23:14:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7d5f84968sm352465166b.164.2025.02.11.23.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:14:23 -0800 (PST)
Date: Wed, 12 Feb 2025 10:14:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Roman Gushchin <roman.gushchin@linux.dev>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 6/8]
 arch/arm64/kernel/stacktrace.c:317 kunwind_next() error: uninitialized
 symbol 'err'.
Message-ID: <efcccbb2-460d-403b-bd7e-820c91ffde1e@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: 15aeab1a240cbf8183562d48028d84121e945308 [6/8] unwind: arm64: add reliable stacktrace support for arm64
config: arm64-randconfig-r072-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081057.X3H859Hx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502081057.X3H859Hx-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/stacktrace.c:317 kunwind_next() error: uninitialized symbol 'err'.

vim +/err +317 arch/arm64/kernel/stacktrace.c

b5ecc19e684eee Mark Rutland 2023-04-11  300  static __always_inline int
1beef60e7d6b90 Mark Rutland 2023-11-24  301  kunwind_next(struct kunwind_state *state)
4e00532f373659 Marc Zyngier 2022-07-27  302  {
4e00532f373659 Marc Zyngier 2022-07-27  303  	int err;
4e00532f373659 Marc Zyngier 2022-07-27  304  
8094df1cf09248 Mark Rutland 2024-10-17  305  	state->flags.all = 0;
8094df1cf09248 Mark Rutland 2024-10-17  306  
bdf8eafbf7f56f Mark Rutland 2024-10-17  307  	switch (state->source) {
bdf8eafbf7f56f Mark Rutland 2024-10-17  308  	case KUNWIND_SOURCE_FRAME:
bdf8eafbf7f56f Mark Rutland 2024-10-17  309  	case KUNWIND_SOURCE_CALLER:
bdf8eafbf7f56f Mark Rutland 2024-10-17  310  	case KUNWIND_SOURCE_TASK:
bdf8eafbf7f56f Mark Rutland 2024-10-17  311  	case KUNWIND_SOURCE_REGS_PC:
2abe944a4cb43d Weinan Liu   2025-01-25  312  #ifdef CONFIG_SFRAME_UNWINDER
15aeab1a240cbf Weinan Liu   2025-01-25  313  	if (!state->common.unreliable)
2abe944a4cb43d Weinan Liu   2025-01-25  314  		err = unwind_next_frame_sframe(&state->common);

uninitialized on else path

2abe944a4cb43d Weinan Liu   2025-01-25  315  
2abe944a4cb43d Weinan Liu   2025-01-25  316  	/* Fallback to FP based unwinder */
15aeab1a240cbf Weinan Liu   2025-01-25 @317  	if (err || state->common.unreliable) {
                                                    ^^^

32ed1205682ec4 Mark Rutland 2024-12-11  318  		err = kunwind_next_frame_record(state);
15aeab1a240cbf Weinan Liu   2025-01-25  319  		/* Mark its stacktrace result as unreliable if it is unwindable via FP */
15aeab1a240cbf Weinan Liu   2025-01-25  320  		if (!err)
15aeab1a240cbf Weinan Liu   2025-01-25  321  			state->common.unreliable = true;
15aeab1a240cbf Weinan Liu   2025-01-25  322  	}
2abe944a4cb43d Weinan Liu   2025-01-25  323  #else
2abe944a4cb43d Weinan Liu   2025-01-25  324  	err = kunwind_next_frame_record(state);
2abe944a4cb43d Weinan Liu   2025-01-25  325  #endif
bdf8eafbf7f56f Mark Rutland 2024-10-17  326  		break;
bdf8eafbf7f56f Mark Rutland 2024-10-17  327  	default:
c2c6b27b5aa14f Mark Rutland 2024-10-17  328  		err = -EINVAL;
bdf8eafbf7f56f Mark Rutland 2024-10-17  329  	}
4e00532f373659 Marc Zyngier 2022-07-27  330  
c2c6b27b5aa14f Mark Rutland 2024-10-17  331  	if (err)
c2c6b27b5aa14f Mark Rutland 2024-10-17  332  		return err;
c2c6b27b5aa14f Mark Rutland 2024-10-17  333  
1beef60e7d6b90 Mark Rutland 2023-11-24  334  	state->common.pc = ptrauth_strip_kernel_insn_pac(state->common.pc);
4e00532f373659 Marc Zyngier 2022-07-27  335  
1beef60e7d6b90 Mark Rutland 2023-11-24  336  	return kunwind_recover_return_address(state);
4e00532f373659 Marc Zyngier 2022-07-27  337  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

