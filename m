Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700E469854
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129344; cv=none; b=RZzh3VogPeUcEMCL7knk7ay+I0enEehZ91sftLGbZYIToeJ3j9n5sKm/COGa5cwr6i7wHWYD8nGhzM3R1lcPCBfgM9xJKPKPhY+6Csz4EqNxpdkiVaeHoif3iX6ybWWQVvbbR4RhUQBq1nsZ1RDaeNjIHFGIA5J+1L846yhjrsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129344; c=relaxed/simple;
	bh=MgFjQH3kgdFgCoc4l/+xy8WhFKmK4hGtujrcyhVeg+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kO/GR28L1QfxZaxM6cn5ccUihH4ajHtYCuJLghiRZQD+Rkdf6LQRcnalwvbGy96L4VDngYCuKYt08CBliWcHZM1YRY9gG6cfP9s3/F7ExKaK2sNoxXRyqYjPjmWPORVwUg/V0YzzYZvh16a1bh7E3ihkPih1bxbX5Athi+82F1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F51S67nr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F51S67nr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so5562355e9.1
        for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 05:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129341; x=1789734141; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=F51S67nrMU6ONC3iXvyTMFvhR9BuyPsjgJawWo6lYfvF0MhBv5otxY3zqYQUKoZsB8
         MtkXH+7LnwQFY5mVGdTBtoq93AO15UMJcybttrVES37XeVmiqaJo0vmeEyWEiymhPL9/
         2lLO+gn4tN9Pyj3URXlfWUgHJHnFnyEsDY2sw3HxFCUJp376/EAqfBmbHPE1xEwPa00t
         r7IjIsiWt+wi9B01oRrRr5k+QQo6hcQsVLwj2u7j4fOLNi9wkAK+jY7tCNPbT7DAp4Bb
         WhKj9ec0YyxrTxB3r+26QID/Mbd9aSZsc6sVdDRBvWRN06gy28tc+HXun8IYvAFvIfUu
         EfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129341; x=1789734141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aYg6ENX3iBZcZ6V+nXDUolx1uCJT2hGf2/9jC8O6fjE=;
        b=s3hPjl9T6ErZe/CV8VR7QOqBNM+IgVgi4rJO55KjEA5jYZX7Yg4ewuPv4LOYY2NMKh
         UmT5MjPdACygafFwW8d/OTW6I6yd/k6CDVVK9uSTlbx+RFdiWwApULRbKbOyT8zpxGAK
         C7LzOopUZsrFFg9vTjm6TKjbKQ45F0xh4NPWDVKKSSiJ1tK3C+9U4nHv2U+Ysb8KdSjj
         MjgPS5ctxe65YoPY2vjV2aOCcp+qVzzM6ZCdtYM1OBYY7w6wYFK3Qb+B5ehuBIBuNtOA
         cNFqWQVHqee1cHqZC0z3fkIQoOfO+3x9QJR7A9VmQ9rHLUYZ1qpHwC3elT/yIqAOgiN8
         xDrQ==
X-Gm-Message-State: AFuF++mfCWLWTbCqXEzCrSuWIqYtFXWU1U6I9d2yJ0Yx/8TOklaIEHPV
	shW6cK+1upxOdhoccvcEDneCpQUZ1bF81SHvydb2jMMjqjVCI/YcSXg7hkelJ1Yl0Hx6AA==
X-Gm-Gg: AYBFou2w4mxTkTtPLIgt6TUk2Zf1KoF9G17qfhTuIkjlhpn30uIyyzeL50VILNbo4Yd
	DSQxsAkkXf5ZFOmM6YwROgbK9526oLZ5vQIA5H4vh1DZ/+igBRy4QiwV5AE1wHlx/jrHX2oQ8UJ
	Vf8nVDpkyBOaOsoHzdXrzxPSZUyMbDlPb6LMpJjFm3c4h7T2+AjvxjYpCSuyYoD9wgP3V3i8t/N
	RvLtWkueXoLHiccR03JgzR27ZKzn151xBkljX6qOdluyXoQj656h8htiXrW1s1BraTwqPRN0S8u
	nfl4ndnirUc1/YxaKhs0aYrmXbCEgYAZgNqyVoqPrtYvoRSi/vD/IDyo8yKPQAZ36jvXeR0I2mp
	y0e/gNag7hig8w/EXAMRMQlcb2Axv2L42CLVB8VO4BSvaYXXzey7ccakqJ7txhwkyveBwz80wQ/
	tN/SDgDdodf9Yg2drEX+qJxxfFmkh+FD9zyGUaBdhfoFFX06BJdgQg7ZBvoJ2TAN2UIyg=
X-Received: by 2002:a05:600c:c493:b0:49d:2607:4ada with SMTP id 5b1f17b1804b1-49e619bf31cmr80924325e9.14.1789129341343;
        Fri, 11 Sep 2026 05:22:21 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm164864835e9.7.2026.09.11.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:22:20 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:22:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: drivers/dma-buf/st-dma-fence-chain.c:207 test_find_seqno() warn:
 passing freed memory 'fence' (line 195)
Message-ID: <aqPyeNLCsy-k0DIz@stanley.mountain>
References: <202609081301.6ARYAElY-lkp@intel.com>
 <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f26027d-805f-4ab5-a181-d56a2708c50a@amd.com>

On Fri, Sep 11, 2026 at 09:49:54AM +0200, Christian König wrote:
> Hi Dan,
> 
> I just double check and this one and the other "warn: passing freed memory 'fence'" look like a false positive to me.
> 
> Any idea why smatch things that the memory is already freed in the test case?

dma_fence_put() can free the fence if we drop the last reference.
Or imagine that we aren't holding the last reference and a different
thread is holding it and they could call dma_fence_put() which is
also a use after free.

Incrementing then decrementing then incrementing the reference
count doesn't make any sense.  We are relying on something else
to hold the reference.  If we can rely on that, then we don't
need to increment and decrement the reference count for certain
basically random places.

regards,
dan carpenter

