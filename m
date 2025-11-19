Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23183612FD
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559407; cv=none; b=sevq3rxggkmopyPhdTUMls/Fnst1LfdeLIbXKKZ+pfwiywm6BGmPeJCZs5l8LG8vhBO6kivrwRIWH9TYbjJXG4Y5/ueSz6GLOiJgik53HwtKLCeO1N1GYTZu9uZ1fL7zOqsXmrS3y7oiiswDs2wtoSTi5S7amKOg2Gp8LF3GLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559407; c=relaxed/simple;
	bh=GeLGHgCDjsKTwDnSqyacgMo//EZ7m64+j5vZ6s9BwyQ=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=AK+bcVPWOODDzUowniMHpiifKaF+igJcmggR3ZqlFXbIfHWeOp0UUk4jbLB/80k3nR39ujkCz1SDjKMQUZGFkHUmDNRkJKuk59PH1jsXWyQj+VyzG3jWA0MuekAtJ6+vR6Z8YLzp2nk1Nml42UwmKv+emCP28ynSnEhP0aIkiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KV8wICLK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KV8wICLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763559404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53Tcv51IXqdYwcXhvl6+xnbnHXLHniNAPQvOyeubBUk=;
	b=KV8wICLKlFw4RpgLtWIkxnmFclwMXYKXuGWLtL44n/W84Pw8Xnycj5hUsBm0p8b85fJ+QJ
	WkbGSou0JXrySZXYzoRgvhqqD4Hm0LdZu9eXSNiuY+PRK1u+Mjdg0vxQd0Ms9qDFQOovjC
	XG+Q54kjAHirUsTfb1aIDqmvOYjZD7s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-369-FBklytfKMBaV802EZZ66Dg-1; Wed,
 19 Nov 2025 08:36:41 -0500
X-MC-Unique: FBklytfKMBaV802EZZ66Dg-1
X-Mimecast-MFC-AGG-ID: FBklytfKMBaV802EZZ66Dg_1763559400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5485C18AB419;
	Wed, 19 Nov 2025 13:36:40 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F0040195419F;
	Wed, 19 Nov 2025 13:36:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202511150702.M9d2Y8G2-lkp@intel.com>
References: <202511150702.M9d2Y8G2-lkp@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, Steve French <sfrench@samba.org>,
    paalcant@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:cifs-next 5/9] fs/smb/client/transport.c:1071 compound_send_recv() error: we previously assumed 'resp_iov' could be null (see line 1049)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 19 Nov 2025 13:36:36 +0000
Message-ID: <2449461.1763559396@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CiLWDVDWRuDcLU_vlO9Cugd2GR_zyItz_0LoTWjRxzI_1763559400
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2449460.1763559396.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> smatch warnings:
> fs/smb/client/transport.c:1071 compound_send_recv() error: we previously =
assumed 'resp_iov' could be null (see line 1049)
>=20
> vim +/resp_iov +1071 fs/smb/client/transport.c
> ...
> dd3cd8709ed5f4 fs/cifs/transport.c       Shyam Prasad N     2022-04-07  1=
069  =09if ((ses->ses_status =3D=3D SES_NEW) || (optype & CIFS_NEG_OP) || (=
optype & CIFS_SESS_OP)) {
> cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1=
070  =09=09struct kvec iov =3D {
> cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10 @1=
071  =09=09=09.iov_base =3D resp_iov[0].iov_base,
> cb5c2e63948451 fs/cifs/transport.c       Ronnie Sahlberg    2018-10-10  1=
072  =09=09=09.iov_len =3D resp_iov[0].iov_len

Whilst that is true, this is guarded by by the if-statement on line 1069 th=
at
limits it to only certain operations that are guaranteed to have a response
buffer.  At least, I think this is the case, so I've cc'd Steve and Paulo t=
o
confirm.

David

