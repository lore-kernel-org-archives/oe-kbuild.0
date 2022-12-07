Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B892105
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Dec 2022 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670429923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LL4PHxT4sMk0KCAN3MuaCCJyWZVedAs+T8Qe/e06QmI=;
	b=QQeWD+6CFdkVI++pVPasmJPhNjfxgguw5MTU+caIbfLIyfrA+gnFj7b17yOxND2Z2qrrC1
	ewiYxSyVc+fj/7t/3d0yJUO92YbyaQvHQU1Tw+ancsx/6aT5URM+mX4xGq2heZ6B6+XUpf
	oQFHcOF96gHpNw9yA/3U+wmflzgGg4g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-mGcOGaMENYOq4tlnIpiH-g-1; Wed, 07 Dec 2022 11:18:38 -0500
X-MC-Unique: mGcOGaMENYOq4tlnIpiH-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E89E1101A528;
	Wed,  7 Dec 2022 16:18:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3997E492B04;
	Wed,  7 Dec 2022 16:18:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202212071248.8BB84G9K-lkp@intel.com>
References: <202212071248.8BB84G9K-lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev,
    Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 11514/13282] net/rxrpc/local_object.c:365 rxrpc_unuse_local() warn: variable dereferenced before check 'local' (see line 362)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 07 Dec 2022 16:18:34 +0000
Message-ID: <1504300.1670429914@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1504299.1670429914.1@warthog.procyon.org.uk>

I have a patch for this already, thanks.

David

