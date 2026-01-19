Received: from out198-25.us.a.mail.aliyun.com (out198-25.us.a.mail.aliyun.com [47.90.198.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022533F37E;
	Mon, 19 Jan 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811905; cv=none; b=sBkuKRsGY2DfZTWBFZPgkbGrdQuy7BaDkYKkKb5Aa95UrmPOtQHYj6PLqoM8nDMpmnUiqzf8Y8SUEfMM7oebaG+wpHQI8PD+lvLToye3R0h7lJKDaKqUVHgYvXZ8Qm8Bf2SSszAcbShRJ/6Q3zrioAj4VbOpvcXtooP0TQ4UuE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811905; c=relaxed/simple;
	bh=dqOb3KSis4pJyMXenpRR8LQonoOtkTxc6dp3suiPhmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6sRopiWo7saNMxLZ8H6GHc9dPGwL5+t3e/C5nrWCMvTJldo9b1ctK6AqcckkIRU1EX7Diw5Ok1N3nUoPBRf3vn6qAdspDqAA6Sh+/4popWIt+xFQjctQZvgI70mAD6kytI9rWpkbjBH7fNWA8gbyHPFbYrXvDbhl2F2oMeh8D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn; spf=pass smtp.mailfrom=bosc.ac.cn; arc=none smtp.client-ip=47.90.198.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bosc.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bosc.ac.cn
Received: from 172.38.31.119(mailfrom:guoyaxing@bosc.ac.cn fp:SMTPD_---.gA69hzT_1768811881 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 19 Jan 2026 16:38:02 +0800
Message-ID: <7f8ddc11-0de7-401e-9a05-4d05579f8787@bosc.ac.cn>
Date: Mon, 19 Jan 2026 16:38:01 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
To: Haiyue Wang <haiyuewa@163.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
 <aW3Znz51bTVj3oxJ@stanley.mountain>
 <7b7b6ae1-be56-45a0-b43c-8a66f054584d@bosc.ac.cn>
 <b0a45763-1cd2-4638-80a9-bd88fee9d729@163.com>
From: yaxing guo <guoyaxing@bosc.ac.cn>
In-Reply-To: <b0a45763-1cd2-4638-80a9-bd88fee9d729@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/1/19 16:23, Haiyue Wang 写道:
> 
> 
> On 1/19/2026 4:00 PM, yaxing guo wrote:
>>
>>
>> 在 2026/1/19 15:13, Dan Carpenter 写道:
>>> On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
>>>>
>>>>
>>>> 在 2026/1/16 23:16, Greg KH 写道:
>>>>>
>>>>> Wait, I already took this a while ago, why was this resent?
>>>>>
>>>> After the v3 patch submission, I received error reports from Dan 
>>>> Carpenter
>>>> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
>>>> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
>>>> In response, I’ve submitted a new version (v4) of the same patch, which
>>>> primarily addresses the issues highlighted in that report (as 
>>>> described in
>>>> the "changes in v4" section of the cover letter).
>>>> If there’s anything improper in this process—such as resubmitting 
>>>> instead of
>>>> replying with fixes or other procedural concerns—please let me know, 
>>>> and
>>>> I’ll be happy to correct it accordingly.
>>>
>>> Since it's already merged then you will need to send the fixes as a 
>>> separate
>>> patch based on Greg's latest devel tree.  Send two patches, one that 
>>> fixes
>>> that && vs || bugs and one that fixes the devm_ double free.  Add 
>>> Reported-by
>>> tags and the Fixes tags.
>>>
>>> regards,
>>> dan carpenter
>>
>> Hi Dan,
>> I noticed that on January 10, 2026, Haiyue submitted a fix for the 
>> issue that && vs || bugs:
>>   https://lore.kernel.org/all/20260109175448.34309-1-haiyuewa@163.com/
>> Please go ahead and use his patch, and then I will fixed the devm_ 
>> double free.
>>
>> Hi Haiyue,
>> I actually fixed this same issue in v4 of my patch series (dated 
>> December 23, 2025)(https://lore.kernel.org/all/ 
>> aW3Znz51bTVj3oxJ@stanley.mountain/), which addressed the bug reported by 
> 
> I just checked the linux-next, found no fix about '&&', without 
> searching deeply. :)
Yes, what I meant is that I was about to submit a separate patch to fix 
the && vs || bug, but I happened to notice your commit from January 
10th. Therefore, I decided not to send a duplicate patch and will defer 
to yours instead.
However, would it be possible to add the following Reported-by tags to 
your patch?

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>

> 
>> Dan Carpenter(dan.carpenter@linaro.org) and the kernel test robot 
>> (lkp@intel.com). However, since the original series had already been 
>> merged by then, a separate fix is needed.
>> I saw your patch—thanks for picking this up! Could you please add the 
>> following Reported-by tags to your commit?
> 
> I saw the patch was merged: https://git.kernel.org/pub/scm/linux/kernel/ 
> git/gregkh/char-misc.git/commit/?h=char-misc- 
> linus&id=054e1c0e6114aaf08672c5ad25d796362bc7e76b
> 
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Reported-by: kernel test robot <lkp@intel.com>

