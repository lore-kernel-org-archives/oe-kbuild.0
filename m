Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631E61B0112
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103100; cv=none; b=hrsneElHVmUaGBYoXIEsfR0b6yOIeftIqEl2P7YsNBGra3eHR5yRTPEb93ld7305EWmpZ3tIVmqXauSNS0dcriMHCaDuoQT87ihZk1z5wA0LzRmQh1qQD1ms9h8meBuyul3ATjuQ2KkCybm1ICf3MJDP3KFuZWK1LlORK53oSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103100; c=relaxed/simple;
	bh=Oqc1kIvawjDD3JjU/rwE9hsGmIBdWcUho5wv1EzGPUc=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=A2NQh8Oo8NkHQgKRaTMMlUoTefGCXqZayDGCUk1A1jlzYkVJeWv/Dh+PkHc6BZWCLvpywy7RJujMkJmlfCoeHs10TVL46f6EltrAzAOS+aVgmPnnXpqruuaihcGC9bY1THxvpUPkbb+PNg54yVfsz1ETx3vetpQhfyzc46vSpho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKGGSnYR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKGGSnYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720103098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Viy8HdaN4+40puNKdYZufZ+ZXeaWYcdygO3ONj2dCJ8=;
	b=UKGGSnYRMKJ2AFXzByASMz6QDl5pC/Oo0XloiVNddY8ccTXnynoJ/bqRiHzP/kD9W7aVu5
	4qi4fBuIVsuQnQYBRGa+bN0DJlaa6h/74J/NrAnRRecIIaoXVSPwiY5kp4HtAhdWuwozr3
	Vyk3+9aSutjlQn1jOR0Ym8515PZrD60=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-7My1DXewOoyl3hrRXAtX8g-1; Thu,
 04 Jul 2024 10:24:54 -0400
X-MC-Unique: 7My1DXewOoyl3hrRXAtX8g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E29681955F44;
	Thu,  4 Jul 2024 14:24:52 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5CA851956046;
	Thu,  4 Jul 2024 14:24:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <8386790b-e941-4cb3-b966-fcc10d2b9e6e@suswa.mountain>
References: <8386790b-e941-4cb3-b966-fcc10d2b9e6e@suswa.mountain> <4c2dd2d5-1360-4611-b2a6-d63013104a8c@suswa.mountain> <3043603.1719933536@warthog.procyon.org.uk>
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
Date: Thu, 04 Jul 2024 15:24:50 +0100
Message-ID: <3302713.1720103090@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3302712.1720103090.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> > Is the problem that smatch thinks we can fall through to done is source
> > isn't any of those four values?  (There are three other source values in
> > the enum that apply to the write side)
> 
> Yes.  That's the issue.  The kbuild-bot can't use cross function
> information so it doesn't know the return values from
> netfs_cache_prepare_read().  Probably this warning goes away if you have
> the cross function database built.

I'll think about adding a catchall or something.

> Sorry for the noise.

Better the noise now than a bug report later ;-)

David

