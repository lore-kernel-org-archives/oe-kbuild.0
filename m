Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A238B1DDC29
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Apr 2025 12:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743769655; cv=none; b=Yi9X/PP5TpBDhIChD73mbvbRHrxdEj9dmXcoAhOiz/XG4ddQ3m/GEVH0S21dvdlDRWtEDyCeff1eZNG+3D3O4akmuRgp5QRwJ/uHYwsIfewC2cePMCuyeXryGzPIHzx716XJNMmGkjhNtZ0YbQp0LG1BBMNogpNW2RG7vgDgGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743769655; c=relaxed/simple;
	bh=S9+fW9jDaiGWggO/G99OVpMxjxgFEh1PJM5b81cf49Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=r+Jl7IA3zajVputnjdQi8k+gdnq/X+vPRDTXSC+QAlQFX6guDdlyFutscHqsm81/lFeHpldbELfqNRDfWIaqmmPfmCT4PRBl3Hpwlp9x9jdDfQ6LP0aY6ArVaQbhziq5Vlf6qd/fmNtl1L9vo3P8NeUVJh7748WAja+B36TVCGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=edDZDXOf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="edDZDXOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743769652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GLwMeURzuMh3nERtIkv27OCcHdi53UzzaDVQnEDcAlU=;
	b=edDZDXOf3qwfYvkbZGd1SubPW9pt8EylSrn2K9waoBguFiHeizXOqd7e6feHcioT2QBylo
	qUERo51pqPCHj4QAsn5OEzTT96QBlg3mes1waI+X4otvjHqBRXYlssMfy7CO6/uDsJHFu+
	sLbpzqBl7Mdx/hN4x3bruhRwFHZ1xyA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-HjkdgYESN3KVM_HMTfKong-1; Fri, 04 Apr 2025 08:27:30 -0400
X-MC-Unique: HjkdgYESN3KVM_HMTfKong-1
X-Mimecast-MFC-AGG-ID: HjkdgYESN3KVM_HMTfKong_1743769649
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39126c3469fso903706f8f.3
        for <oe-kbuild@lists.linux.dev>; Fri, 04 Apr 2025 05:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743769649; x=1744374449;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GLwMeURzuMh3nERtIkv27OCcHdi53UzzaDVQnEDcAlU=;
        b=VxtJlpH6ABQ5jAXvHNF1g4glALUWWhssUvKgLJnjsnY91h9wAl5aGuzqiEWbpgqV3u
         aNnQIwBQI6VMzM4p62CWGvkHL33kMDbD5CPLfjJWzGz7J9nhplkVm8ldF3lE/C1tyhyx
         Cst32jjT1NYlZTFVoEN/diGAwVpRv/pTgV/voQqDa1B+Y382hMZSjjmffSDJuenEg1n/
         OkgNyjQwL/rcs6QofIeCgxEAlpiip/IkVk6F4VEgRitDqzCckzI/wLtdaYOzBaT0JY3j
         bo9VXEMoEdQwu9fqpudEL0GOycDEKeo448D0JJlbCQBmiSzcjvHhAsfpXpKuSK5xrYzT
         97oA==
X-Forwarded-Encrypted: i=1; AJvYcCVVWLJxEvrWSGTI527agVa0LJqt7x54dFvvmPaMeo6MBMhABpP890GbR07N3Rx15rKhtFMEa95WzWo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyULJzgepK7lbLnKWO6Lx267Kx2sKErMUKoXs0iVBHRmAOg+HBC
	aNxgL6752hkrRJl/+lDLaQdzJ65jibhVxII/fekaodOK5AnB63GnnqDpi1CrOa2ZAdxL47Dw0pC
	/42UOjJ33dfNh+9189/KORP0+LR44hCgNKLug1sP1RIPDGDAEEBltEL+u3A==
