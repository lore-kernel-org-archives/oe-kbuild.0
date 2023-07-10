Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8511C93;
	Mon, 10 Jul 2023 13:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iL6xBnycXfjJcjP7tf7y+k3xBTLDL2Uh6N1qhjPtO4o=; b=YgrI5HVuZeQUsWlfou+nx8Vygg
	qY3/JOqicaKY4Etl5bGrjV3MJc33shP9hDzic2tjb29AlTbSuQ/zqC7fb5Ga6pbus3oLGrW6RuIcV
	oSEUvwDxQW0e/UIuxtHOqKeGg3co1Nmdi6mxO2VTk5sXjYwMxmxFNDwA8UXRsRPJT/VuiKlvly1Z1
	5hq9zpacqmzszA5IGxU4ZQgkm83jc+9TTfDgRGzq1T48WYX9KB9HFxIF8t/j8kayM/GuALbIqRavC
	VvPani3QqMpLmEwCQRTfgjCgY7AdwRnbh0pQELq9eeTGOZ0p+oGhXjplPhcnlme0TFyNSQu9+J412
	VpZ6XPWA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qIqxb-00Edaz-CE; Mon, 10 Jul 2023 13:29:51 +0000
Date: Mon, 10 Jul 2023 14:29:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [willy-pagecache:set_ptes 20/38] arch/parisc/kernel/cache.c:383
 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit
 pointer)
Message-ID: <ZKwHz76zg2yk4Y+D@casper.infradead.org>
References: <bfc5670f-bc6b-4a7b-9fe3-eb525bc61f59@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfc5670f-bc6b-4a7b-9fe3-eb525bc61f59@kadam.mountain>

On Mon, Jul 10, 2023 at 09:13:10AM +0300, Dan Carpenter wrote:
> smatch warnings:
> arch/parisc/kernel/cache.c:383 flush_icache_pages() warn: potential pointer math issue ('page' is a 288 bit pointer)

Yep, I got sent that one automatically by LKP yesterday

> fec0c60dfaa0fa Matthew Wilcox (Oracle  2023-02-13 @383) 		page += PAGE_SIZE;
>                                                                         ^^^^^^^^^^^^^^^^^^
> This doesn't make sense, and also we need to re-calculate kaddr on each
> iteration through the loop.  Probably kaddr += PAGE_SIZE?

Exactly the fix I pushed out yesterday around 12:00 UTC
