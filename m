Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C0629551A;
	Thu, 15 May 2025 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747300798; cv=none; b=BUcMXlyUTF2NcEMDJtJSXoqRkX0n8QKEwszs+f7DK3rLrC+BWtudBJnTfVW7sFflaHXEvgQVZc38MYEOWLe9NDhQF9guM+fsUmYKK9YA9p0sT/ogiskaB22S1kwPNllXEywKwrQPtD7bSsIeLBuJ61NykCb26E2TRUf7Vl+MkXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747300798; c=relaxed/simple;
	bh=27BgqZply+/JSM8w3Q+eEIN5X9am9OQ8w9Lycn4Lcx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3xmckbfn8+myp4MSQ45wwTMLrSLCc7sOVrQW1eUVsWpIZlcH1BA9+7U760cXGt8nIeLVwp4xbGF7EGLlmKuOlBqcgosnoPbjyiwdng5l8nmmaOWWecNkZnMT2TJc6vZw+YUvf72uxjU1o/k8SNQjt/0fVMPQ8zQqakz8nWb9+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7423df563d6so711821b3a.0;
        Thu, 15 May 2025 02:19:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300796; x=1747905596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sly7kHXqrRGdvJB5iOb5QQcI+fsxg5o/luWWE7Ei/To=;
        b=Bii1hGf22M/3EmQISZu6LNGg73zHlXWX9N+3JQKgRb38OK9PdSgOnjV5PWHqDQ0Eq1
         MhFAsLi0dPgzf4zlL4PsJTu9ufWQ1L5qbmiE/nOm+XYrNCv8iJa8lE1JM23zfHXuw7uW
         Sj5WPItLQhpRjGlLuy1tw+7RmHxtVthlZa114MqAuUY4njcL88AC+WytDnxBccDA3MYp
         SbdizgjW/KGfYoBXRjPp5KjLHYRUBjgXHeqrbNn71d87I5d7xZ5XmaqxPTfazoyN5MSf
         7ULv9A8r7HPMAyNP+fPLi5WWlSQm97S/yg9cSpj4YHTyOXDa2YwBIZRoMWBKIytUG4eY
         CYlA==
X-Forwarded-Encrypted: i=1; AJvYcCV7IuqrOGyAhn0cpW4FRPpOAhSGJMAfjIJft923cD/tpZ0skftR0CsjI0Y6AQge6RTApX62Y+IL5K98JFNX@lists.linux.dev
X-Gm-Message-State: AOJu0YxuobgcRGZyEMHi2iHhwSBRVJM8FcRo1a7muKl4pN8/0numACQV
	P49jMNxuBm+Qp8ozJ/74fdKBzfZSWqmrfq/3+2c4tR/c5NvNlYoX
X-Gm-Gg: ASbGncuhNnDIy2j2Mkvp5m8pKpSyvAAidu/6pEL5rDafsjqTHBoISK6LTOYgOVzzFIS
	R+hPYVoU+C3FYrZjxYm8h9VEdwcFrpVFJyxK8bWS56JwuEUZNZADceHmTxuvA2JjG3uZ+AOnEGT
	i8T5k59AsAr9kwNCXD0654ymgeOyzT86VfGxA5OnaKPFhDqts9CiD02oaHQ9CmUuLjS1BZehCQO
	9i/cfBEjwF+PJ6saW0g4sKXoPEXLyTSzPqTXkuTZbcRMw4qInsAFk9eY6yqEL98z2aUdBcsbftP
	r0eX4mAmP6XIvCaHHgeqUQ4126HQakpHKVQC6TA/7MxOnzdUwcJKJ9GDc7nHAB2AG2Km/dpfbn4
	5RErekya1eQ==
X-Google-Smtp-Source: AGHT+IFuVEr6BM9jzhK4QkAm9P5QQf8rERAevNQeJYJBnBZfUkBiMmtorh/Gb0R5VbI0wsAM/rbOLw==
X-Received: by 2002:a05:6a20:b40a:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-215ff1b6a3cmr9009418637.39.1747300796233;
        Thu, 15 May 2025 02:19:56 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74237a8972asm10649368b3a.157.2025.05.15.02.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 02:19:55 -0700 (PDT)
Date: Thu, 15 May 2025 18:19:54 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: [pci:ptm-debugfs 1/4] drivers/pci/pcie/ptm.c:275
 context_update_write() error: buffer overflow 'buf' 7 <= 7
Message-ID: <20250515091954.GA1059401@rocinante>
References: <b41c1754-c6b7-4805-9f14-7c643d6c5304@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b41c1754-c6b7-4805-9f14-7c643d6c5304@suswa.mountain>

Hello,

[...]
> smatch warnings:
> drivers/pci/pcie/ptm.c:275 context_update_write() error: buffer overflow 'buf' 7 <= 7
> 
> vim +/buf +275 drivers/pci/pcie/ptm.c
> 
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  257  static ssize_t context_update_write(struct file *file, const char __user *ubuf,
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  258  			     size_t count, loff_t *ppos)
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  259  {
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  260  	struct pci_ptm_debugfs *ptm_debugfs = file->private_data;
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  261  	char buf[7];
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  262  	int ret;
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  263  	u8 mode;
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  264  
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  265  	if (!ptm_debugfs->ops->context_update_write)
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  266  		return -EOPNOTSUPP;
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  267  
> 1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  268  	if (count < 1 || count > sizeof(buf))
> 
> Should be >= instead of >.

Done.  Fixed directly on the branch, see:

  https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=ptm-debugfs&id=132833405e61463d47d6badff1b8080b09b5808e

Thank you, Dan!

	Krzysztof
