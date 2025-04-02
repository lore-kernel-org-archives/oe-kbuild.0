Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD2235BFB
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 11:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593581; cv=none; b=EEeIA4RunHs7+119vSTt3sdrAVZ04jtlMjCdBzgQt9KDEwbzLg+BJa+w995pY/mslqfQ5e3kspUKV2reaQL75vOoSyIsccb094Qm2kKQbN1JChweWoP7TfBn25LZTsQndXh4dd3WlTq2/T/C866dymNyYhVFY7pRG54JNvyAVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593581; c=relaxed/simple;
	bh=NSHHXkJ1tdlESET5LSrFPeyPuHcIC7igrK7vFnnpCws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig8gfcZHBth+9+xkUjzUgi+hmqlwF2m4I4rGGY9NLUBNXUcPZ4GIye7y1chyTFYwvaC5KhYxoyulSuYR0P9OpipFeVF5Mwq4zOWo2i83zsikQum6hmniad/j/j7K/31UJsw8n5PUovkwTL2OfbzFJT1tLEhee1XQRuviq7P3QuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GUDzrjmx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GUDzrjmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743593577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vrrxM2R/n26o2IbUYM60U5krcmc81pp8xMQUnsna9i0=;
	b=GUDzrjmx5+MvzmGeqLAhvS28MxZKmsuaINLgPFsvethW3vlMgD7QOtgRXTgCOvjwA+1qRN
	B0mB6GJnKk50zeWHezKu+QpaW7nOIax/XTONn9lFrcEMtjBMFUdWA+qg/xPA8B0xlFqkf0
	3pa8M5mVSTBbAcVcYY1ugP7SQxBZtYs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-npSMAacjO_GPwx4xCoL5kw-1; Wed, 02 Apr 2025 07:32:56 -0400
X-MC-Unique: npSMAacjO_GPwx4xCoL5kw-1
X-Mimecast-MFC-AGG-ID: npSMAacjO_GPwx4xCoL5kw_1743593575
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso50852655e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 02 Apr 2025 04:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593575; x=1744198375;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vrrxM2R/n26o2IbUYM60U5krcmc81pp8xMQUnsna9i0=;
        b=bjrBlWDaJ0xnAqyX+NHxvKZmEGYpO5SrnYQI4BVYsdqpxdrCdsa2WeJwynL+6yaqdS
         xqiF0o39X7GX+VR2mnzYWfEMyi6q0ZWweb2ao2Zn2qXsmejmqJJacJbE+BxJAOGeR8DM
         fu15F1T8/rrOwoUBVCCoD3IfhyG+vmzaL/QST8U32/m41qgClYDZKGGz2wdco1kOq+wO
         HdFFsrDsv3Gb7hkqFA36Fkq8V5FeC/ccTwAM5hLxe99YXu4Q2wKyw/sqhYvkDi/PC6Kd
         Wx64RbnFXxtY9VTb6G9P67d9nTMKG/3NNKvIFiZclNQEtv6DqZg7IQGXboP+adkB/fMm
         3IYw==
X-Gm-Message-State: AOJu0YzAQVuY2BbTY37CNbN0ZJ2cisbu20SobPhA3+4lsyU29fTgbPnD
	8BjzGF6Hn6y2ARVO1YqEu8FYW87Vkn5mvjPneuM3d4HOoebmdTCrZjraXbuZGNgb7Yvja0S5Gnx
	pLVxN0yh8ZP8WaYFBv7sVAKyj8TGRpGC/1QBhEpgDkZyLaAyNbF6nbDB1vw==
X-Gm-Gg: ASbGncsmasNWI9qOFW0aT1BiGodl9wvM9h1kyT3DkuTCH0OKLAREzqiKFSbZDkDEDO5
	zBbEDhYeGMzuwo3zIRFdPgitXoZZrhESsm8Yay5LT3mY7vsVA9SfLct7l7nLDjgzhwH/0qW80/Y
	dmH/XucyzNS43Rt8iuyeCE84swb/j0yDGFlR4NTcXDn0OWq/cjeXqfD5fPpbArm2vRpjeVajFY1
	Q7UlOdAu77le7CMepAmvZd9hyjgfHeeMG6ESr9jKcgbbvxgcS22372zDpzYjRP/IA8bazuIhIk0
	AqTKavO8+FyoYoIpxaJajkSa1RuHFFif29/bJzbAuK2xHRRlcwOrtJLw73w35Nl/gHTRFlcZtmy
	XwO9ZqtkxFque/K3yhvUcDlyv7v6taNuGZxMzFXge
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-43db622a023mr162288225e9.12.1743593574813;
        Wed, 02 Apr 2025 04:32:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWqCGyPtUbWcGe6dZoyHiMwN3+nBsydFLJ/82Te+9WGpzh5ZdeDPh2ySgmPMvNrWkGxCnEfA==
