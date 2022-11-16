Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569925CB7
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Nov 2022 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668607073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlQynIVqxw448VxZJPqOAC9f29JDiDupGRcPdxJ6UdE=;
	b=XzhGgNeopJRFkWq6qIPrzMsp8Lww+LvoO5S6AClia5mGR1akfyeQCMKMBbIsdFVPoLBum5
	gZFtd+T1K1d4nN//52O0aN/f+mLohFyYUDM9wJ5U3XyRugIMiRom3WdUgrUi55fs2xGlvp
	Y0W6QzrpDOyShoG5rRM1bHN9uuSGcNg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-Qr79_xnxPnKLKmDj4RXvkw-1; Wed, 16 Nov 2022 08:57:48 -0500
X-MC-Unique: Qr79_xnxPnKLKmDj4RXvkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84C71101E9B1;
	Wed, 16 Nov 2022 13:57:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E2722166B29;
	Wed, 16 Nov 2022 13:57:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202211071354.ANknPOk9-lkp@intel.com>
References: <202211071354.ANknPOk9-lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
    GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-ringless-5 29/79] net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol 'skb'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 16 Nov 2022 13:57:43 +0000
Message-ID: <2969791.1668607063@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2969790.1668607063.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <error27@gmail.com> wrote:

> New smatch warnings:
> net/rxrpc/io_thread.c:52 rxrpc_error_report() error: uninitialized symbol=
 'skb'.

Fixed that.

> Old smatch warnings:
> net/rxrpc/io_thread.c:210 rxrpc_input_packet() warn: passing freed memory=
 'skb'

Do you know if that's still there?  "Old" in what sense?

David

