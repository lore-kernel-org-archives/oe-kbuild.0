Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD631EB2A;
	Mon,  1 Jul 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719849843; cv=none; b=gzgLED+3EqPxtiGvNY0USsUbOapx9b49M5KyNaGJgynvBExZYNnxYqedCfRVQKzJWoS4v5L40PEUkvUf6gO9jWVp07AxDY7cY/6F9Sjg2T3DIARSLQZfc9PpoF6E+lU+69BvZ1rzufZIn2O8WTAd8pPepmK+QSjc8O4z7sY52zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719849843; c=relaxed/simple;
	bh=Ncc2u0dfi/qZXgqjjWXijDTJpzD6N6PXFjDszPiRG6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WFUWi8h+lOiEiboPTlYgOEsji5MGI2z8ihbSecVDwAzra99VAbau0B7Umyv26gC+g8rcehUHZ1bm50dyhQRBWWUsa8fFhLs8GT/LI9um7RB5rPK4gnuYv0W2FgKbTHUBkt2EZbv1tW/Xcfc41/XGQNzbyNW3TdOwBk0pe+gOFPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOxBDd1v; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOxBDd1v"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7527afa23cso139851766b.2;
        Mon, 01 Jul 2024 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719849840; x=1720454640; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/SrMxtrz7LAQuY8vI7PqlKykLRpuSLQicS/UxKRRXTs=;
        b=SOxBDd1vF4aXVdHyywyHEOIdhOKqK3LhqaIN/D9g1buUFntq8gJhn/w2E6zCmfBsCV
         xaF/kUJBTcwUoSrpLSse97ZQFDorYrj2Bz3OJEtsEJc5yMt1fsz8blGhh0+dU/IMLQHm
         sRJiXr6UgOIgfGf39NmCXzRkdVRotzg2cMQ6oauSr/HecCexiano9RNlI5FO4wFkpT2V
         KAN5grMRkUzZH2H247veJhiDyV7Efk64mQISXqMeKgNLEeoU7Uwa+3XddeGo8u55Q1Hr
         3BmCiantqKl3jj4A8q71GxLe+YDFyIGEyQQMCMWV5XRGFo2KgGwjv/psmspp253Fc9Jz
         eltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719849840; x=1720454640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/SrMxtrz7LAQuY8vI7PqlKykLRpuSLQicS/UxKRRXTs=;
        b=TpYPeAkRJUQlzBpEfKcH+r7rMn72XG/Mso5+ycpXqdIV7DzyggF0BJJlAba3GIaV9A
         qxKO3Xa6xZQThlJYex0ncmhn0ftG93Svf2xwxcQvXLs8ZlIr4V/VTRMf7D0yxr9f92Co
         GkYRRznc+kwQ6+y7k7oXGqHLi2taP5hv/Ptx283o99Fi6V8A14tnhfdyHIlsGwbGW2Lb
         2qKxDMfOnmDzIx8L4Jh6vf2o3ecZ0r5iUv5m/IWsGgrR0xcAAwByzUv0iLoB3yxbko7W
         4dlePzg5ajLSEn9b9qG6yy9zBeGKWyl1HWWDBW2gBC9H6ycSRTTS92YfSZjell1aolfC
         ss8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbViO/jOp4cyyYNvjSSLBHviNAGpukdp7By/XRtniM6jQL3RB5rAZnzSBt6woZHvNWxVhX9Ep20tCcJp3og2n87sQUEMDrmRZajjenkdkISnXzDAj0fPDPA1geWR5b8zyQVUDz8Wi6+Q==
X-Gm-Message-State: AOJu0YyvUpWq5WgbBrI778KTgEOtbMcQb6XVV7VOAACgCOnbFqnTaGBR
	TUI9QCN3B4LivCRXLf9Ya68OKOdX0wKpWH7d+ZLhMfkXcw2m5Y6w7Auguw==
