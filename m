Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBF449F66
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 17:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M7RINvMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703005330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BBJN9nTYT4G7PQYaJDuoGQnNxSt9L28I/CO8DEp0BKk=;
	b=M7RINvMKj7w8/+K9J5Ovcha3NO/WzV/z8aC9FZ+4NT/AXWSXAKf2Npd3ohqweU/7X/1xyc
	UIpBpc7vvNSzPS2khvDIFWVe/kfLY+m9XwutiDFNaUBlC+dCE2R/JZ/AXhVP5gO+wzAozs
	k39fahLmixlRjIANnVVGwILCwhFI8as=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-L-DnWLoKNQmA2W8Andd5Hg-1; Tue, 19 Dec 2023 12:01:59 -0500
X-MC-Unique: L-DnWLoKNQmA2W8Andd5Hg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 619EB85A59D;
	Tue, 19 Dec 2023 17:01:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1B0D2026D66;
	Tue, 19 Dec 2023 17:01:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2515428b-8f7a-40f0-b76d-b2acf264be0a@suswa.mountain>
References: <2515428b-8f7a-40f0-b76d-b2acf264be0a@suswa.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-lib 69/80] fs/netfs/direct_read.c:189 netfs_unbuffered_read_iter_locked() error: uninitialized symbol 'min_bsize'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 17:01:51 +0000
Message-ID: <1075699.1703005311@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1075698.1703005311.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> 9afdab285a8996 David Howells 2022-01-14  187  =09if (test_bit(NETFS_RREQ_=
USE_BOUNCE_BUFFER, &rreq->flags)) {
> 9afdab285a8996 David Howells 2022-01-14  188  =09=09start =3D rreq->start=
;
> 9afdab285a8996 David Howells 2022-01-14 @189  =09=09end =3D min_t(unsigne=
d long long,

I dropped the bounce buffer code for the moment as I dropped the content
crypto patches that use it until I can get round to completing the ceph por=
t.

David

