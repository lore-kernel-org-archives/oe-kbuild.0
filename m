Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB4234FF59;
	Mon, 19 Jan 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768812519; cv=none; b=hau4roRKzrc7wswgtCiQFGjqLlFvHTGT9r4q+Uzb5W3XC3TZWnPhoq2siWOH5YEdCzP4kgTjEkYgTI9QSt7aIrFre1SW5o1SOwMaBmYIKpcWt5bgK7hh2APUKBO/YikyHCscsHufLic1nyZ051buQ8LLbhX+1wNfF2gXQ0++k8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768812519; c=relaxed/simple;
	bh=9C9eQs791WgDgEDU3Zmo4B0kj2HmYPjar7jagA6iqMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=geNcW4hzsFGoacLvegbC7WtVMbFz0VTMCgvbRpvIQ+LJDD2gHMnWx/VOKXFYcPNn7BP0xfWidblGM2FSSQJgXIY/g8RlveNR8y95pmYU77cvTHjnO4q9WMx1QYrA/XPaIpXeqEHSvwhY/R6AFs3xq2JsO2Ps6c4vSmVg3cMdhXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oLBr+ArD; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oLBr+ArD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=QJ+0U+bGLE9iFquggiNYmVXi3CjMuvosmLpB/VpbiPo=;
	b=oLBr+ArDFyL4nkr11CnLaCR+LD6nA2b134VN2IItXXoO0fD+spsUa2fOPCTK84
	U4mkwvJpFC1IBFv177u75DuorPjpqF1Ye7GfVvIhcAg/O96KtlpfBRDqzgbi5RJg
	M0BrVdENOxmF+Ce7SV9hJOP4Vqs9IzcYt2UIo9HiJUP0Y=
Received: from [192.168.11.52] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgAXgK7G721pNjSdNg--.29766S2;
	Mon, 19 Jan 2026 16:48:07 +0800 (CST)
Message-ID: <11657a45-0d80-4f04-8eae-19fab4f43bbf@163.com>
Date: Mon, 19 Jan 2026 16:48:06 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] uio: Add SVA support for PCI devices via
 uio_pci_generic_sva.c
Content-Language: en-US
To: yaxing guo <guoyaxing@bosc.ac.cn>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, oe-kbuild@lists.linux.dev,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <20251223045409.15700-1-guoyaxing@bosc.ac.cn>
 <2026011643-coastline-playtime-0ac5@gregkh>
 <2026011603-dorsal-unblessed-cdb2@gregkh>
 <5483bb2f-04a7-468c-923f-0a62b94fc0e6@bosc.ac.cn>
 <aW3Znz51bTVj3oxJ@stanley.mountain>
 <7b7b6ae1-be56-45a0-b43c-8a66f054584d@bosc.ac.cn>
 <b0a45763-1cd2-4638-80a9-bd88fee9d729@163.com>
 <7f8ddc11-0de7-401e-9a05-4d05579f8787@bosc.ac.cn>
From: Haiyue Wang <haiyuewa@163.com>
In-Reply-To: <7f8ddc11-0de7-401e-9a05-4d05579f8787@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgAXgK7G721pNjSdNg--.29766S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr1rKF4fGw48AFWkZw1UJrb_yoW5uw47pa
	yUWan8JrWDtr1xJwsFyr4FyFW7tw4rJw1UWrn8Wr1rArs09r1IqFyIgrWj9FykWr4fK3y7
	tr4YqasFv34qyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRCksgUUUUU=
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzQnjT2lt78lntwAA3a



On 1/19/2026 4:38 PM, yaxing guo wrote:
> 
> 
> 在 2026/1/19 16:23, Haiyue Wang 写道:
>>
>>
>> On 1/19/2026 4:00 PM, yaxing guo wrote:
>>>
>>>
>>> 在 2026/1/19 15:13, Dan Carpenter 写道:
>>>> On Mon, Jan 19, 2026 at 02:16:21PM +0800, yaxing guo wrote:
>>>>>
>>>>>
>>>>> 在 2026/1/16 23:16, Greg KH 写道:
>>>>>>
>>>>>> Wait, I already took this a while ago, why was this resent?
>>>>>>
>>>>> After the v3 patch submission, I received error reports from Dan 
>>>>> Carpenter
>>>>> dan.carpenter@linaro.org and the kernel test robot lkp@intel.com (see:
>>>>> https://lore.kernel.org/r/202511280815.WV9iCJZb-lkp@intel.com/).
>>>>> In response, I’ve submitted a new version (v4) of the same patch, 
>>>>> which
>>>>> primarily addresses the issues highlighted in that report (as 
>>>>> described in
>>>>> the "changes in v4" section of the cover letter).
>>>>> If there’s anything improper in this process—such as resubmitting 
>>>>> instead of
>>>>> replying with fixes or other procedural concerns—please let me 
>>>>> know, and
>>>>> I’ll be happy to correct it accordingly.
>>>>
>>>> Since it's already merged then you will need to send the fixes as a 
>>>> separate
>>>> patch based on Greg's latest devel tree.  Send two patches, one that 
>>>> fixes
>>>> that && vs || bugs and one that fixes the devm_ double free.  Add 
>>>> Reported-by
>>>> tags and the Fixes tags.
>>>>
>>>> regards,
>>>> dan carpenter
>>>
>>> Hi Dan,
>>> I noticed that on January 10, 2026, Haiyue submitted a fix for the 
>>> issue that && vs || bugs:
>>>   https://lore.kernel.org/all/20260109175448.34309-1-haiyuewa@163.com/
>>> Please go ahead and use his patch, and then I will fixed the devm_ 
>>> double free.
>>>
>>> Hi Haiyue,
>>> I actually fixed this same issue in v4 of my patch series (dated 
>>> December 23, 2025)(https://lore.kernel.org/all/ 
>>> aW3Znz51bTVj3oxJ@stanley.mountain/), which addressed the bug reported by 
>>
>> I just checked the linux-next, found no fix about '&&', without 
>> searching deeply. :)
> Yes, what I meant is that I was about to submit a separate patch to fix 
> the && vs || bug, but I happened to notice your commit from January 
> 10th. Therefore, I decided not to send a duplicate patch and will defer 
> to yours instead.
> However, would it be possible to add the following Reported-by tags to 
> your patch?
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> 

In fact, I just catched the error by reading the code directly when I saw:
https://www.phoronix.com/news/Linux-6.19-char-misc

without knowing the report.

But I'm fine to add more information in the patch if re-sending is truly 
needed, since the patch has been merged already.

>>
>>> Dan Carpenter(dan.carpenter@linaro.org) and the kernel test robot 
>>> (lkp@intel.com). However, since the original series had already been 
>>> merged by then, a separate fix is needed.
>>> I saw your patch—thanks for picking this up! Could you please add the 
>>> following Reported-by tags to your commit?
>>
>> I saw the patch was merged: https://git.kernel.org/pub/scm/linux/ 
>> kernel/ git/gregkh/char-misc.git/commit/?h=char-misc- 
>> linus&id=054e1c0e6114aaf08672c5ad25d796362bc7e76b
>>
>>>
>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> Reported-by: kernel test robot <lkp@intel.com>

