Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884832142B
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 14:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461583; cv=none; b=hOYDcHrmZpKc5hEj6nA5M91mPgqInfSI6cV8eQKI61juu5oQkWba2ObzXVQKIz/JI64Ux0ATQ4qjLs1wVlt2a2TdSqbezMu+in8Btwuz8y1u5u9ESsURcElTuMOkv4JrARYUA6zflzZ+0SR21sllwqwFyHdM4f+qqsWlLUhSgeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461583; c=relaxed/simple;
	bh=0hG1QjIkWIfhocmwTRXnXu3qV5JYo6/t3gNgOnTcMBU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=TXUuBZ92DBfVj0KecbKA/lRdTYofwxxHOdfoIyM19BIQG7nu3CIZQtx//DkzxRCkF3ufqYx/CnqxgSN+1qkmMfwElI2/wZyhmR5jFlCOw4+/CHNJC5Jo5W1Z/wyIvnl/LnCg6XR9jFlRzBa0HvJWlz2lkMiNFzBKHdXoJr7PRwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fjAg7wy0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fjAg7wy0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772461581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pO7nnLi7UW4tWy7PIEl56a/uNI1PWrPELBHJi4rpaTs=;
	b=fjAg7wy0bqMZsAHMZGd2elUggSEURo5hXfQGTgfTTnHPtWTA0Y1u0bzNUS1TQ6tTgZ/os+
	G+KFnXP4gkCxMZmWrgWxVj8GPyrUR78APcPHoEuCGOnalVhg8TSgZy9/4dnxTSOtJ7rE7y
	nEf8RcLsmTDnKeB9e7XTC5QOo3UjO54=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-21J3nBu5PHa1VJ2vb8lNYg-1; Mon,
 02 Mar 2026 09:26:18 -0500
X-MC-Unique: 21J3nBu5PHa1VJ2vb8lNYg-1
X-Mimecast-MFC-AGG-ID: 21J3nBu5PHa1VJ2vb8lNYg_1772461577
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69C051800370;
	Mon,  2 Mar 2026 14:26:17 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.45.224.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8287A1956053;
	Mon,  2 Mar 2026 14:26:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202603011130.BCCzYGYx-lkp@intel.com>
References: <202603011130.BCCzYGYx-lkp@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-next 5/16] fs/netfs/bvecq.c:299 netfs_shorten_bvecq_buffer() error: we previously assumed 'bq' could be null (see line 289)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 14:26:13 +0000
Message-ID: <1409207.1772461573@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JkK1dS5ehKVCwi0jjoXilmGf4uPcjwyV_0Y0KAeZiio_1772461577
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1409206.1772461573.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

>   int netfs_shorten_bvecq_buffer(struct bvecq *bq, unsigned int seg, size=
_t size)
>   {
>   =09ssize_t retain =3D size;
>  =20
>   =09/* Skip through the segments we want to keep. */
>   =09for (; bq; bq =3D bq->next) {
>   =09=09for (; seg < bq->nr_segs; seg++) {
>   =09=09=09retain -=3D bq->bv[seg].bv_len;
>   =09=09=09if (retain < 0)
>   =09=09=09=09goto found;
>   =09=09}
>   =09=09seg =3D 0;
>   =09}
>=20
>  break statements.
>=20
>   =09if (WARN_ON_ONCE(retain > 0))
>   =09=09return -EMSGSIZE;
>   =09bq->bv[seg].bv_len +=3D retain;
>       ^^^^^^
> NULL dereference.

I think I should just remove this line.  retain can only be 0 here.

David

