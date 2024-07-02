Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA35F1BBBD9
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 15:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719934500; cv=none; b=OerHQ/m36MTmrCnACWHV9jU/GwMtEW3BIIqEAhOkBiwwo+c73lVWvGf8uf2/0xd5dDqkp/8DKs3xBqswGuzrPkePaKZw+8AfMcgWvBHZKryM4vxOffLzhlmOL6qaPluNnqzEDnVJuyrLPKe6GPFzPe3mLaXEj85B7XPKjVrCBLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719934500; c=relaxed/simple;
	bh=+T54sraKCnHC3+xGw0tk3QB6VvZ4RZQJ1Rskv/S4vfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7/EoUDqL8J1j/yzivNVTFlYL1JqDpoNxBk1YTREOpNENo5HjsqQJ/WhsPGqDtqhWlD29h799W3OO2MY5mKr2WBGvlWQaeJOqJw6gaSErMKNcPkg5KFdus9/Bhpdf8qn0p9Y7RlR9BWFMFopIsGlkIZNumbHJ+hxFGWUUzcc0iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVMp6kQO; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVMp6kQO"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7021dffc628so790220a34.2
        for <oe-kbuild@lists.linux.dev>; Tue, 02 Jul 2024 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719934498; x=1720539298; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5RYOre3lmw/376bOtbgxlrNKDmgQPBWSgucOOkDM4I=;
        b=XVMp6kQOplccras+ErlkP5FumjLrFzfhI48Pms0sCkaimNlh/kVaH7OKlHYGJ/t8+P
         4lvfX8H2ceU4O3VpuZO2BjxHrKYaUtQspM03Q63Aph2bggY3hPg4q3Vs0dLIxKZXxlCs
         p4GiNi/I4n7X6yiS1LTcvJ2Jvx/kCdR5ZZhA26QF5SOtM9cICFeu9HcG+xQBS6EDaMEB
         jdbHuS9bFOyJlNr1EmhztVSrnCcC8fNaliF/V88Mua+6549owrSK2zlgYsexaVeSAodw
         VnPZMLddUcmMAEs2jGVMI/oPfcUSon6HSzL1hLGM5gA9q1dwHsznhg7BXTEkeCBWJr78
         plig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719934498; x=1720539298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5RYOre3lmw/376bOtbgxlrNKDmgQPBWSgucOOkDM4I=;
        b=bqM9AlHp8GgJD+W0GuEVZXZJmJMZ2/K/f2foOHQeQ5oC6bNvbRZELaGvFR/fBRekjP
         5VnLn22STxVBJHmL6oxir/90lPYtFxLPBMJn2Ofyx6l2fz9Vnx1DfmeWCvumSMfNYcSq
         +D/gFkcuAZ6ssso/mp2j1W39Qn5ysQbDf8CXEH2A3dwYX8Sj+xG22hqw7iJgk8yoCAB3
         hQoMO7JLMgjJGQLSdbvyEQ6ZdikJcLLKqNDIhm9ux3bvdrQzmsPsD924+c1mmxEbL88a
         ifPvOj5drIqQx3Cgy4Cqqpi0inpHibhl2YcCHte/RyfyPPhF0IODkh/XJDnxpUlDGpON
         C+qw==
X-Gm-Message-State: AOJu0Yyzd5hGMOS2KvypDLhuU1KjLBMAenp1RCEhhSl6D1gEqaOPUhmE
	+k/KauRie0MXVt7+e29xpzP3W+osnUaenLsMdjN4MPw6XnMlmcHTHPmI/d8yz78=
X-Google-Smtp-Source: AGHT+IF5dDZdIn1yQVBjZCuWeV2eI4Nrf3c+gujdOxzW1Iu9eYMVF/9SBs7k61CKgACKea+7/DMDvg==
X-Received: by 2002:a05:6830:1313:b0:700:cebc:9858 with SMTP id 46e09a7af769-7020768d1c3mr11157137a34.20.1719934497939;
        Tue, 02 Jul 2024 08:34:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:a6f1:b7be:4c8c:bf62])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f8a695a9sm1603561a34.64.2024.07.02.08.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 08:34:57 -0700 (PDT)
Date: Tue, 2 Jul 2024 17:34:55 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:280
 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
Message-ID: <8386790b-e941-4cb3-b966-fcc10d2b9e6e@suswa.mountain>
References: <4c2dd2d5-1360-4611-b2a6-d63013104a8c@suswa.mountain>
 <3043603.1719933536@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3043603.1719933536@warthog.procyon.org.uk>

On Tue, Jul 02, 2024 at 04:18:56PM +0100, David Howells wrote:
> Dan Carpenter <dan.carpenter@linaro.org> wrote:
> 
> > ... 240  		if (source == NETFS_DOWNLOAD_FROM_SERVER) {
> > ... 241  			if (subreq->start >= ictx->zero_point) {
> > ... 242  				subreq->source = source = NETFS_FILL_WITH_ZEROES;
> > ... 243  				goto fill_with_zeroes;
> > 
> > source == NETFS_DOWNLOAD_FROM_SERVER and we hit this goto
> 
> But we change "source" right before the goto to NETFS_FILL_WITH_ZEROES.  The
> goto then jumps to here:
> 

Ah yes, I missed that.

> > ... 258  	fill_with_zeroes:
> > ... 259  		if (source == NETFS_FILL_WITH_ZEROES) {
> 
> and we match the if-condition.  slice is then set:
> 
> > ... 260  			subreq->source = NETFS_FILL_WITH_ZEROES;
> > ... 261  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
> > ... 262  			netfs_stat(&netfs_n_rh_zero);
> > ... 263  			slice = subreq->len;
> 
> Is the problem that smatch thinks we can fall through to done is source isn't
> any of those four values?  (There are three other source values in the enum
> that apply to the write side)

Yes.  That's the issue.  The kbuild-bot can't use cross function
information so it doesn't know the return values from
netfs_cache_prepare_read().  Probably this warning goes away if you have
the cross function database built.

Sorry for the noise.

regards,
dan carpenter

