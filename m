Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD9149C60
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 10:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716460995; cv=none; b=p7y3taATytZtE7Fp7R6FVxgp05yRvRdKGr5nX1lWg7ArslTCXU9pBlwTREIokK2q85K2LWOx5bt0jH0KJQmcOxZnTXLOp13UGVBynmerLiKe4X26tGV0F0IJgvA/I9mrHVYmaUW/1tIzPbtA/C5McXFXXlZPZkVSHrGPFYY+b5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716460995; c=relaxed/simple;
	bh=wZhUgojuughYgYYxrpvMtVev5QWws6XkQH1DYbz9qm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWHrkEFW0MlZGEv8vRnhXiQ8vVhyIIzyqi5HXOyv7DZ2lC16fPbp63LKKRIdVqdP/+nUC6FpxvNi8GOb/3PMO7Q15cb8YtlLEa3WMbjwqLSKFc4NavjaAd3wIYeIbAozFXbm3iPGonjH7g0glcKOqeNaCch41evhUw/i+TfDQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sD636+YT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sD636+YT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4202cea9a2fso17290865e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 03:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716460992; x=1717065792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=blpZAozQ3ITK7SHWW4E6qfsTgxzl67pxZ/Pvq/s7bP4=;
        b=sD636+YTq8yMYPVJexqtZibN8h0zQHQpizIShyrveGcxx/3KpNQCxgwyQPbHk79rCf
         5VT5TAHoF3i9gnkQAuxT+Zl/eryLTToIBFN2ShDizKXl6a0Je4v9SqxE//NEzB8I733H
         ZllmYS4Pg6p4QaO+pCzIV1MaSQ0kpwsENaEc/cvIZq7ugDKHCAyNXm9a1Is3iI72qPr0
         xaRR8xJomMlE0S5qYq+JgwnhxFDhR/Az6lO75Sgb35bezRPKDIIYSyY3JMXyo0LGo1S1
         mKjxAtMbmDD4jzSZZqVW3U3Eg3GyayMBloCFWq9xbJ+jhqg3evC12XnN+zKdkffprJH1
         WdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716460992; x=1717065792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blpZAozQ3ITK7SHWW4E6qfsTgxzl67pxZ/Pvq/s7bP4=;
        b=phVyB3JjeV7Zx5FZyw9865US0RvyCLyyu9o9EZ4iHtEqaPkdf5Bcqw7/LLgAgT40XX
         feNHgKkPY//uT1Oio9KBNgfxzBLWU40tuXCxZJrt29BPWGmwRn73tpMBtrznXbskP/UB
         8PKva8Fl89bNUSV+wVUYrqQGORpFQxm8nwle/7bW67lsdK+0xBjGxvp6uQ6j6T1F2Rww
         A27tHpJ/WQBsif5+yVfA6JSheRnpceyUrFWq6tGr2CXCW/KOo4iN3ZVDVB/1/hjS8AgQ
         CcyGrFkjjC3ox9gYVsVXcQB+VTfWGxIG95IJ5BHWuUCgyNZzV+lerdn0cf2Fxeec7x9Q
         jrOQ==
X-Gm-Message-State: AOJu0YyTdddeQ+wSArKefVJQiFN6kRfPZPS+WWO43tVP01Jmj0H5AxYr
	UFFXugBZJXlQeG/mh9AQiw7ZnLL/85u2syd9eaxQAzzF6CGAg7Neyex/MNYClc0=
X-Google-Smtp-Source: AGHT+IEqmfLIqt+uK/afgKxha+DGnAVwMJxlTN1e6e0x6vAfoT8OIivGDrhmD2js1LqTqRKN+1LR6A==
X-Received: by 2002:a05:600c:1f90:b0:419:f241:633c with SMTP id 5b1f17b1804b1-420fd2d79cbmr41007515e9.4.1716460991618;
        Thu, 23 May 2024 03:43:11 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad58dsm21528105e9.39.2024.05.23.03.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 03:43:11 -0700 (PDT)
Date: Thu, 23 May 2024 13:43:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: oe-kbuild@lists.linux.dev, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-um@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] hostfs: convert hostfs to use the new mount api
Message-ID: <df349a89-e638-41de-858b-04341d89774e@moroto.mountain>
References: <d845ba1a-2b10-4d83-a687-56406ce657c9@suswa.mountain>
 <74576c52-5eca-4961-ada4-a9ec99fb16cf@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74576c52-5eca-4961-ada4-a9ec99fb16cf@huawei.com>

On Fri, May 17, 2024 at 07:21:09PM +0800, Hongbo Li wrote:
> Thanks for your attention, I have solved the warnings in the following patch
> (the similar title: hostfs: convert hostfs to use the new mount API):
> 
> https://lore.kernel.org/all/20240515025536.3667017-1-lihongbo22@huawei.com/
> 
> or
> 
> https://patchwork.ozlabs.org/project/linux-um/patch/20240515025536.3667017-1-lihongbo22@huawei.com/
> 
> It was strange that the kernel test robot did not send the results on the
> new patch.

With uninitialized variable warnings, quite often Smatch is not the only
or first checker to report the bug so I normally search lore to see if
it has already been fixed.  In this case there were no bug reports from
Nathan Chancelor and the second version of the patch wasn't marked as a
v2 and there was no note explaining it like:

---
v2: fixed uninitialized variable warning

So it wasn't immediately clear that it had been fixed already.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

