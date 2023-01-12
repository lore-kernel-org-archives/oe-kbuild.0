Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24B2107;
	Thu, 12 Jan 2023 10:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673519126; x=1705055126;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=IaECBzDUan2KBbV6EKk1rdiaT1Y5QOXZN3CME44A6Fw=;
  b=hxXIU0x9wRJCLbWrIcHnUAK8/ejDZ7GToxSINOPBxpN64BgYE7cNP42M
   iPaA06+BVH6X11mhncc6gtjuNgb6hO9Y724EYMKdHnXmed0DC3wFwqzWq
   NSLIO59oqSufKc9GuIwTGV3wUz4qmA4N+IRElVXXvmKZj8p/o7AiWJKVC
   vVb6+8ZZw1rhVSc48eL/vijBCbe+ceKIYMQA7ffWWgiVk1pmm4BbiXQ5H
   vS7lxt2z37P0loYHoz3l+HXfYZixAy4UT/7wjYZBDKa+1HqMt3JynO/0c
   cJdOm2JT60YqugkXseBq16jvMsSdbQbOyRl6Tm9J/wQGp6uSXNhCaDrWY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="307187512"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="307187512"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 02:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831641787"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="831641787"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 12 Jan 2023 02:25:23 -0800
Message-ID: <1c8f94a1-0c0e-ee52-0552-6a61e4769b57@linux.intel.com>
Date: Thu, 12 Jan 2023 12:26:44 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202301120409.BgsBqbgf-lkp@intel.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [mnyman-xhci:feature_interrupters 4/4]
 drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error:
 we previously assumed 'ir' could be null (see line 1866)
In-Reply-To: <202301120409.BgsBqbgf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.1.2023 6.31, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mnyman/xhci.git feature_interrupters
> head:   8cbab306777ebb0805f5201b6add5ee53eb6659e
> commit: 8cbab306777ebb0805f5201b6add5ee53eb6659e [4/4] xhci: add support to allocate several interrupters
> config: nios2-randconfig-m031-20230111
> compiler: nios2-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> 
> smatch warnings:
> drivers/usb/host/xhci-mem.c:1872 xhci_remove_secondary_interrupter() error: we previously assumed 'ir' could be null (see line 1866)
> 
> vim +/ir +1872 drivers/usb/host/xhci-mem.c
> 
> 8cbab306777ebb Mathias Nyman 2023-01-09  1861  void xhci_remove_secondary_interrupter(struct usb_hcd *hcd, struct xhci_interrupter *ir)
> 8cbab306777ebb Mathias Nyman 2023-01-09  1862  {
> 8cbab306777ebb Mathias Nyman 2023-01-09  1863  	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
> 8cbab306777ebb Mathias Nyman 2023-01-09  1864  	unsigned int intr_num;
> 8cbab306777ebb Mathias Nyman 2023-01-09  1865
> 8cbab306777ebb Mathias Nyman 2023-01-09 @1866  	if (!ir || !ir->intr_num || ir->intr_num > xhci->max_interrupters)
>                                                      ^^^    ^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Why is zero invalid?  I would have expected this to be >= instead of
>> .  Is this a base 1 array?  Ideally these checks are impossible and
> could be removed.

Yes, should be >=, thanks for pointing that out.

Interrupter zero is special. It's the mandatory primary interrupter that must always be
preset when host is running. So this code is not allowed to remove the primary interrupter.
Secondary interrupters can be added and removed on the fly.

I should add a comment about this in the code.

Thanks
Mathias

