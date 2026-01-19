Received: from out198-24.us.a.mail.aliyun.com (out198-24.us.a.mail.aliyun.com [47.90.198.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A428689B;
	Mon, 19 Jan 2026 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768809953; cv=none; b=Rl6553PUHSmJGSblCM2o//h9fRx7jYvGSXpT2sEkM4ZRY2oAmOwRvIn9KolhX8xA7F1LmzWkn2e/zGRXLZsjINs+rg+wNvuAFls39V9FNCnznohm7iwITQY3TugewLQZ7znerU1EDCwdRHuP54shmipVT5LMpafN7ygwSnLMj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768809953; c=relaxed/simple;
	bh=DGfEfz6Wxk1No8zy0P6CdqGtrb6VJMMedqu1yoUoH1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2UyHNWwB2Dx2ZF9b4Og5Zq6RznMTMrcZSXrMfHclm4bjZL57WBdBuuwgNiqzXztZ8sXBYERwbgeDAEGXmjprabJNWcbgIUwEhcBvP6TXPwps8J8KI0h5LYzdlnprRnh7z1WZnNXuxkNdaib3ougVh+FXYcnGG9vOS4szcLDQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; arc=none smtp.client-ip=47.90.198.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Received: from 172.38.31.119(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gA6PNzN_1768809615 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Jan 2026 16:00:16 +0800
Message-ID: <7b7b6ae1-be56-45a0-b43c-8a66f054584d@bosc.ac.cn>
Date: Mon, 19 Jan 2026 16:00:15 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
To: Dan Carpenter <dan.carpenter@linaro.org>, haiyuewa@163.com
Cc: Greg KH <gregkh@linuxfoundation.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
 <aW3Znz51bTVj3oxJ@stanley.mountain>
From: yaxing guo <guoyaxing@bosc.ac.cn>
In-Reply-To: <aW3Znz51bTVj3oxJ@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/19 15:13, Dan Carpenter 写道:
> On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
>>
>>
>> 在 2026/1/16 23:16, Greg KH 写道:
>>>
>>> Wait, I already took this a while ago, why was this resent?
>>>
>> After the v3 patch submission, I received error reports from Dan Carpenter
>> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
>> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
>> In response, I’ve submitted a new version (v4) of the same patch, which
>> primarily addresses the issues highlighted in that report (as described in
>> the "changes in v4" section of the cover letter).
>> If there’s anything improper in this process—such as resubmitting instead of
>> replying with fixes or other procedural concerns—please let me know, and
>> I’ll be happy to correct it accordingly.
> 
> Since it's already merged then you will need to send the fixes as a separate
> patch based on Greg's latest devel tree.  Send two patches, one that fixes
> that && vs || bugs and one that fixes the devm_ double free.  Add Reported-by
> tags and the Fixes tags.
> 
> regards,
> dan carpenter

Hi Dan,
I noticed that on January 10, 2026, Haiyue submitted a fix for the issue 
that && vs || bugs:
  https://lore.kernel.org/all/20260109175448.34309-1-haiyuewa@163.com/
Please go ahead and use his patch, and then I will fixed the devm_ 
double free.

Hi Haiyue,
I actually fixed this same issue in v4 of my patch series (dated 
December 23, 
2025)(https://lore.kernel.org/all/aW3Znz51bTVj3oxJ@stanley.mountain/), 
which addressed the bug reported by Dan 
Carpenter(dan.carpenter@linaro.org) and the kernel test robot 
(lkp@intel.com). However, since the original series had already been 
merged by then, a separate fix is needed.
I saw your patch—thanks for picking this up! Could you please add the 
following Reported-by tags to your commit?

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>

