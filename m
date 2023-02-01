Received: from bird.elm.relay.mailchannels.net (bird.elm.relay.mailchannels.net [23.83.212.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64347E
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 00:54:10 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id F2C8C20181C;
	Wed,  1 Feb 2023 00:54:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a221.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7676C2011F8;
	Wed,  1 Feb 2023 00:54:09 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1675212849; a=rsa-sha256;
	cv=none;
	b=sQClwr6czrCSj2BYk3QHFFSL94sLI+7cUMIdxNhmUlXhE1d9UMi2mE+XUB5oYqpRm7wa7n
	/h5UZ1913eyu/vsPPsQoYoNaAG9o0RqpXIngiogOuEOZesp89z7oRiANN7zeoQE4YcF1f4
	ns6T7JqBfzIGOtxFYj+6rgJTUE3VvHWOZ6pKeovNLYu3POgq6oOfXBJZxWaAo/IrFGd2bE
	93S6jgZyXw3uJpBkKm8xvV+vqw20cEfB9LLg6bwwttGonv2ygdzMUQziL5ydibWlR2iVlu
	g0wI3MqSOYJUQZ8E5LXtLSkZ3DoDPeRwlMYxvIMbWjDN9RtKRqM9dkE31M1Hmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1675212849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=GB3eAKWa/B4f4aGpz3wUhDs1isp0x7Qvxa046mYEWF0=;
	b=SNeRq+wF4IdZmhLImaVF5d3BmbqOlE1mkPccVowFKXqy2YyuFupsdM1rSbS3Sbq0SYJx8q
	nJbzANdWG+osPB4umv+tAyNmLBg7oCJR90FY5R0jAbKpOFGYvV2jy01HdUljcAbmw3E1KS
	2KOjGlz1Qy7jCq/pPuHloscMdynuzqdNPUtJb0tRv+Ec6iHGmtd/QjJ/q/s5zMTCnwxzqI
	3kfIxOJPfOSgWzIuLci0TEbCki1oCI9EV5JVHqUfjhUBD/Czvk/gojCL4po5vBAEEf/XPu
	B6P0hN0oTWFjfbA4EsRfyV5RkA+2KqG1NQlIBSqkmhPTG+EWgZIFOlGGJNnZXQ==
ARC-Authentication-Results: i=1;
	rspamd-5fb8f68d88-zgmxp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Well-Made-Abiding: 6f5a8d343d41ad00_1675212849796_2822025892
X-MC-Loop-Signature: 1675212849796:3630125511
X-MC-Ingress-Time: 1675212849796
Received: from pdx1-sub0-mail-a221.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.229.7 (trex/6.7.1);
	Wed, 01 Feb 2023 00:54:09 +0000
Received: from offworld (ip72-199-50-187.sd.sd.cox.net [72.199.50.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a221.dreamhost.com (Postfix) with ESMTPSA id 4P63Mh4YSdz9t;
	Tue, 31 Jan 2023 16:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1675212849;
	bh=GB3eAKWa/B4f4aGpz3wUhDs1isp0x7Qvxa046mYEWF0=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=eN4IYm4c8E7hB7b8LM66qiwoR4WVQcQiC7VwxOR96ndIf4r+0g56LzQGa988+UM+E
	 sXhSF28mid7yzU0PHhfCyKDApw3mJxNmJR4sNX/5H9im+9y0ku9iFVGTgk83aTuo6q
	 VmM2Xj57eWHSv7OytUMokS+sxeWGZZhibh1LipKTfw3qG9gfKmuf0zIMc4qZDOz0kD
	 fO8GNvQiKV2Xx1LzN80iPtsmu3ug+JQ4W4Ws2mmPSfNA3XxiLWaoiFV8+fSA9FU1iD
	 yrd47XfSU/3Dq0W9IUiwXmvqxPKjzqibEC94jWR+r4y0coHpxkAOkpXaLztCKvcRoJ
	 UlJXJlhCqu5IA==
Date: Tue, 31 Jan 2023 16:27:01 -0800
From: Davidlohr Bueso <dave@stgolabs.net>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>, kernel test robot <lkp@intel.com>,
	Jonathan.Cameron@huawei.com, linux-cxl@vger.kernel.org,
	oe-kbuild@lists.linux.dev, Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [cxl:pending 13/21] drivers/cxl/pci.c:511:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <20230201002701.a7lwsouomqvoheso@offworld>
References: <202301291620.DxnDWLoW-lkp@intel.com>
 <20230130215514.6cviyuwhxgjlzj27@offworld>
 <63d991da1c19c_a8e3129488@iweiny-mobl.notmuch>
 <63d993bdecd01_3a36e529454@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <63d993bdecd01_3a36e529454@dwillia2-xfh.jf.intel.com.notmuch>
User-Agent: NeoMutt/20220429

On Tue, 31 Jan 2023, Dan Williams wrote:

>Ira Weiny wrote:
>[..]
>> > Considering MSIs are edge triggered interrupts, this should be benign.
>>
>> I'm trying to understand this a bit more.  So I looked in more detail.  I
>> believe Dan suggested that I could use irq_default_primary_handler() in
>> this case by passing NULL.  And this would handle threading the irq
>> processing for me.
>>
>> It looks from a software standpoint this should work.  But the kdocs
>> really imply that not masking the irq in the handler may be an issue.
>> Thus the 'requirement' of using IRQF_ONESHOT.
>>
>> Is this somehow different with MSI?  Is this a case of the kdocs being a
>> bit out of date for MSI?
>
>My reading, may be from the changelog and not the kdocs, was that at
>request_irq() time it is difficult to discern level triggered vs
>edge-triggered. So for the default primary handler, that does nothing to
>quiet a screaming level-triggered interrupt, just require oneshot mode.

Right and it's only level-triggered that are the problem after done with
the hardirq handler. So in the msi/cxl case we already know that all this
is edge (sent once and forgotten by the hardware), which is why I was saying
it's harmless. It's still probably a good idea to have it explicitly oneshot
semantics as Dan's patch.

Thanks,
Davidlohr
