Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED47200133
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Sep 2024 08:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351397; cv=none; b=Nc+DmfYpOxEWh/Umc9hw6bLs6ilE8cezNcVbCKrvQKcr3aT+m8ZfrevqRlt/KQN/7HJnBeBQOSu/b5nsmd0nKxYR0KHoOtUh4Qb8sBGZKRltWB9EOPN4R+ztrwoMgv2TqWMKSKjyFytn3kcagTCnK1oI6ejd0Cm/FEji9Xaaydo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351397; c=relaxed/simple;
	bh=NdfdyCASP2adWlXElPuppN38nMXT4UFlT/XgIqagK/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sczfVulTxqHXpXGYdMuwjyyhgJHVeBF0/kdqaYLnndAeag9iLINbFEENIjO2q0Nw75rf/aJ/EK9MTEobgrjGTamaHoGoLXC4oG1RzlFWxtwmyob9Xi2hwUE988wmO3OTAO4hvnNvQCgd6dNvRFO+1KhS7F676YMY+FnM2t/CodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=h8xmtoS5; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="h8xmtoS5"
Message-ID: <1d4958c9-59d4-4fa5-8193-6fccbb3f5679@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725351392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v9SNOfIVruORDdmZOfeJ4Uy+3K4hThSgtfmd0LLphUc=;
	b=h8xmtoS5bbz9Ub+MW6XaGmS3Lm1JCf4fLp6yne0cboFl3PsfOju5AxNnC4izfEAZpTAdVL
	MR95RZ08KcliL+fiTf82/MJEtcjm44bsOrHYb5EOWTcPQJoczhUDnb6DXf6B5eVrhrnx3J
	HvQFzvG32UhF7MJOi+WvXV63sD/xOZE=
Date: Tue, 3 Sep 2024 09:16:29 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/2] net_tstamp: add SCM_TS_OPT_ID to provide
 OPT_ID in control message
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Vadim Fedorenko <vadfed@meta.com>, Willem de Bruijn <willemb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Ahern <dsahern@kernel.org>, Jason Xing <kerneljasonxing@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
References: <150aaaba-a26c-48d4-bc3f-f3b1eeca8b24@stanley.mountain>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <150aaaba-a26c-48d4-bc3f-f3b1eeca8b24@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 03/09/2024 09:06, Dan Carpenter wrote:
> Hi Vadim,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/selftests-txtimestamp-add-SCM_TS_OPT_ID-test/20240902-212008
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240902130937.457115-1-vadfed%40meta.com
> patch subject: [PATCH net-next v2 1/2] net_tstamp: add SCM_TS_OPT_ID to provide OPT_ID in control message
> config: csky-randconfig-r072-20240903 (https://download.01.org/0day-ci/archive/20240903/202409031142.3dSuW9Oo-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202409031142.3dSuW9Oo-lkp@intel.com/
> 
> smatch warnings:
> net/ipv4/ip_output.c:1284 __ip_append_data() error: uninitialized symbol 'hold_tskey'.
> 
> vim +/hold_tskey +1284 net/ipv4/ip_output.c
> 

[.. snip ..]

> ^1da177e4c3f41 Linus Torvalds           2005-04-16  1051
> b7399073687728 Vadim Fedorenko          2024-09-02  1052  	if (cork->tx_flags & SKBTX_ANY_TSTAMP &&
> b7399073687728 Vadim Fedorenko          2024-09-02  1053  	    READ_ONCE(sk->sk_tsflags) & SOF_TIMESTAMPING_OPT_ID) {
> b7399073687728 Vadim Fedorenko          2024-09-02  1054  		if (cork->flags & IPCORK_TS_OPT_ID) {
> b7399073687728 Vadim Fedorenko          2024-09-02  1055  			tskey = cork->ts_opt_id;
> b7399073687728 Vadim Fedorenko          2024-09-02  1056  		} else {
> 488b6d91b07112 Vadim Fedorenko          2024-02-13  1057  			tskey = atomic_inc_return(&sk->sk_tskey) - 1;
> b7399073687728 Vadim Fedorenko          2024-09-02  1058  			hold_tskey = true;
> 
> hold_tskey is never set to false.

Hi Dan,

This was already flagged by Simon, I'll fix it the next version.

Thanks,
Vadim

