Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23702248AA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Apr 2025 07:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009891; cv=none; b=iOE3lOHBauPozaO7cWzl+rYD4DIQ272c8Ycna4i4J9rszdx9VaIlBxWEc2rATzY8Uenr69+A/AqUjji8BnjSvQaZrAh6yxX0Tk/KpkMC4IbYTBvzcS0Sozn4uDvcWs5WWpXGDPg31JhgcoYyk9kYLR0QjVe5GmTSyZ9CRZ7HgIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009891; c=relaxed/simple;
	bh=bgbX/1TAGw3gEOnX+gc4RFwpwUDnnTk45cRn6/6NpE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNbnWnMrmqGO8Z+4PuZ7pMgySrYBIMzF8O1lQrl6eEzJp6bY4/DJDYs/kerfUJTghc4lM6dtu+ll18mLwzWpfXyLRcU3ptfyDZbdj1wGAVnbD2++NkNjF6O2W9LkYJaWlk7T2k6khP/ztHoOlddN/8ECcQAzgEG/ujdIc2WyWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VoNqSgnW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VoNqSgnW"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so37116645e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 07 Apr 2025 00:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744009888; x=1744614688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rh2kVYU0upvV4LKj4WnQxMYuJ0Huyu7zHvLhWV/epMg=;
        b=VoNqSgnWBzfG2juhiQnIEOvdM+cLEf4HaOOtsgP5nHjps4V/ZRGJGdJ0t54NJAM27f
         R71uY+crPL9zdz4U7MvzkUBuRhobezQ1RD8teo5gHU/QGncMulLKgMLbeIjqsSRrtato
         GN1f7uwHAEij2WUZwfqVzf2Ln5Mo0+7Db+tvgz1XiQAHYrL5dO6I9gLmAS3/dOkxtU2k
         n/EQxwAivNZj7fB9mtjpBiC1XvuIvPdXQJvbKYNjgfJhl1f9msBuSLLF3k0lOFnrC73F
         qTFB7fgaJuE2oBT9U8upo62BDWFqsLPZ6zHPkiUlBg6GVLz8z+/Lzj8Ps+eAjXwtzIhK
         wdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009888; x=1744614688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh2kVYU0upvV4LKj4WnQxMYuJ0Huyu7zHvLhWV/epMg=;
        b=t/XJEMeLNl7D33YSvjoNjSyeSznDFAMI047UU7KJfR/yVt8CU7FgXl5ZVfAXXk5kqe
         XLn8aB+ngNYzbCHSyPoG7Bwppshk8xg9Wb7Hjif/uIFbU29uhf0Nd9ilgxGli5j6jghM
         hW6NBq56mG07Ek1BltGKO9H3k1MoeaXbXnKWY0wIBO3s/GwvpBhPkfiPmPJ6qrZUuCgK
         jf/hRqAasy6QPihln2yrTp6bImy1/fhkicOWFy14D3qdQvqsU0tBOV/H6k/tigbb2J4F
         h1N3lMS3YG97Oa1mgB4AvABGN284h/+p4HhHlN+r1HBrcnvzxR1ZLcE/kd4TtrxQqmpU
         hkVg==
X-Forwarded-Encrypted: i=1; AJvYcCWNc5pPhAqyE/jRG9oyaVL0Ij4HyC+TdTNJ7WOqD6tGrhOc4hIJgu6FDUWa3G7svSpPX8daV3kRMFw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0DgzwIhnPk+ceZLmXKINLQuNAIniGYS00Nh2db9R439skrJX6
	uecwtdXKHC307yxFt0N2rkFpAKwInk00TJvfv0VwQgL8d1IbmfK7nJJbK096kLA=
X-Gm-Gg: ASbGncvSNeFZLfvaRxngKfKjzmg1Hg6KqUY5xbxEUI9ldPcxtHngBnilDlRxQcCIfGK
	Rt48DVg9IsQ+3ykhLZZHi+k1NSZhyFXpL1GFzZuIXvSrsZw/299wjmnn8DjN4NFGoAktPJoPF40
	VC9SBzba+oRnNfwy4fRcwvO63a/ln1I3AJQI/+BKHSCjS6A8KZ+8tRZMh5odCapPTOuzwA+4P3a
	p/Q6Be9baUNS2SIP5wUC+fmq9ygDljaJBHi9G3af0zclj/UgK4j4stggxu69FNrgCkWvvlEbcU6
	/68jzStKOdQL6G0x9vpgLO7sdeM9Qbme34gKXJbXkqactwy2LQ==
X-Google-Smtp-Source: AGHT+IHSxbAtFG8xM4hSgYaqnUaxFKwYLaPl6ubSMAn718vF9KSqrQf2fosBFbGX2G2epezcb1G3bw==
X-Received: by 2002:a5d:59a3:0:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-39cb36b299cmr8256949f8f.8.1744009888228;
        Mon, 07 Apr 2025 00:11:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec16a3aefsm124095515e9.21.2025.04.07.00.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:11:27 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:11:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, x86@kernel.org
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <202ba609-277d-4f16-92df-8a5a94f99ad4@stanley.mountain>
References: <g5vxcrmdjjsvrjeo5k6uzwypctv2mvbteoommwwpv6sfjpbcyd@lackqksyahfs>
 <94c35e89-f915-4122-b1a0-436893201373@stanley.mountain>
 <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a33df3aa-7f37-4d1b-bde8-642115dd1441@redhat.com>

On Thu, Apr 03, 2025 at 10:59:12PM +0200, David Hildenbrand wrote:
> On 03.04.25 17:14, Dan Carpenter wrote:
> > Sorry, I've been having trouble with my email recently...  I replied
> > earlier but my email got eaten on the way out.
> > 
> > What happened here is that the zero day bot emails go to me first and
> > then I review them or forward them depending on if they're a real
> > issue or not.
> > 
> > Here it's a false postive because it's set and used if the
> > (src_vma->vm_flags & VM_PFNMAP) flag is set.  Smatch doesn't parse
> > this correctly.  I've been meaning to fix this in Smatch for a
> > while.
> 
> There is a slight complication (on top of the VM_PFNMAP checks):
> 
> If "src_vma->vm_flags & VM_PAT" we
> * set pfn
> * set dst_vma->vm_flags |= VM_PFNMAP
> 
> Then, we only consume the pfn if "dst_vma->vm_flags & VM_PFNMAP"
> 
> While we won't be using the uninitialized pfn (good), we'd still pass an
> uninitialized pfn, which IIRC is UB; likely nothing happens on GCC clang,
> but we better handle it.

Passing an uninitialized variable is UB, but if the function is inlined
then it's fine.

regards,
dan carpenter

