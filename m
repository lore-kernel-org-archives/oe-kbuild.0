Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A80125116
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jan 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705583865; cv=none; b=EIrP5aPMZvsqz1d/bEsDqO7gk2o8d0rF4PKlEiKmeXUk/2NWjOLqAWdzn3ayXHwLnVQ3EeJRuGiS08385zAJF3RL8istezc7IFBLrn05RCSLwMOhYTaQQDEv7kb+0EuURy5kgh66vrc2j5kTV9sVMrS+OFkoosPyZlXghjdu0x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705583865; c=relaxed/simple;
	bh=sB7c3/5ARDv+EkDBgs5HsXh3nPcIbdJoWtrqQ2E4c3Q=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:
	 Organization:From:In-Reply-To:References:To:Cc:Subject:
	 MIME-Version:Date:Message-ID:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-ID:
	 Content-Transfer-Encoding; b=sBr/jhkn4cPeSc6H3G0HbJ72DIlT+6aOHhXg9TETOxusY5T+GI4gkFaSGFxsVVY/BlzJwHSMaCVwqKfDcg6hP5xBu8pIojq14d6imydTxBzwH/3u3PahzCEtke/m+jShYHpjTL1/H5H5F/CePqr0Ib/LlXAs6ISYdUP9LmukXPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Swv66781; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Swv66781"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705583863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKT6foQk+lV7zhmvuTeFHG6oudC+PKyN8ksOwFHzHjI=;
	b=Swv66781AnVciTb+oHc6nIn3W+hkJ6fxJnQ1dx/btrNzMFj60knlW0RCiX0lsavRQY9pmI
	ZM5win/AeLUySTCwF+NjylfDRJwN9ReTVO41DAI88XUaQ9vy5OrWUEsvBhafo12P/10wWs
	24cFkRlbYePyuXrdBHlcmylXmdJMEVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-kyeFg8zvOYOwF5CXrndT8w-1; Thu, 18 Jan 2024 08:17:39 -0500
X-MC-Unique: kyeFg8zvOYOwF5CXrndT8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DF2287DC01;
	Thu, 18 Jan 2024 13:17:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F3242166B33;
	Thu, 18 Jan 2024 13:17:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <0c5f40aa-f889-4e07-884d-a09aa12548c8@moroto.mountain>
References: <0c5f40aa-f889-4e07-884d-a09aa12548c8@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 7/21] crypto/krb5/rfc3961_simplified.c:127 rfc3961_calc_H() warn: use 'gfp' here instead of GFP_KERNEL?
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 13:17:36 +0000
Message-ID: <3069736.1705583856@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3069735.1705583856.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> 214632aabe1103 David Howells 2020-09-03 @127  =09desc =3D kzalloc(desc_si=
ze, GFP_KERNEL);
>=20
> s/GFP_KERNEL/gfp/

Yeah.  I'll make that change.

David

