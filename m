Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7B63FD156
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Mar 2026 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462830; cv=none; b=VXsNdP1tN6SEC3JZBC15BH8VrtHQckI9+OrRw5RO8uFJX3QQb4dKLON+WFlokBiBLR/1xDVlUOf4dSsfhdGwcjooLdxX8C3HOFl2xgDRxM1FaQnXrmCtcsUdM4gpJ7V64VSyPKsERH/ffQUrvueqe+ylY1vPs/x6LYRAxib1dwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462830; c=relaxed/simple;
	bh=lFaVpBDMVckcopr2zeCg2SsVMYfdP3orDdCTDaWmc/0=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=TQvlhLOK4Ag9LpdYfri91MGHBEmL7FRysmFNvGcFrgbVjEMNvFgRWaraTJbtf44voK8cV8mkTkbGlPuVZTCG7/pguaiaWLSFvAEHikoOYm+wqzYo56hC8X4apAY//GeSxMZcGWd6+qxyiSb5rNgKWet9kIchBPxsrhIg69CsmFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmyHPTQ0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmyHPTQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772462828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l8ldJK7DOHN6VTwoFTFzdASy/2kR+CmChdK9wuzdqro=;
	b=ZmyHPTQ0kuXhrNaAFSObRn9zeCGI74R6xh8OZV2h5UWNJE07L02scNh+rDlr1L/DC+UhbO
	/uHt80w6sKMFn6TiU9NuZr1E3cvjmtfl3qyTEY6URq5JZZh1D1CxEhhwiFFesFNgQAMY2Y
	y4YuMHPEKytELuqHK7uWbrevKIeW820=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-1QMJFQ13OEWN9LaEzo9fhw-1; Mon,
 02 Mar 2026 09:47:07 -0500
X-MC-Unique: 1QMJFQ13OEWN9LaEzo9fhw-1
X-Mimecast-MFC-AGG-ID: 1QMJFQ13OEWN9LaEzo9fhw_1772462826
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35DBB1800473;
	Mon,  2 Mar 2026 14:47:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.45.224.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A372519560A7;
	Mon,  2 Mar 2026 14:47:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aaV8D4RTkIrcn6jd@stanley.mountain>
References: <aaV8D4RTkIrcn6jd@stanley.mountain> <202603011243.LsWeX4QE-lkp@intel.com> <1276684.1772450239@warthog.procyon.org.uk>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-next 10/16] fs/netfs/write_issue.c:850 netfs_writeback_single() warn: inconsistent returns '&ictx->wb_lock'.
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 02 Mar 2026 14:47:03 +0000
Message-ID: <1439398.1772462823@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6j74NJdMnAWzJQahFFpALtS3x4HKakWLUSg1YxdVpU0_1772462826
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1439397.1772462823.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> a1cee75a302b7a David Howells 2026-02-28  842  cleanup_free:
>=20
> But the goto cleanup_free gotos are still holding the lock.

I see it now, thanks.  I'm going to move cleanup_free: and change the end o=
f
the function:

--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -839,11 +839,12 @@ int netfs_writeback_single(struct address_space *mapp=
ing,
 =09 */
 =09ret =3D netfs_wait_for_write(wreq);
=20
-cleanup_free:
 =09netfs_put_request(wreq, netfs_rreq_trace_put_return);
 =09_leave(" =3D %d", ret);
 =09return ret;
=20
+cleanup_free:
+=09netfs_put_request(wreq, netfs_rreq_trace_put_return);
 couldnt_start:
 =09mutex_unlock(&ictx->wb_lock);
 =09_leave(" =3D %d", ret);

David

