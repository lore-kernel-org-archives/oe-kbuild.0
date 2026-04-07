Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EE13A872B
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775557884; cv=none; b=QxJ1Sa8alsJH9uAZVrBlzXVSV40AIKBoQ7vIKxpSyovYyjAHdXhGfKzbrYLtHCnWqk5yU2UKsa1IZfYaJwIhX3+8gc4itfwyNQhwr/jhN7bF+QW2U6azAQIImE7nFTOEBpKyZdK4iPZjYitGEKZwarAxKABhU3rCaeaRdv2ir4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775557884; c=relaxed/simple;
	bh=fse4/mw7XTsgfuHVVQjRFWJVGp1/Euz4A7xNtKxpkIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5QMhjGtVkgevuHlF6odfSJEL18V8UiJXtSDglSuYuVsaJoTaL229zJqaIxIKu9ZV3yQHnPYUjqNnCuJ7WHkKCRGAwJxA3jvUrUcPSOEAmCm8THGSyv4dXXn5ADSpDS5CicI73lVFoYlkQuJTn6jYIjrBswVO+q06enjW5iEGl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MVOsyp5y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MVOsyp5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775557882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4lD99YtIEAbiLQ1CDFnTyDVFUE3DC9IG6TDfPBqmULE=;
	b=MVOsyp5yugBaZFxy6UqnVhfKE+tbYrWQHLmrmSosEXcH9aReUk++hhAU0wLQaz0rzr+W//
	WnLwR3T/jSsHJJwxutrbofGPc8dGSM0PD1LkyS9oUYESaqKVdJQ4P2fx0HQCuUc+TEsVGP
	TeMrBxoqYFuu98SV+/wlyhaMTpmh2pA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-lnPLSKD1NJaVKwhCdQ1qig-1; Tue, 07 Apr 2026 06:31:20 -0400
X-MC-Unique: lnPLSKD1NJaVKwhCdQ1qig-1
X-Mimecast-MFC-AGG-ID: lnPLSKD1NJaVKwhCdQ1qig_1775557880
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-794b240c0d3so137994257b3.0
        for <oe-kbuild@lists.linux.dev>; Tue, 07 Apr 2026 03:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557880; x=1776162680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4lD99YtIEAbiLQ1CDFnTyDVFUE3DC9IG6TDfPBqmULE=;
        b=SR1vYp1hZPqrsDpEWKW7PW9rF329L/6Z+caE8qeoKsT/ol1w4VkTfhNUDTxh64CvkT
         kzvF1EDQJ4BXyighb5VifJBVLj1rbMfDBq+UnjhiufHXPXQiKaZYdPDZYE5LSF+Ez7v5
         pTconV21LvTDyjbNw++W5T48BlzBL2ZUEj8WDVPJE+k8MQSfjCgKXqPjbdtxTqcHFdZy
         JKbvFQ8+X9PqI0v+g3S67z/tCFSOhOaFMqbBKsZgn/cnKfrapNY1GjFj458cw6YHUzsd
         a0wFRArHoeVrvd9BX8HzzwHTNko02G5P7MSQIACnZO3aRCtUmCiaqhX3jg57WZj65Fq7
         q9HA==
X-Gm-Message-State: AOJu0YxoATFB0zvb97PIB3bu7ZF1kMm3jtxfQVPEm6E5pCz43fMCYNVS
	4mwx54yHhTLgwmge+XTgNjt7SeXQ3c3z6M2lglKVNX5Y2sCormlYhxruongGCnpbmqp3v2sok3j
	pUHaqMtC6vwS+lblVwr/8plaUWS2zYqwjUlkoVRPjhuqdquHn6kSU4Y3hhTJK0cPCprFNIL5XAM
	EerirxgHmCoyaSikHyhYrhLTX+pSd9yddcRMws
X-Gm-Gg: AeBDiet1FB4QdiROtyhPwMfGuL8YFHW+6Biaw2xRZ1mHauDuF2lNgCC3yJpLgR1bcT7
	v6Pt4kTrKiDB9P9f0nuh1G3nyQJ01P1wL4siD0ZooG1X9Xgbyu9CeBjQ7F8OFuIPXDzdp0guI8C
	jqzeW7T5bXp3VC7ghCZRhCLnBIZ0sz8TpbND3DYpoAmLgtHXOI+ky1N1IILXpGhm4WUnk+F729S
	lq7bViI0W85npf2vUHIIDcgltD52lHTzZ2iTUo6o1m7MJ++YdUaa95jCEudVERaMA==
X-Received: by 2002:a05:690c:6e85:b0:79f:2e53:85f8 with SMTP id 00721157ae682-7a3bb91637cmr145977527b3.3.1775557880334;
        Tue, 07 Apr 2026 03:31:20 -0700 (PDT)
X-Received: by 2002:a05:690c:6e85:b0:79f:2e53:85f8 with SMTP id
 00721157ae682-7a3bb91637cmr145977377b3.3.1775557879897; Tue, 07 Apr 2026
 03:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604071139.HNJiCaAi-lkp@intel.com>
In-Reply-To: <202604071139.HNJiCaAi-lkp@intel.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 7 Apr 2026 12:31:08 +0200
X-Gm-Features: AQROBzAHSmuavjKTfJb18h0s-6xEF8CD_wSRMBk7UvJQqkGtY5MxkpNgeKukvoI
Message-ID: <CAHc6FU4OnGCUYjcdPB-d84wn074TTgPbt35e63s+WvnbDXcanQ@mail.gmail.com>
Subject: Re: [gfs2:for-next 13/17] fs/gfs2/log.c:1183 __gfs2_log_flush()
 error: we previously assumed 'sdp->sd_jdesc' could be null (see line 1136)
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	gfs2@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6XeH918itMnxpAPhSavkK12l_Kz5GTVVsIxyVLxOl6o_1775557880
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 7, 2026 at 11:16=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.g=
it for-next
> head:   80d71795c17ec98352d1059af856ac084a06109a
> commit: 47af62bd5b63da799ea51f53ff93b5f1a3d19046 [13/17] gfs2: add some m=
issing log locking
> config: csky-randconfig-r071-20260406 (https://download.01.org/0day-ci/ar=
chive/20260407/202604071139.HNJiCaAi-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 15.2.0
> smatch: v0.5.0-9004-gb810ac53

this isn't related to commit "gfs2: add some missing log locking";
it's a pre-existing bug. I've pushed a fix to for-next.

Thanks,
Andreas

