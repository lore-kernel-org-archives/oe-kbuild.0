Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E46286B2
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jan 2024 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705583760; cv=none; b=VqxextoEFZ0tCfqb96NT5IirxPkqCHL9ukH7Rwu+HawPDbTY9A44qDojXmOI+Bh9FCmvSete0oxJ8R2CGd2up+9hSxnPJbHUCMTeR6QklalPKqsPvuH8IlwuUEc+twOomgCE69vgWz/n4AgDtdAWnQcVrmtECx2pcesfji/GrkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705583760; c=relaxed/simple;
	bh=8YyZlZ0QTKJ9J1fL/GRiKwosxOszne4RIcL+UEQuBRY=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:
	 Organization:From:In-Reply-To:References:To:Cc:Subject:
	 MIME-Version:Date:Message-ID:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-ID:
	 Content-Transfer-Encoding; b=FuJc5EsMiFiqUD0rs3HYj0BcWXH+kO8agB+KPsTDpUCngXJfvtEl3rH3FQ/Typu7bk+q5s8RF2lOUIuGxPfSBdrrwNJPsZZA3Vp/AjYRCU3nD7adY4GJOHaOtEf1fXBMckSzuwLpRm9J08pRqtU+Fzp1H7uB5oEJNvOy3GuDMeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fi9cHnGg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fi9cHnGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705583757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlldpXQNnvPFy/7TUljiy7I3BPg7n5zkuBl8hr94548=;
	b=Fi9cHnGg9P+3U0MbvrXxL5UmfE/dwWxvLAcAr5QbViTjq+0IhI2J6VgvOpwXpyp20DN9fB
	CCz72YMmx8jGTgebLn3fdkURZWIYnxr0g7rFbeqGUtC+2IMTyWluUhKh3bnqot17Gr41gm
	ht+T+rYvDs7gbdxscKpZA+57glM57vU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-_qJRLNQOPvSkMAG7VS_10Q-1; Thu,
 18 Jan 2024 08:15:51 -0500
X-MC-Unique: _qJRLNQOPvSkMAG7VS_10Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70E8A3C28663;
	Thu, 18 Jan 2024 13:15:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB9761121306;
	Thu, 18 Jan 2024 13:15:50 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <279d5e84-02b1-45cb-9b0b-17a800723019@moroto.mountain>
References: <279d5e84-02b1-45cb-9b0b-17a800723019@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 6/21] crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 13:15:50 +0000
Message-ID: <3069289.1705583750@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3069287.1705583749.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> b468b20c76d24a David Howells 2020-09-03  112  =09u8 buf[CRYPTO_MINALIGN] =
__aligned(CRYPTO_MINALIGN);

I think the thing to do in all three cases is to make the array length 5 an=
d
leave the __aligned() to get the alignment right.

David