X-Google-Smtp-Source: AGHT+IEerM11FXLEKylsNAc6/LcsY2zGyQ51sYzOG5kRO6EQmEM18njKFk6jbiEzBXIrL1EQPukqWw==
X-Received: by 2002:a17:907:d15:b0:a6f:ad2f:ac4b with SMTP id a640c23a62f3a-a7514467831mr558160266b.2.1719849840268;
        Mon, 01 Jul 2024 09:04:00 -0700 (PDT)
Received: from [192.168.42.242] ([163.114.131.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf1cfc8sm348500166b.15.2024.07.01.09.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 09:03:59 -0700 (PDT)
Message-ID: <4d20aa4e-a542-48f0-a93c-0fc7aca4dbc3@gmail.com>
Date: Mon, 1 Jul 2024 17:04:10 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:zcrx/next-6.10-rebase 30/35] io_uring/zcrx.c:812
 io_zcrx_recv_skb() warn: check likely/unlikely parentheses
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <75318c18-bf2a-427d-b9bb-aa54fa3e0a3c@suswa.mountain>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <75318c18-bf2a-427d-b9bb-aa54fa3e0a3c@suswa.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/24 16:44, Dan Carpenter wrote:
> tree:   https://github.com/isilence/linux zcrx/next-6.10-rebase
> head:   1bc9807cd5e670cbc5f1a650daf7470d33fb94d7
> commit: 217b71934ad9ee4fffd5eb975aae285911a16052 [30/35] io_uring/zcrx: prevent endless unresponsive execution
> config: x86_64-randconfig-161-20240626 (https://download.01.org/0day-ci/archive/20240626/202406261243.sPJ6xyvQ-lkp@intel.com/config)
> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202406261243.sPJ6xyvQ-lkp@intel.com/
> 
> smatch warnings:
> io_uring/zcrx.c:812 io_zcrx_recv_skb() warn: check likely/unlikely parentheses
> 
> vim +812 io_uring/zcrx.c
> 
> f9ab1c1cb8fd3a David Wei      2024-03-05  800  static int
> f9ab1c1cb8fd3a David Wei      2024-03-05  801  io_zcrx_recv_skb(read_descriptor_t *desc, struct sk_buff *skb,
> f9ab1c1cb8fd3a David Wei      2024-03-05  802  		 unsigned int offset, size_t len)
> f9ab1c1cb8fd3a David Wei      2024-03-05  803  {
> f9ab1c1cb8fd3a David Wei      2024-03-05  804  	struct io_zcrx_args *args = desc->arg.data;
> f9ab1c1cb8fd3a David Wei      2024-03-05  805  	struct io_zcrx_ifq *ifq = args->ifq;
> f9ab1c1cb8fd3a David Wei      2024-03-05  806  	struct io_kiocb *req = args->req;
> f9ab1c1cb8fd3a David Wei      2024-03-05  807  	struct sk_buff *frag_iter;
> 4eb3e10e62f790 Pavel Begunkov 2024-03-05  808  	unsigned start, start_off = offset;
> f9ab1c1cb8fd3a David Wei      2024-03-05  809  	int i, copy, end, off;
> f9ab1c1cb8fd3a David Wei      2024-03-05  810  	int ret = 0;
> f9ab1c1cb8fd3a David Wei      2024-03-05  811
> 217b71934ad9ee Pavel Begunkov 2024-04-17 @812  	if (unlikely(args->nr_skbs++) > IO_SKBS_PER_CALL_LIMIT)
>                                                      ^^^^^^^^^^^^^^^^^^^^^^^^^
> unlikely() returns true/false.  Surprised checkpatch doesn't catch this.

Hah, no wonder throttling stopped working, thanks!


> 217b71934ad9ee Pavel Begunkov 2024-04-17  813  		return -EAGAIN;
> 217b71934ad9ee Pavel Begunkov 2024-04-17  814
> 4eb3e10e62f790 Pavel Begunkov 2024-03-05  815  	if (unlikely(offset < skb_headlen(skb))) {
> 4eb3e10e62f790 Pavel Begunkov 2024-03-05  816  		ssize_t copied;

-- 
Pavel Begunkov
