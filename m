Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A2B1B141B
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jul 2024 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720103963; cv=none; b=dEDfIcYh0I6Neqh0B4sZ4A6ssBUcLGKzkTnuEeMb3AJwk3BxPKuX47yL369jaMlaGvCkT5+xE+MRyfxxM42rA090Ur6eScpNHnlMtF2hw3Tk7EniZMu6/bQNtLV5Nzz54FCdzzXd1du4a1Ry3rNY6f/81fhrHlHgsstwhCCnlYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720103963; c=relaxed/simple;
	bh=KqUPrLODUhxCWHE+ObWfrEUBOESaJQDDJqOpp6AAKr0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=aFFYpN0pTWxYNk1XpL05bHM5EKwHbBjFwWh86oJMH3+zHPHfB4FgcPvsXMfLtZ23Hysc9N+S/zcRhL+ee/sCQZGky6t8EsTXg1OGnzaNBOjK0/svfWW5XMwK+SI/g3FmsiZjpI4WFCkslTR7QpqDNQScVijqUxKpCRZt9zGnLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UzyyZGaL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UzyyZGaL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720103960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uc5IoTpoolxAjfPXWEM4B2yjDn3gCKxw0vnQAhDYV2Q=;
	b=UzyyZGaLGn7Im87dC6uRUTzP9xGy92mYBQt+uwj33DpadD1kQVbXl1svEbMExNdYIBOAG/
	dSj/gUPaIRm5JcfTHt7TOxW7anYILAzYBqweeaq3LVyZeHCO61fBxn1Hz7vwcTZMXt6ISC
	lgfUVuyb7lxZxaI7Sd4xS+kClgzlbpA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-YXFcCM31MimCD8cVUOW13Q-1; Thu,
 04 Jul 2024 10:39:18 -0400
X-MC-Unique: YXFcCM31MimCD8cVUOW13Q-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ACC5B19560AA;
	Thu,  4 Jul 2024 14:39:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.111])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 24F861955F65;
	Thu,  4 Jul 2024 14:39:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6cc43674-4d95-49b6-a279-4b0c7f7f4ceb@suswa.mountain>
References: <6cc43674-4d95-49b6-a279-4b0c7f7f4ceb@suswa.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 16/17] fs/netfs/read_collect.c:170 netfs_consume_read_data() error: we previously assumed 'folioq' could be null (see line 110)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 04 Jul 2024 15:39:14 +0100
Message-ID: <3303253.1720103954@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3303252.1720103954.1@warthog.procyon.org.uk>

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> 5a2bec0ed38eec David Howells 2024-07-02  102  	if (WARN_ON_ONCE(!folioq) ||
> 
> Presumably we're never going to trigger this warning...

So I hope.  The only ways to get to this point should involve preallocating a
folio_queue struct and attaching it to the queue pointers (see
netfs_prime_buffer() and netfs_create_singular_buffer()) and we don't
deallocate the queue till the cleanup phase.

The other two have triggered occasionally.  Hopefully, I've fixed all of
those.

David

