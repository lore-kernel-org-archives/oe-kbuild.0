Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFD3211463
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374305; cv=none; b=iNqukFt53oCrVoItfyJLLmqVi1TchOZdDzB9miXNBBvYaQch4VK5F3Liulseb83eNYu15TUD8Xy1wP50LYlyKRnnKQM3hEmelxv3nbbbz5yRn8g0mBIdMEimuPPqEKEPNeb+mS/P7dN/+DzlQyUgt+zxF09f4ng0VcftYX+LBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374305; c=relaxed/simple;
	bh=Kd+6DzKTiuHkjzGkdtLbyCkTyy0yaluQp17EPwunXIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHSBg/SxgVRd0SS8cAtckJf5jgUCTPXBrBPCuvisnXfqWelKTGm+yxAa1fDmhK8AybD0ri92sQN4IIJgvkXOCMUycqp1zMj8AS4zn3pMoFsYI5NmQAVK0d9/J3JIEgQUOWW6Jnyg7ntrf5HVc+yrc8x0kp5ZseadDGWNisWl8zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RYKgoQnp; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RYKgoQnp"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7d451f7c4so383348466b.0
        for <oe-kbuild@lists.linux.dev>; Wed, 12 Feb 2025 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739374302; x=1739979102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YSq+cHNnWSDiFyg3hiZUKEZKM5fOb5ovEsLt9hQ8kFA=;
        b=RYKgoQnpE/q/BQlY54PW5GQNkkBdRkhisiUH99+x69gKY05sg2GblrumjfZgouHAiZ
         LvXhWSY46+AhV3C4/zhGktfZ8ZEc3GwLA1ehXBfLDZ0cgT0B1pZEQ1OQoePqJ5fNkaNR
         tlJ1g962lzPmWO171sU+hTpcf80ZWte622U5RuEeLCvYM9c2Uz4V2fOB7vZoUecMyQN0
         gOnTaRaM8Zwn6JGa3lVSXC3z4MLcLoIa6+KDQ5sg4kein8BxTnE92dSk3HkVGqJqyoSi
         n3VJ2bVwtpvvMy4pGXUXh1430wHSpeE/0956nGUdzPgsebZWJyXAufU5la+zlhSvgSC+
         sI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374302; x=1739979102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSq+cHNnWSDiFyg3hiZUKEZKM5fOb5ovEsLt9hQ8kFA=;
        b=g7/3whcFEAXPy/FWrEKzRO3vPjoI9To4loDIK2wp74iYbrqt5owgxN2lzvx7xzcBgG
         kjNznn9OnNJgfNwhJODRU6TKt7H8pnNJ2zpg0+OponzpQFtCB1C6PmXo9g4+ULf2uZcT
         MlPx+eHh+xqkI+ti+WsVdg6Xb1meG9BMcneKiGqoDT/05E93+16j3vxK2iiCNy5Z+FWq
         h4qcU8DITgpBy1+xc2qYhY1xhbX3prSiU+C0PfNgfXYbWqtQ3jNdlWqNj7Px5+fPaJUM
         /4+FLDErvPHeDxoBv+QBRENVeixbvgIOs1nZCDQXCte2icUK5MkkA4a+4Xw8A1nzZJCF
         66EA==
X-Gm-Message-State: AOJu0Yw8nuyHpCIEvk9KLOBq0Ef9Hf0eID5FOnDb+Ggp3gWt7+7j4s4N
	FQJFdX4SW8469nMQBlcXcSpLpIgnTIPEF+vNMjMcYNhpLPJzPwsbb7nk3GLhKgg=
X-Gm-Gg: ASbGncvZRkq509/gY+DXWOeG+NlJ7U2HUT4rLwUXrgaEfblyKD1Ia3VcMb5WN6bLESl
	c6xSxfK47vtM+tm/Iz6LgYPqjZt6L8OSMcyvk0xJ/6psD+kw23tclLLC3iIR7FpLhnORzjch/U4
	0yHzWxc9Rss09puvvCPUAaAe4WRplQhyiEh/nX69nqpNfd46LZ/Mhrt4aQE3nT2Ys1lLL0G7qIQ
	0hHEdi55dRxm/7qf3W+TjxF8NTE/fDeVk9IEp1bjA3SeIFDuk/AinJQ7lrVy5XzJhbfje9CHoS2
	/a8gjGUfYBRnrbx3V5/z
X-Google-Smtp-Source: AGHT+IEL4lA8s78vp0Gg7MOmptz86X5Vg+sujBASU2RfYgzLtUU6Y26AXdNXUW7VE46t0p06RX/ymQ==
X-Received: by 2002:a17:907:60d6:b0:ab7:c426:f33 with SMTP id a640c23a62f3a-ab7f34a8230mr346620066b.56.1739374302011;
        Wed, 12 Feb 2025 07:31:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7b4aba036sm737804366b.45.2025.02.12.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:31:41 -0800 (PST)
Date: Wed, 12 Feb 2025 18:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: oe-kbuild@lists.linux.dev, David Gow <davidgow@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] ww_mutex: convert self-test to KUnit
Message-ID: <30998382-ee63-4a4e-8287-cd21c649b849@stanley.mountain>
References: <20250210-ww_mutex-kunit-convert-v1-1-972f0201f71e@gmail.com>
 <3dabe058-2308-4990-8e5d-0af1efd27431@stanley.mountain>
 <CAJ-ks9=mKzgLhJW0dV-L8eFtkW-xt8v3GM51V4QF5Ef_ENKLvA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ-ks9=mKzgLhJW0dV-L8eFtkW-xt8v3GM51V4QF5Ef_ENKLvA@mail.gmail.com>

On Wed, Feb 12, 2025 at 09:33:46AM -0500, Tamir Duberstein wrote:
> >
> 
> As an aside, how can I compile with the warning settings used by
> kernel test robot?
> 

This is a Smatch warning.

https://github.com/error27/smatch
https://github.com/error27/smatch/blob/master/Documentation/smatch.rst

Run smatch/smatch_scripts/kchecker kernel/locking/ww_mutex_kunit.c

regards,
dan carpenter

