Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650A4F201
	for <oe-kbuild@lists.linux.dev>; Tue, 28 May 2024 05:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716874287; cv=none; b=LSo8xYDY/e64ZHeInM2GZugnNzITo/z2gyVuq75BRbcCvlBT+G6r+uq3twcSSks1liLAJoBiM1U2bCDJMmHTHdcbb2fSXiezR25nOvnUvK3z3ZFosnETqYcylrfUdEEySvRjQIXIMTe5r28ugG22hu2Wm6MBWs8RN74Cqo69kVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716874287; c=relaxed/simple;
	bh=HyQLjZEpd9wwdN20s4cZ6BruH/hZKkcc3iKQN6LiTVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkzSeJsVZ6fQrFtqcpmjhvOqnDZ1UZ3Y1jML2rU29fpz1y7uz/XpueLyE0m7nheD+zHEFpW+erXj4hOohob4z34mRbnLS83MRJiw1znHgj8kEx38RVvqVfuosOJykAhkrszGfQDpDm7WBQgZORlg59+X6EKyY0P6Ewe3LEtyuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SKPoXPsE; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SKPoXPsE"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2bfb6668ad5so322750a91.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 May 2024 22:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716874285; x=1717479085; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9hvPgmffj4Wj06vdVO18Z5LSO2FFEsKmLvRZE6+/qIo=;
        b=SKPoXPsEu7PsHrxaqQpmYiBgdDhutVUQ74C94Oi6wg1JEXfWX301Ju4Gz4ApNOOct6
         hlLWRKII2PMa5L0v4hqPT6n15TGFbtPXT1/nXOFi1Sy4qp0m5pa1N3JVm6b9rhD/lRcW
         8eWatG9CNFCOfisg8/cKiHMyWCa4ttl6ACMqpEXVDRb/SRSab7sR+wNcuwyKxclWMhQA
         iNTLqetq9cfnxXf5sbA9ZtBCFio4CJ1mYSG8dq/JCZbzBXZxqskbGE0TAQoZK1gLfdbn
         /l9FlNal08u/YaQR/Lm3yof6+gcd5nR//68kbWH93FaBsLMWM5rJg7sRdGNWo1qwmnpq
         cpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716874285; x=1717479085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hvPgmffj4Wj06vdVO18Z5LSO2FFEsKmLvRZE6+/qIo=;
        b=KC//iYNcnLcTsYzu6xsXmP3TKU2sMR8zcF154Aa3Btt+URcElRUWFHyEStsrhluZKn
         IeVMhKFyieGPEYJOR4DqO73GjN9W1DONdXjY9MEgZsGvl/Hn9VLKVOeciHWSJy122uxg
         RFKlUSTu/6l7f+PFmNMkiV/5wZ2xf6vwDE4u4MotD2CT6Ty4/rM1jMpl5+0NA7oJzosX
         L97ZWYmOmlatizQu0Uf/1fNiprD5eB008rHz5ARrFGqZXwc6gbksMaPi2QbPknyuoQlp
         wGfQDGNwnSRG0uPQNTsJkFxjSrLQ5yhGXZzsHgV1U8CgXNFibzS43jGt/zue2rQz9pxO
         xg9A==
X-Gm-Message-State: AOJu0YwEHfn4iZ10QwCV1d3ocY74u+nP+15YfXYIH+HBadXJvfGoH1vW
	kEjACPgcUm8iFGL26oeIZLXDO3ReAcHNJ+/zFcfBGzXVj7u8C1qA+AJfXWw4o3w=
X-Google-Smtp-Source: AGHT+IH3eeCklWFIBgjuU2ajwASNK+Fln476Y1+Xt+QjngmUQhquOGzUKnaJQt7MCEQySQmbSAajXg==
X-Received: by 2002:a17:90b:3754:b0:2b4:fcfd:780e with SMTP id 98e67ed59e1d1-2bf5f75124fmr9077103a91.49.1716874285301;
        Mon, 27 May 2024 22:31:25 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2bf5f511a92sm6769359a91.24.2024.05.27.22.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:31:24 -0700 (PDT)
Date: Tue, 28 May 2024 11:01:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [rafael-pm:bleeding-edge 11/15] drivers/opp/core.c:2447
 _opp_attach_genpd() warn: missing unwind goto?
Message-ID: <20240528053122.pzfkdig6k4kga2yz@vireshk-i7>
References: <3d73f08e-8305-4ad8-8327-adaaf96ac673@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d73f08e-8305-4ad8-8327-adaaf96ac673@moroto.mountain>

On 23-05-24, 15:50, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
> head:   fe07fa9fa1115e0979b89a90ae8594794ac2f63f
> commit: 2a56c462fe5a2ee61d38e2d7b772bee56115a00c [11/15] OPP: Fix required_opp_tables for multiple genpds using same table
> config: i386-randconfig-141-20240517 (https://download.01.org/0day-ci/archive/20240518/202405180016.4fbn86bm-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202405180016.4fbn86bm-lkp@intel.com/
> 
> New smatch warnings:
> drivers/opp/core.c:2447 _opp_attach_genpd() warn: missing unwind goto?

Sent a fix. Thanks.

-- 
viresh
