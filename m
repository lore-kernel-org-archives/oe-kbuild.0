Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFCC13C82E;
	Sun, 30 Mar 2025 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743351869; cv=none; b=K5OkvVRxB356A9Px+kol8qnwfmpBIVzbDagfHOLvGYB57+0ywqPkCakyWwpFEWaCo9s/ycIEaW4co9/rO36WkZSj6PxdKA8fcb/AmZQ4bFhvbog7k+nbsmsZ1W1kIlcZ+9s3VRLhG4nltYpRwUwLe0azT5MQVlqmI5jKwTicMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743351869; c=relaxed/simple;
	bh=aI2M4oNuU25NFaZ5L72s+Ko/IYnhFbuKKcTZ2fxSHQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kCfc74dnZE7oOs/SXaYGySsh+MHaGMfs/Kz6qQnEPOZ1a7VYMVH06iE6t+tgJTJkf6jfLDOuiLJu37Ln1wRFhAwiWISJZsoG0ugIMQGYWJC3R3yFp+7Qe37Ecv0PaEFiSbUSXDI/QTbqC34D1xG9OvcRb51OFEBojy0cyuwFqVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dahyYVlf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dahyYVlf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C8F2C4CEDD;
	Sun, 30 Mar 2025 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743351868;
	bh=aI2M4oNuU25NFaZ5L72s+Ko/IYnhFbuKKcTZ2fxSHQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dahyYVlffMud7/eq0MB0yxag1CVbkor/nYaUVciV5oZ+zuSZiiqZfmgmo4M63jItn
	 QzmcHIwo0ToI/E4VD4V0akftvusJokf9Ql4mPzBhnxoYR28Q9mGrL9rJIel1kxGsza
	 o0IWY3i3wlxo92KkHn6DEVhrxzPjNaOZk+CGAvwhzGDKxzVbjFWJmXYEcOV3tFPA8g
	 POWRCkh/eVxFDUHJXVRnZgHrKmgAVjVtTagRcilHOim5/Gst1zVC9PlT8W6Wcl+zMD
	 iBLwxEAS4F8TG1QgcQyWLfEfjYbmgneX3fGQ4ydrTfohorqVd88bOxEdKJEQZWFsHu
	 vq+s/2bNZjNCA==
Message-ID: <bfb4739a-abfc-424b-87a0-889316767810@kernel.org>
Date: Sun, 30 Mar 2025 18:24:23 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <171f0c41-b88e-4e27-8819-4195417136fa@stanley.mountain>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <171f0c41-b88e-4e27-8819-4195417136fa@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/03/2025 15:57, Dan Carpenter wrote:
> [ Ancient email got eaten by msmtp. Resending.  -dan ]
> 
> Hi Krzysztof,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/dmaengine-pxa-Enable-compile-test/20250115-031547
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
> patch link:    https://lore.kernel.org/r/20250114191316.857154-1-krzysztof.kozlowski%40linaro.org
> patch subject: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
> config: parisc-randconfig-r072-20250124 (https://download.01.org/0day-ci/archive/20250125/202501252153.wCMpgWlF-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202501252153.wCMpgWlF-lkp@intel.com/
> 
> New smatch warnings:
> drivers/dma/pxa_dma.c:595 clear_chan_irq() warn: variable dereferenced before check 'phy->vchan' (see line 593)
> 
> vim +595 drivers/dma/pxa_dma.c
> 
> a57e16cf03339c Robert Jarzmik 2015-05-25  584  static unsigned int clear_chan_irq(struct pxad_phy *phy)
> a57e16cf03339c Robert Jarzmik 2015-05-25  585  {
> a57e16cf03339c Robert Jarzmik 2015-05-25  586  	u32 dcsr;
> a57e16cf03339c Robert Jarzmik 2015-05-25  587  	u32 dint = readl(phy->base + DINT);
> a57e16cf03339c Robert Jarzmik 2015-05-25  588  
> a57e16cf03339c Robert Jarzmik 2015-05-25  589  	if (!(dint & BIT(phy->idx)))
> a57e16cf03339c Robert Jarzmik 2015-05-25  590  		return PXA_DCSR_RUN;
> a57e16cf03339c Robert Jarzmik 2015-05-25  591  
> a57e16cf03339c Robert Jarzmik 2015-05-25  592  	/* clear irq */
> a57e16cf03339c Robert Jarzmik 2015-05-25 @593  	dcsr = phy_readl_relaxed(phy, DCSR);
>                                                                          ^^^
> if phy->vchan is NULL this will crash


Correct, but my commit only enabled compile testing thus allowed this to
be checked on some popular platforms. Issue was already there.

The code is called pxad_chan_handler(), which already has BUG_ON() on
this, so I expect that condition is not possible.

It would be nice to rewrite the code, but I am afraid it is way too old
platform and no one cares enough.

Best regards,
Krzysztof
