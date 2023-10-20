Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F359369
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Oct 2023 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U8m5Mlus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697761295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8O1DQaljt+H62I0tLGc0kqUm5sOIzb3IYEn38CgT4Vc=;
	b=U8m5Mluseg7woVYfNNzXYDubTzJnAdd8r3jd66itHKH6xiMSdi3OtEE9/eUufar8MqqPrU
	Gs0SbJ44Qruk+VpCKn/U38eluYMUbiXb2Vx7INOIat8m0Eg+Xeb2amN/IkOM1Vxivxkv5E
	ORyQHUG4GQMs4KhrHPrzldjhKKn1Pww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-bzvGtZerN-G9XP76KmwirQ-1; Thu, 19 Oct 2023 20:21:32 -0400
X-MC-Unique: bzvGtZerN-G9XP76KmwirQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D3E87A9FD;
	Fri, 20 Oct 2023 00:21:31 +0000 (UTC)
Received: from localhost (unknown [10.72.112.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AC74111D794;
	Fri, 20 Oct 2023 00:21:29 +0000 (UTC)
Date: Fri, 20 Oct 2023 08:21:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Philip Li <philip.li@intel.com>, oe-kbuild@lists.linux.dev,
	Lorenzo Stoakes <lstoakes@gmail.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <ZTHIBjMAsKxE4EbK@MiWiFi-R3L-srv>
References: <f82be227-bfde-439a-b339-1b4ee370d59a@kadam.mountain>
 <ZS+dSd9Z6/2wU0Eg@MiWiFi-R3L-srv>
 <89caf59a-d3b9-409d-b1ae-9e370cb9ee7d@kadam.mountain>
 <ZS/LrhcxcMOgiiX5@MiWiFi-R3L-srv>
 <ZS/TVMT9ed7OdyNy@rli9-mobl>
 <ZS/2k6DIMd0tZRgK@MiWiFi-R3L-srv>
 <20231018085248.6f3f36101cbdfe0990c8b467@linux-foundation.org>
 <ZTCURc8ZQE+KrTvS@MiWiFi-R3L-srv>
 <20231019095030.7a1f3c93bc18511f52524aa8@linux-foundation.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019095030.7a1f3c93bc18511f52524aa8@linux-foundation.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

On 10/19/23 at 09:50am, Andrew Morton wrote:
> On Thu, 19 Oct 2023 10:28:21 +0800 Baoquan He <bhe@redhat.com> wrote:
> 
> > I think this is not a real runtime bug. The only chance it can hapen is
> > when (flags == VMAP_BLOCK) is true. That has been warned and could never
> > happen. I updated patch log and paste v2 here. 
> 
> Thanks, I updated the changelog in-place.

Thanks, Andrew.

