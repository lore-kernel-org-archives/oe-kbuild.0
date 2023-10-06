Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A92C1F5FA
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Oct 2023 13:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qcghnba4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696597836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t6/0hD9us3oMSwUFBPhtHG90hc2VOQ2YZMrfMVtamBQ=;
	b=Qcghnba4ohA9VH2PBvYu1ywU+7AFhUfwDh1LhkASpdaoEHoSLAKxdJS4NJh9aWTVWvYbB1
	2SIcN9W6Ka7lSF8z9M74cO5WpUXXfoAUB13dVVCHXFmgn9+J9ELOAH1I4WWmyPtsKF4jrr
	SC8WD7rnO/Ia5PvYK1ulDinFOIYveIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-1-M1fgWNUrNYSdchyHG1mVvA-1; Fri, 06 Oct 2023 09:10:33 -0400
X-MC-Unique: M1fgWNUrNYSdchyHG1mVvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CF78039CB;
	Fri,  6 Oct 2023 13:10:32 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.226])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 141A447AD4A;
	Fri,  6 Oct 2023 13:10:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2d2355da-ccdf-43f5-a11b-d671f634e3d3@kadam.mountain>
References: <2d2355da-ccdf-43f5-a11b-d671f634e3d3@kadam.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:cifs-netfs 35/44] fs/netfs/direct_write.c:54 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 14:10:31 +0100
Message-ID: <4045379.1696597831@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4045378.1696597831.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> aa24264b7eba3e David Howells 2022-02-21  34  	int ret;

I'll just init it to 0, thanks.

David