X-Gm-Gg: ASbGncuhBKolgVk4YMPSCDofU3UoEdSK/hSmQKWkD74ennI5l8UOSO5mJWXsplZ1UpR
	Y4XH6i9gnVBuDBq8Sjnc3rA12hJpfB+Z3PLHW+QrzIuKj8wql41/b7ObGSxA40FgU11Mgmk/BmJ
	HzK4f3+mj9d2/8JMY0EXAjZqppRrUGXicx/CRRK1Yc1IokkhH897mv9FN3Y5a5KJP6Oq6LXDo7g
	/tE+fcaTEq/WA2Hjq/C7DqovXHK8npZtfUwP8WIiZi9j1dLR/N/tUziAke71SCHgDsPPXhmro1M
	aCGB48LSZnCzpu8o9uTNBsYCl0d/pTUmwzsFplHLO1Zy0n88T/B6CAkMWvlS0m36JCLMFAMLU9Q
	GYeoitb3CQO5FUOQT5gq5MDrey7DiFdBhwWG1uSnx7sM=
X-Received: by 2002:a05:6000:4210:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39cba975cb2mr2102799f8f.38.1743769649194;
        Fri, 04 Apr 2025 05:27:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDaeuJ+2foR+W6LwpzdkHucTnoX0fNEEY1FkOxSODlHwM7VGi2JXLd91UUY8W5456NWELZiA==
X-Received: by 2002:a05:6000:4210:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-39cba975cb2mr2102778f8f.38.1743769648811;
        Fri, 04 Apr 2025 05:27:28 -0700 (PDT)
Received: from ?IPV6:2003:cb:c71b:7900:8752:fae3:f9c9:a07e? (p200300cbc71b79008752fae3f9c9a07e.dip0.t-ipconnect.de. [2003:cb:c71b:7900:8752:fae3:f9c9:a07e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096964sm4271241f8f.15.2025.04.04.05.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:27:28 -0700 (PDT)
Message-ID: <18abdf06-9d45-42bf-b666-af1a416bf2a6@redhat.com>
Date: Fri, 4 Apr 2025 14:27:27 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
From: David Hildenbrand <david@redhat.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
 kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
 Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 x86@kernel.org
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
 <e75ca8d9-0386-4de6-bee9-e6044b001a30@lucifer.local>
 <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <92c40df4-2e93-40ca-929e-a0b50ab2b631@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: omaZhSGhQQJ7whvigPBW9n5yBPUKES0gJUbPZt5vfIg_1743769649
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.04.25 14:20, David Hildenbrand wrote:
> On 04.04.25 13:52, Lorenzo Stoakes wrote:
>> On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
>>> On 03.04.25 17:14, Dan Carpenter wrote:
>>>> Sorry, I've been having trouble with my email recently...  I replied
>>>> earlier but my email got eaten on the way out.
>>>>
>>>> What happened here is that the zero day bot emails go to me first and
>>>> then I review them or forward them depending on if they're a real
>>>> issue or not.
>>>>
>>>> Here it's a false postive because it's set and used if the
>>>> (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
>>>> this correctly.  I've been meaning to fix this in Smatch for a
>>>> while.
>>>
>>> There is a slight complication (on top of the VM_PFNMAP checks):
>>>
>>> If "src_vma->vm_flags & VM_PAT" we
>>> * set pfn
>>> * set dst_vma->vm_flags |= VM_PFNMAP
>>>
>>> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
>>>
>>> While we won't be using the uninitialized pfn (good), we'd still pass an
>>> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
>>> but we better handle it.
>>>
>>> So that should better be changed; I'll send a fix.
>>
>> Maybe just worth setting pfn = 0 _as well_ in the caller, belts + braces maybe?
> 
> I'm planning on doing the following, just didn't get to testing it:
> 

Ah, now I get your comment. Yeah, we could just set pfn=0 in the caller 
as well to make smatch completely happy I guess.

-- 
Cheers,

David / dhildenb

