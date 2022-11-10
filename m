Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C2E1382
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Nov 2022 09:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668072413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dXMmk1dIsvJJC4p1F1PNV4fJxyDwKPtKoVEuulMoOj0=;
	b=LUuzIgcHntRiaJkcP3eguw2wMTjLzkyntqAWBU+IWzBNhrsf2KNcs4zFDvm8pqgQhUk+hP
	haaJsJ7UGt1ezIS6P+bX4C853D0to/xNG3ebahwyoJYhxggXDhDYH4nr7Z1J4MwIq5rw/G
	6YpgwU/uxCiNm4SVXtendKvCr7/i8Ok=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-jsl_XemTNMCVLH5tMzE13A-1; Thu, 10 Nov 2022 04:26:47 -0500
X-MC-Unique: jsl_XemTNMCVLH5tMzE13A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56681811E67;
	Thu, 10 Nov 2022 09:26:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 797581121330;
	Thu, 10 Nov 2022 09:26:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202211100616.HvYb1VNT-lkp@intel.com>
References: <202211100616.HvYb1VNT-lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
    GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-5 19/77] net/rxrpc/input.c:519 rxrpc_input_data() warn: passing freed memory 'skb'
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 10 Nov 2022 09:26:45 +0000
Message-ID: <2898142.1668072405@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2898141.1668072405.1@warthog.procyon.org.uk>

Dan Carpenter <error27@gmail.com> wrote:

> We can't use "skb" after skb_unshare().  It means we dropped our
> reference to the skb.  The other reference holder probably holds a
> reference so it will probably work, but it could also race and lead to
> a use after free.
> 
> This only affects tracing code and not regular runtime but it's still a
> bug.

Nothing in rxrpc_eaten_skb() actually dereferences the skbuff pointer.  The
tracepoint merely logs the address.

David

