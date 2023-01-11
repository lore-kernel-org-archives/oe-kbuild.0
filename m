Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A81117F2
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Jan 2023 09:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673427823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/lwFqc0RbU1ZRPzdevECqp9uKCKJq+Hp5i0Srukh8I=;
	b=LEgUKySOxQDJI/b5Q7bqPTEwkJEAC91xnZ1mLgdwxdth1hanwIpl78qHlUBP11Y6KqeHwL
	ZDmJjs5QjY2+nAyhNapBDCzmNcNMpnVsFrP7EE2BbjN8QYUtJeQBu1OkCARaEGKSXwGweG
	2tQLvtAJ1u71M6DhBw47JSlerswtzeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-jAhOg0XVOxCXQe-fN22GZw-1; Wed, 11 Jan 2023 04:03:39 -0500
X-MC-Unique: jAhOg0XVOxCXQe-fN22GZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81E2785CCE3;
	Wed, 11 Jan 2023 09:03:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAF9940C2064;
	Wed, 11 Jan 2023 09:03:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202301111153.9eZRYLf1-lkp@intel.com>
References: <202301111153.9eZRYLf1-lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev,
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:pending-fixes 135/296] net/rxrpc/call_object.c:303 rxrpc_connect_call() warn: missing error code 'ret'
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 11 Jan 2023 09:03:38 +0000
Message-ID: <2252769.1673427818@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2252768.1673427818.1@warthog.procyon.org.uk>

Good catch, thanks.  That should be returning -ENOMEM.

David

