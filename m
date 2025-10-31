Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13891285419;
	Fri, 31 Oct 2025 18:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761935030; cv=none; b=LMrtVsHcHViJmht6zmL25YNrfCdLD4qfDHqJcFho4ews7MVaQ0+U2sZ+NAL7xHbItimj5Z9erK4mOv8Tfh1HOy+3czDseHCITtb3tHvgtgAk9oIdmM9GvC1MyBemASaXaZPz5kTBGYfVxRj7pQyUqzu8Nz+VQ4rhXOPApJb4tDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761935030; c=relaxed/simple;
	bh=+sbJ8F3HRWogh8OeY2duVBJR4vM7IFRxLJUNF2ldLCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1ZdQN4S+Ml3FZV0w++vl1wcj5GSSQ3ozKJZfh9CZmKCCgoi/LyXaIun80j87Wc2PdCbT6RM6QQx2WnOjjl2iv9OGoYEPe039ACIryOlUAyHFnzMdEHVlawr0MneMVLkYySpKkoS1MZ7wTb5SZV2OUXftIFhFZxn6UiqgKqn+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=BHYRbl2+; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="BHYRbl2+"
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cyq9s6wb9zm0pKP;
	Fri, 31 Oct 2025 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1761935024; x=1764527025; bh=zB1rmgUwdiozuvnR7IhHdNzq
	9JIOa0Zu/yFnWs7LhQg=; b=BHYRbl2+8xETTSkaVl/LuobI5oGyC4XBu32vmfQ7
	EOfdeTt/KXQxeUCYhebWiDPl/SMzxn/H0w2mB7uejXnm9q5VfFNJLiDIvOSZ9dS1
	unm85oAY5oNOc21L03oeJ3BnqUk6qs/sNZj3AgKYIbzBSjErF5zOxbe9CwXKvGpQ
	eyJWdYnvVjoyT9np3wZdUTzBe9vTqsqvEcgYX2VdCtwKBhpFEhxePdWxwjCs5QCz
	ECTDiac/u8+7whb2Z/YJfhiSjhHiuGJT1eScLaxMgvNBQpdkwjiPPxkA4j4Z+nTp
	hE5JSqSD1AmIYc06cJVUYa5V54SxocWGv9v/fKSPIZqNYw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id cKCUum0AZ-xQ; Fri, 31 Oct 2025 18:23:44 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cyq9n2lYRzm0ytk;
	Fri, 31 Oct 2025 18:23:40 +0000 (UTC)
Message-ID: <fd51be38-8000-48e8-a5a0-0289904d4756@acm.org>
Date: Fri, 31 Oct 2025 11:23:39 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Avri Altman <avri.altman@sandisk.com>
References: <202510311328.Is1wMfkq-lkp@intel.com>
 <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>
 <aQT5iXgmRCzaa_xZ@stanley.mountain>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <aQT5iXgmRCzaa_xZ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/25 11:01 AM, Dan Carpenter wrote:
> These are from the zero day bot so how they are generated is mysterious.
> The zero day bot thought the patch was 3 days old.  I think someone did
> a merge or something.
> 
> I re-ran it on that branch and there were three warnings.  The "literal
> zero" is a style issue thing so I haven't published that check.
> 
> drivers/ufs/core/ufshcd.c:2955 __ufshcd_setup_cmd() warn: variable dereferenced before check 'cmd' (see line 2950)
> 
> drivers/ufs/core/ufshcd.c:6849 ufshcd_err_handler() warn: inconsistent returns '&hba->host_sem'.
>    Locked on  : 6696
>    Unlocked on: 6688,6849
> 
> drivers/ufs/core/ufshcd.c:9035 ufshcd_device_init() info: returning a literal zero is cleaner

Hi Dan,

The inconsistent returns issue for hba->host_sem has been fixed on 
Martin Petersen's fixes branch but unfortunately that fix is not yet
present on his for-next branch.

I plan to include a fix for the "variable dereferenced before check
'cmd'" complaint.

Is it expected that I don't see the above reports if I run smatch
myself? This is what I see if I run smatch (commit 2fb2b9093c5d 
("sleep_info: The synchronize_srcu() sleeps")):

$ make drivers/ufs/ C=2 CHECK="smatch -p=__kernel__"
   CHECK   scripts/mod/empty.c
   CALL    scripts/checksyscalls.sh
   CHECK   drivers/ufs/core/ufshcd.c
drivers/ufs/core/ufshcd.c:1536 ufshcd_clk_scaling_suspend_work() warn: 
ignoring unreachable code.
drivers/ufs/core/ufshcd.c:1551 ufshcd_clk_scaling_resume_work() warn: 
ignoring unreachable code.
drivers/ufs/core/ufshcd.c:1616 ufshcd_devfreq_target() warn: ignoring 
unreachable code.
drivers/ufs/core/ufshcd.c:1761 ufshcd_suspend_clkscaling() warn: 
ignoring unreachable code.
drivers/ufs/core/ufshcd.c:1777 ufshcd_resume_clkscaling() warn: ignoring 
unreachable code.
drivers/ufs/core/ufshcd.c:1910 ufshcd_ungate_work() warn: ignoring 
unreachable code.
drivers/ufs/core/ufshcd.c:2095 __ufshcd_release() warn: ignoring 
unreachable code.
drivers/ufs/core/ufshcd.c:9450 ufshcd_setup_clocks() warn: ignoring 
unreachable code.
   CHECK   drivers/ufs/core/ufs-sysfs.c
   CHECK   drivers/ufs/core/ufs-mcq.c
   CHECK   drivers/ufs/core/ufs-debugfs.c
   CHECK   drivers/ufs/core/ufs_bsg.c
   CHECK   drivers/ufs/core/ufshcd-crypto.c
   CHECK   drivers/ufs/core/ufs-fault-injection.c
   CHECK   drivers/ufs/host/tc-dwc-g210-pci.c
   CHECK   drivers/ufs/host/ufshcd-dwc.c
   CHECK   drivers/ufs/host/tc-dwc-g210.c
   CHECK   drivers/ufs/host/ufshcd-pci.c
drivers/ufs/host/ufshcd-pci.c:45 __intel_dsm_supported() warn: always 
true condition '(fn >= 0) => (0-u32max >= 0)'
   CHECK   drivers/ufs/host/ufshcd-pltfrm.c

Thanks!

Bart.
