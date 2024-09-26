Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734005647F;
	Thu, 26 Sep 2024 10:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727345734; cv=none; b=F7HXatC1hnpAB0a04NY4oQ0k85j5UeQhJwFXxZPATrofxAZdGvijaY7xMELh/1MuoV6b4lCLLq5oQpgnFD0eJ9xes4jvrrm2DnLBCgAwSeu0G0vJ4xWuj9PNA4ZlNzsX9qs8buGb/YEBcpiqwKDx9jS4tHqtuieGXHtBY7BKj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727345734; c=relaxed/simple;
	bh=kINb+jw4F0MkllBNLvRkeh3xx3jqh2k8qHgQ59Zzb3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4bsKsEt1CvvuDY6POHBaCts0BseTtUQELV0IDRuFZqVhWdGvaNOK1NlHPUPNOUl9PrEQW2N/FXKDCgGft9dDmdwaHI2f8S8BL9fprV0C1SjDgbfjz8VnhGShYgAvJLzp12wSx5ITj6ORhhXyikyHJEBIjfTftxY9jvByamPTd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=axikU6MG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="axikU6MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727345732; x=1758881732;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kINb+jw4F0MkllBNLvRkeh3xx3jqh2k8qHgQ59Zzb3k=;
  b=axikU6MGDwRojdUuuDSvG4NFROp1+WE30kYeSTpLM2efPX4bFbDaHj4A
   Uw6bRwUFsDjod35XFkpJ9QbfX70CeT/ZuFg/rC6CXkrpuA5mxDuOCSKkF
   hkd3ScVQTpoupG8NLHmimf6syulkshIveNM/pSCJD6BdYniH7Qz3HsaE1
   RJoGMf59MdxZJukNKHYKF3gCOhFCZrNkih09lT0RRqLtgOeNPAvt9cdMh
   BfEhFUc0tiu5e4vToftkwnW2pSriDzaetYPsL4xAi1p9AxdhJC309AsEo
   LRWWP5NyKZXa+nfyctnK6Mc/6bY4bQp6l+c8GycyJ5hG7XRozzupsriVb
   Q==;
X-CSE-ConnectionGUID: nA7GnoNOTUKQ+lfbrg6Hhw==
X-CSE-MsgGUID: h+w1hm/CRle5cHdboFWb+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="37100461"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="37100461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 03:15:31 -0700
X-CSE-ConnectionGUID: 69vM9s0MQeyidzWjIpqTCg==
X-CSE-MsgGUID: 3b6S4xL4QLWDqvQRAhAvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="102871794"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 03:15:29 -0700
Message-ID: <a0ee0cda-e824-43df-a72b-83bb2cdafc74@linux.intel.com>
Date: Thu, 26 Sep 2024 13:17:38 +0300
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mnyman-xhci:for-usb-next 9/10] drivers/usb/host/xhci-ring.c:1405
 xhci_handle_cmd_set_deq() error: uninitialized symbol 'stream_ctx'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <b40140f7-cfd8-4cd4-b442-4d3d4318c5db@stanley.mountain>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <b40140f7-cfd8-4cd4-b442-4d3d4318c5db@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.9.2024 17.31, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git for-usb-next
> head:   645eb2ce6b3e541d3c651f136da8a16f76799526
> commit: fdd9a29e9139a8988b65dce295dfc3f089003ae0 [9/10] xhci: trace stream context at Set TR Deq command completion
> config: powerpc64-randconfig-r072-20240925 (https://download.01.org/0day-ci/archive/20240925/202409252250.WNZonX5o-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
> 

> fdd9a29e9139a8 Mathias Nyman    2024-09-12  1364  	if (ep->ep_state & EP_HAS_STREAMS && ep->stream_info) {
> 
> stream_ctx is only initialized when ep->stream_info is non-NULL.
> Could we change this condition to:
> 	if ((ep->ep_state & EP_HAS_STREAMS) && cmd_comp_code == COMP_SUCCESS) {
> instead?

Thanks, this would work, but I'd like to keep the trace message below in cases
where the ep->stream_info is valid but command is not successful.

> 
> fdd9a29e9139a8 Mathias Nyman    2024-09-12  1365  		stream_ctx = &ep->stream_info->stream_ctx_array[stream_id];
> fdd9a29e9139a8 Mathias Nyman    2024-09-12  1366  		trace_xhci_handle_cmd_set_deq_stream(ep->stream_info, stream_id);
> fdd9a29e9139a8 Mathias Nyman    2024-09-12  1367  	}
> fdd9a29e9139a8 Mathias Nyman    2024-09-12  1368
> c69a059783b241 Xenia Ragiadakou 2013-09-09  1369  	if (cmd_comp_code != COMP_SUCCESS) {
> ae636747146ea9 Sarah Sharp      2009-04-29  1370  		unsigned int ep_state;
> ae636747146ea9 Sarah Sharp      2009-04-29  1371  		unsigned int slot_state;

...

> ae636747146ea9 Sarah Sharp      2009-04-29  1400  		 */
> ae636747146ea9 Sarah Sharp      2009-04-29  1401  	} else {
> 9aad95e292f58d Hans de Goede    2013-10-04  1402  		u64 deq;
> 9aad95e292f58d Hans de Goede    2013-10-04  1403  		/* 4.6.10 deq ptr is written to the stream ctx for streams */
> 9aad95e292f58d Hans de Goede    2013-10-04  1404  		if (ep->ep_state & EP_HAS_STREAMS) {
> fdd9a29e9139a8 Mathias Nyman    2024-09-12 @1405  			deq = le64_to_cpu(stream_ctx->stream_ring) & SCTX_DEQ_MASK;
>                                                                                            ^^^^^^^^^^
> Warning.  My guess is that if cmd_comp_code is success then ep->stream_info but
> it's hard to tell without more context...

Most likely yes if endpoint has streams.

I'll fix this

Thanks
Mathias