X-Received: by 2002:a05:600c:474a:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-43db622a023mr162287905e9.12.1743593574455;
        Wed, 02 Apr 2025 04:32:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70f:cd00:4066:4674:d08:9535? (p200300cbc70fcd00406646740d089535.dip0.t-ipconnect.de. [2003:cb:c70f:cd00:4066:4674:d08:9535])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60cd77bsm17634385e9.19.2025.04.02.04.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 04:32:53 -0700 (PDT)
Message-ID: <b21bcd61-faf0-4ad8-b644-99794794594f@redhat.com>
Date: Wed, 2 Apr 2025 13:32:52 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
References: <202503270941.IFILyNCX-lkp@intel.com>
 <9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <9b3b3296-ab21-418b-a0ff-8f5248f9b4ec@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U6dHtmupIz7rXUnV5HkOqJPXh2WgyxavrVHLDb5rA8Q_1743593575
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.04.25 13:19, Lorenzo Stoakes wrote:
> On Thu, Mar 27, 2025 at 09:59:02AM +0800, kernel test robot wrote:
>> BCC: lkp@intel.com
>> CC: oe-kbuild-all@lists.linux.dev
>> In-Reply-To: <20250325191951.471185-1-david@redhat.com>
>> References: <20250325191951.471185-1-david@redhat.com>
>> TO: David Hildenbrand <david@redhat.com>
>>
>> Hi David,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/David-Hildenbrand/x86-mm-pat-Fix-VM_PAT-handling-when-fork-fails-in-copy_page_range/20250326-032200
>> base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
>> patch link:    https://lore.kernel.org/r/20250325191951.471185-1-david%40redhat.com
>> patch subject: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in copy_page_range()
>> :::::: branch date: 31 hours ago
>> :::::: commit date: 31 hours ago
>> config: hexagon-randconfig-r073-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270941.IFILyNCX-lkp@intel.com/config)
>> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <error27@gmail.com>
>> | Closes: https://lore.kernel.org/r/202503270941.IFILyNCX-lkp@intel.com/
>>
>> smatch warnings:
>> mm/memory.c:1428 copy_page_range() error: uninitialized symbol 'pfn'.

Huh,

how did the original report not make it into my inbox ? :/

Thanks for replying Lorenzo!

> 
> I have a feeling this is because if ndef __HAVE_PFNMAP_TRACKING you just
> don't touch pfn at all, but also I see in the new track_pfn_copy() there
> are code paths where pfn doesn't get set, but you still pass the
> uninitialised pfn to untrack_pfn_copy()...

If track_pfn_copy() returns 0 and VM_PAT applies, the pfn is set. 
Otherwise (returns an error), we immediately return from copy_page_range().

So once we reach untrack_pfn_copy() ... the PFN was set.

In case of !__HAVE_PFNMAP_TRACKING the pfn is not set and not used.

> 
> I mean it could also be in the case of !(src_vma->vm_flags & VM_PAT) (but &
> VM_PFNMAP), where we return 0 but still pass pfn to untrack_pfn_copy()...

I assume that's what it is complaining about, and it doesn't figure out 
that the parameter is unused.

So likely it's best to just initialize pfn to 0.

> 
> This is all super icky, we probably want to actually have track_pfn_copy()
> indicate whether we want to later untrack, not only if there's an error.

Sounds overly-complicated. But having a pfn != 0 might work.

 > > Will comment accordingly on patch, but I mean I don't like the idea 
of us
> just initialising the pfn here, because... what to?... :)

Stared at that code for too long (and I reached a point where the PAT 
stuff absolutely annoys me).

Thanks!

-- 
Cheers,

David / dhildenb

