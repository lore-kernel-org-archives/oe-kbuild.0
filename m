Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228F28DA1
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Jan 2024 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705587334; cv=none; b=R024MiwQ4kRMzEpMWyqHuyvYf4oj68YWYdjUqJOowUjDytc+oy9NQVkWsb8HbCkJswdQzVofZVPdGB8g83PHfNQmIAve95OqAq2nn1FulJq/NVC0/9p2BXmKzkK/FdJcuEokap/0tIu8owo17eLrfZa8P1QNbaKEIHwkTUJzaZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705587334; c=relaxed/simple;
	bh=KOoO40rOI3e24A76d6DRdCTmAY8Rh63QKHMoQ3abtGM=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:Received:
	 Organization:From:In-Reply-To:References:To:Cc:Subject:
	 MIME-Version:Date:Message-ID:X-Scanned-By:X-Mimecast-Spam-Score:
	 X-Mimecast-Originator:Content-Type:Content-ID:
	 Content-Transfer-Encoding; b=k5o3UR+4ceIxTGBaPStf4AZGvDNeAlJefXOcRAlhPmcHb/BMJiIR3r17YXXmso/YmDDQb9Mg+TNSjnu1cO9dwig2V9bXNMgnPj8Ks6WxftYGZAGOT+nVAfUkmErzUbapn7cQ+pmYE/CpUlLRFWDhplm/zCAKXAS+wPjNxI0C6FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9zPcd3I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9zPcd3I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705587331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOoO40rOI3e24A76d6DRdCTmAY8Rh63QKHMoQ3abtGM=;
	b=X9zPcd3Iy1M2jF7fxFbcJnrBfps4a71ZfnUt/NMhXMfNDr7YQTIk3wft6pRGW4/QACAS6P
	PCwIr6EPFKkrZMkFbOhrhSfnxXQXk4ZIRfeqb6ayfbYyQKquOpir4tf/FS+FiTY6BntikS
	M5KGTs+Q/q0qdrDug9+mgmMPZ9fuDDc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-636-L9_yXtwUO_Sc2klgOnKmvA-1; Thu,
 18 Jan 2024 09:15:30 -0500
X-MC-Unique: L9_yXtwUO_Sc2klgOnKmvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B71321C07F3A;
	Thu, 18 Jan 2024 14:15:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E9937111DCF0;
	Thu, 18 Jan 2024 14:15:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2b6ee4cb-cc6d-4484-bea3-f60fd9d90fae@kadam.mountain>
References: <2b6ee4cb-cc6d-4484-bea3-f60fd9d90fae@kadam.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dhowells@redhat.com, oe-kbuild@lists.linux.dev, lkp@intel.com,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 4/19] crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4 <= 4
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 18 Jan 2024 14:15:28 +0000
Message-ID: <3087097.1705587328@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3087096.1705587328.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dan Carpenter <dan.carpenter@linaro.org> wrote:

> smatch warnings:
> crypto/krb5/kdf.c:116 crypto_krb5_get_Kc() error: buffer overflow 'buf' 4=
 <=3D 4
> crypto/krb5/kdf.c:161 crypto_krb5_get_Ke() error: buffer overflow 'buf' 4=
 <=3D 4
> crypto/krb5/kdf.c:206 crypto_krb5_get_Ki() error: buffer overflow 'buf' 4=
 <=3D 4

I've changed the buffer to be size 5 instead of CRYPTO_MINALIGN and left th=
e
alignment to the __aligned() qualifier.

David

