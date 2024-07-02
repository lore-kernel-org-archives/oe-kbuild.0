Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB41BB69D
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jul 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719933546; cv=none; b=cobj/wF7LyyRMj0T0iH8APp0ZJZVOt0alZ8e1mGFDNJDhJ292xmaW2Yo3ZvGtFjVaOBDIwanSPRhziK0iX0hY00bqP0jEq+nhX3xM13gRZxZarxU3UantXgMtbLmSWgAJqhrLA5gz0Bp5UpeSKcB+zTiBUjN/krbr43IZTpFcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719933546; c=relaxed/simple;
	bh=s2VSoMks5SQueQp0joxL4SlPtg1GfkMy5ebMQtcXUQE=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=W5jfeIvcjFnJod7aOCmv82UkBQf9C+YXVYA8LfxIU0mgQ/Ev8kMi9Z2wt6B1v2OleVFBJuF1aj8jeoe2wZrIFY7OzbeUg8wsfuwlNimr+oHZaGZbUsv2KqjSsrfSdCCz1/TZ1vD0li+530bJGlAACLCGcYCot+MmkJ/auGpjwuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZtvSGTg+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZtvSGTg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719933544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0goqABedANdI2n1Lg1r6zTQrqyYse9lOsb94DmQdRA=;
	b=ZtvSGTg+vfC3cnCvKlLmSNzuJBHHoba09rrLSUra2Fi3duyO1etzgyJ52KogTuXYqXEecW
	LEn6xjxRlVK0/8PCcZjdse+q9azKmHyOP7WLIoEbtGnm5G+CieFHWuy+Z2YHT2oXDvzVva
	PW2UHVZYca79+cr4pwMMJBjZFHR79gs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-L0W69OYwNFC4lEqtEl4dWQ-1; Tue,
 02 Jul 2024 11:19:00 -0400
X-MC-Unique: L0W69OYwNFC4lEqtEl4dWQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 53BAC195608C;
	Tue,  2 Jul 2024 15:18:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 99D9D1956048;
	Tue,  2 Jul 2024 15:18:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <4c2dd2d5-1360-4611-b2a6-d63013104a8c@suswa.mountain>
References: <4c2dd2d5-1360-4611-b2a6-d63013104a8c@suswa.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 17/17] fs/netfs/buffered_read.c:280 netfs_read_to_pagecache() error: uninitialized symbol 'slice'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 02 Jul 2024 16:18:56 +0100
Message-ID: <3043603.1719933536@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3043602.1719933536.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> ... 240  		if (source == NETFS_DOWNLOAD_FROM_SERVER) {
> ... 241  			if (subreq->start >= ictx->zero_point) {
> ... 242  				subreq->source = source = NETFS_FILL_WITH_ZEROES;
> ... 243  				goto fill_with_zeroes;
> 
> source == NETFS_DOWNLOAD_FROM_SERVER and we hit this goto

But we change "source" right before the goto to NETFS_FILL_WITH_ZEROES.  The
goto then jumps to here:

> ... 258  	fill_with_zeroes:
> ... 259  		if (source == NETFS_FILL_WITH_ZEROES) {

and we match the if-condition.  slice is then set:

> ... 260  			subreq->source = NETFS_FILL_WITH_ZEROES;
> ... 261  			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
> ... 262  			netfs_stat(&netfs_n_rh_zero);
> ... 263  			slice = subreq->len;

Is the problem that smatch thinks we can fall through to done is source isn't
any of those four values?  (There are three other source values in the enum
that apply to the write side)

David

