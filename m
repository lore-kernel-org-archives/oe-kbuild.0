Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0B185C
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b7rtxpZM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c2c5a8150so24364195e9.2
        for <oe-kbuild@lists.linux.dev>; Fri, 08 Dec 2023 22:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702104824; x=1702709624; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=27fCHLUa4kUDvPQVbE+1w2YS5g7FkXV060e7T4s0mZE=;
        b=b7rtxpZM6eKOsW9e7q/+7qy4JgqWz1eq2HSw4runYwRNKiCp1cqR5YBKPbGiPOhxVW
         eHLaJ035Mr1O0vnjW5Y6v7V9yCJJ35XVWLnNVqgbVQz1jYB8euzRkRhIc0bh1NwG1QpB
         ZfYI3MPrDVvaFIgmbCu54k3/z947Afa7JPkA8SwNYpNAoQJfsrZhvIkpah7yqWfSQ+6t
         Q/xXKDtuCbYMxHZHZJ4bL9X4jzcNWjVAiODVWXK2kiJdaIwaPhWsVk4KzZusYzHDYuFo
         Hf6Bp426+CB7YwQrdHhlA0rW3df8ERT0rSTsHHuGikMzOdKv6GLiIoD6vpYW1h21pIhx
         B2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702104824; x=1702709624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27fCHLUa4kUDvPQVbE+1w2YS5g7FkXV060e7T4s0mZE=;
        b=vp3pEWk3jJsGp25yzXSQOMVHAYKfyPvHfBV7Qkys6cXHS/N1tCKqmoz94Db5RkBEl7
         p3CUHZBqXLXBH2pekQgB1Y4gxTfYO1yLt+ooKjZZRHA97r71i8zniMOozujooPUn0XP4
         cLLryV9dZ5UubbB3IAcpDYf00HdBKmPjK7+TKNMqutmrT1xitpMyj3weC+XnHGLc2c7V
         8tjTAZ0bMoZBS2rs+EUsVorsprr3sRs/2k3GbSohYZzclJMEOq+mNUVdoPRU0DnEcHuy
         +sdIIe6xfudFSNX/sow3uPxAq8jjU9kPH4ciiWPAYe53TgvVkwZDmhB5Zvcwa6Q1aCIu
         VcIw==
X-Gm-Message-State: AOJu0YzUMxHuhm2Bb3VYtJlRyt2oeDy6bJqwncuaq5NPAwpLDFsJ5PXj
	7KGoCSdkZwafJ34xASFW99LX8w==
X-Google-Smtp-Source: AGHT+IEIQ1SNS311RaYj5If/4xi5+/rSPck3nXd3hzicSBW8VuZz6UwTsNjF2kXqF810V0JsNEX7dQ==
X-Received: by 2002:a7b:c7d5:0:b0:40c:2bab:3d27 with SMTP id z21-20020a7bc7d5000000b0040c2bab3d27mr481651wmk.8.1702104823906;
        Fri, 08 Dec 2023 22:53:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b0040b2c195523sm7393926wmo.31.2023.12.08.22.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:53:43 -0800 (PST)
Date: Sat, 9 Dec 2023 09:53:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: Re: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error:
 uninitialized symbol 'release'.
Message-ID: <2fe769ff-a6f9-468e-9449-28731f8f966d@suswa.mountain>
References: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
 <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>

On Fri, Dec 08, 2023 at 04:33:44PM -0800, Vineet Gupta wrote:
> On 11/27/23 22:22, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
> > commit: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
> > config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/config)
> > compiler: arceb-elf-gcc (GCC) 13.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/
> >
> > New smatch warnings:
> > arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized symbol 'release'.
> 
> Thx, I've posted a fix.
> 
> > Old smatch warnings:
> > arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.
> 
> This seems like a false warning. Its a register variable and thus can't
> possibly be initialized.

Yeah.  Sorry, I normally delete these but I somehow forgot this time.

regards,
dan carpenter

