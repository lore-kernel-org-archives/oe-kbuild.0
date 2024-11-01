Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010E014A098
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730456790; cv=none; b=p6FqW4MY72N9XUKSk1R5s+fyB2zpT4X1nFtUKy0STl13HWwGNEsmcRYjOk2WQ0G71X0YWGacD4tw09dsjWGvC6p4+DQhZ+XkCKBGNamEJ1NH1486zwj5zmWmzidHFNac6jTq1K5BTUZQ/H7sbspD/pnyeeE9PQnMiVOIjElOc+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730456790; c=relaxed/simple;
	bh=ZBQnZcCyUpNmjXm53ADX+sscRCbBspBBfl7FmERYTEE=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=Ud8SsR2PVyvHIM30M1SXVUXH0jvC0ML5Y9D7AS6kxB55Ajb3ay0Q4JP0WvqzOgwnoV1MJJ61jNSsEo/K9e9BPyvRJM3ojK+oENSrzxiCNsOS1Enz0SmzITQ2xw9HPc9pK/deCGi3OqQAp8uM7fiNMgK2j2rcRCmRURGb0xtV+UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZqAsiA6H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZqAsiA6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730456786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2TNik5nfvN2V7PQjO48Sbf/k6eV7ngGl+x8TquOqCg=;
	b=ZqAsiA6H21Y5BzPOcEq/+HcmtQShHBpzoPj1xapemP+t/IQEy9VVrZm3Ma2DOxzGR+i6Kk
	GcsM+PNZtoMkehb7dhylPu3w1zmQG4ZVXwvOL+77xMK/47yPp4hm/m6xxMXd7DaRzQdDZ4
	XRFNbXm2dnq3HEoPml24f2YRL333d20=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-217-c2G9d8MpOselOv7FHbS3vg-1; Fri,
 01 Nov 2024 06:26:25 -0400
X-MC-Unique: c2G9d8MpOselOv7FHbS3vg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 421891956080;
	Fri,  1 Nov 2024 10:26:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.231])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 57470195605A;
	Fri,  1 Nov 2024 10:26:22 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <35a3ef96-c550-4792-bd32-0b3eae11a3eb@stanley.mountain>
References: <35a3ef96-c550-4792-bd32-0b3eae11a3eb@stanley.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:netfs-writeback 27/30] fs/afs/file.c:357 afs_issue_read() warn: passing a valid pointer to 'PTR_ERR'
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 10:26:21 +0000
Message-ID: <87663.1730456781@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87662.1730456781.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> op is a valid pointer
>=20
> 5d3a97d9f8785ae David Howells  2024-10-10  355 =20
> 5d3a97d9f8785ae David Howells  2024-10-10  356  =09=09if (!afs_begin_vnod=
e_operation(op)) {
> 5d3a97d9f8785ae David Howells  2024-10-10 @357  =09=09=09subreq->error =
=3D PTR_ERR(op);
>                                                                          =
               ^^^^^^^^^^^
>=20
> 5d3a97d9f8785ae David Howells  2024-10-10  358  =09=09=09netfs_read_subre=
q_terminated(subreq);
> 5d3a97d9f8785ae David Howells  2024-10-10  359  =09=09=09afs_put_operatio=
n(op);
> 5d3a97d9f8785ae David Howells  2024-10-10  360  =09=09=09return;

What I want is:

=09=09if (!afs_begin_vnode_operation(op)) {
=09=09=09subreq->error =3D afs_put_operation(op);
=09=09=09netfs_read_subreq_terminated(subreq);
=09=09=09return;
=09=09}

David

