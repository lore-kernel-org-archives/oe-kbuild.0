Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50075028B
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713795003; cv=none; b=vAXUQvvFytUXyrtAC9OqzkbipvRJiKHEVWEREAgPnfHPub5rMmXTktQziGDFKKdJsPSCq1iPY/Yu5EKvc838qwWJSbtlZ2P4XN3EUWsVsU2ORUGHNLbIV3CicIamYPDc4RFXs1kNYbixqBcBpqICEPm+qtiU2RRQefX3rYZh5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713795003; c=relaxed/simple;
	bh=kW8hFzNQFziSuTKz9VEMLzLH6KmEp6xgQBTktoEmAhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiA/DbLGW9v/Ygu90M3Y9vHCBpu1l4t6AinQyndEvV+sD0zJ2StRfcvJJPquOcNc3xv5pt0MulM0ni1tQXP1M55OtdiCnNVaYTtK114pASE95qBj5mhXov9so6Dgg2n/i49Vw653iB6XgBVQtTXDo85ClvOrsKtRsavqEM10M64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oxKn8LUQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oxKn8LUQ"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-343e46ec237so3782322f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 22 Apr 2024 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713794997; x=1714399797; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E8RKZN+uDnrGafmojLkH1SP8lnN/o0Y8G3G8F607Y/A=;
        b=oxKn8LUQEQweKWsXfVBNmim4/kQg1BiQnWN5ODshoU7UuZCPcEp8ve1euWhxoOdvSP
         +pf7JgEmo5KyZJ8AGOYcJBuDkdkwHqyj+IkpiGpGXB3hSgLvCQfXBYH3Qhi2KdskR5Ma
         C/VfQppy8Klbeh4QBRxJvvpb5/b1b4cF+QKCd7KJ71FOkYxI0aJgKVTzPH52C6UMnTYn
         7J6H8Siq697S+orrUUXVprdZZFMJ4nrIYDqtn0otNwz00oiAwXbbX0lhJx7RpADvxIjM
         RuRn+npJzgkdUXOrc4SNnetcsSQZcMfQCJr5D3e3aCDnRfNsLdSqS6EUGC75cD8wV+GS
         2ESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713794997; x=1714399797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8RKZN+uDnrGafmojLkH1SP8lnN/o0Y8G3G8F607Y/A=;
        b=hftF5R92nq5VMU1DjUkiPaRDi+DbkMYsb40prxp/803eyubvEVDdGFT9bMzYUIar+6
         Qw5k6JGVx5S+23HUPbHJUfU809iEIQRMqBQgkyGv/SuHrpFAnguLH02oxGqcnm5cc+LS
         9nZqEyKfTTS4A2Y2HVebRHXU4F8eqgFnpYwPXK2s7FayPh3KWZObuVVCCsfdcgWPmdUn
         hyyYsjGSMk+TczoY36Pt41ggmVag8tKn/k52QHZqWfiR9W6u9jmQcz3JtMt3+VT8U4i6
         SYVHuliAOOGCe/JHaxGNH3NR7oCmBCnYdDVc8jEoKQYqzg+0mxZVIy8VpZfLiFxDmrsL
         i7gA==
X-Forwarded-Encrypted: i=1; AJvYcCVvNEgVNuJPCa53nif5i43IpuxSjF7z2I2Ivq1Rqk7D47ShrYmS+PGDA0lSff3llvsYAQ+WTOzYWNwjmEo1vnVfY5aYDfpiiUrM
X-Gm-Message-State: AOJu0Yy6NPMWQKncUD6biLq2mAi/6Vnj/Dq/2JKigG1ODZ9purpIiWEE
	PSlIU6t+BT+5jAOcB/EcFFnipRcvQ/SB4AWT4twnzZf6cd6I04IJX9aOnorHO2E=
X-Google-Smtp-Source: AGHT+IECXGOeVKkPeQbk7PD7Wf5ejYo6tMf19FomyXvVazm1LasPMozmeewBgnPjAl74SOLC4DMRuw==
X-Received: by 2002:a5d:6a46:0:b0:346:b581:ff57 with SMTP id t6-20020a5d6a46000000b00346b581ff57mr7517399wrw.68.1713794996802;
        Mon, 22 Apr 2024 07:09:56 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090629c700b00a4628cacad4sm5780491eje.195.2024.04.22.07.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 07:09:56 -0700 (PDT)
Date: Mon, 22 Apr 2024 17:09:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 8/8] iio: adc: ad9467: support digital interface
 calibration
Message-ID: <559a4fa4-f0b3-4741-a143-630e834af291@moroto.mountain>
References: <202404201240.EYJwoHKf-lkp@intel.com>
 <d0b732b7490d18cc0751a0dee78c0f34678d4699.camel@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0b732b7490d18cc0751a0dee78c0f34678d4699.camel@gmail.com>

On Mon, Apr 22, 2024 at 09:24:28AM +0200, Nuno Sá wrote:
> On Sat, 2024-04-20 at 12:32 +0800, kernel test robot wrote:
> > BCC: lkp@intel.com
> > CC: oe-kbuild-all@lists.linux.dev
> > In-Reply-To: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
> > References: <20240419-ad9467-new-features-v1-8-3e7628ff6d5e@analog.com>
> > TO: Nuno Sa via B4 Relay <devnull+nuno.sa.analog.com@kernel.org>
> > TO: linux-iio@vger.kernel.org
> > TO: devicetree@vger.kernel.org
> > CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > CC: Alexandru Ardelean <alexandru.ardelean@analog.com>
> > CC: "Lars-Peter Clausen" <lars@metafoo.de>
> > CC: Michael Hennerich <Michael.Hennerich@analog.com>
> > CC: Rob Herring <robh@kernel.org>
> > CC: Krzysztof Kozlowski <krzk@kernel.org>
> > CC: Conor Dooley <conor+dt@kernel.org>
> > CC: Olivier Moysan <olivier.moysan@foss.st.com>
> > CC: Nuno Sa <nuno.sa@analog.com>
> > 
> > Hi Nuno,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on 62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f]
> > 
> > url:   
> > https://github.com/intel-lab-lkp/linux/commits/Nuno-Sa-via-B4-Relay/iio-backend-add-API-for-interface-tuning/20240419-233948
> > base:   62d3fb9dcc091ccdf25eb3b716e90e07e3ed861f
> > patch link:   
> > https://lore.kernel.org/r/20240419-ad9467-new-features-v1-8-3e7628ff6d5e%40analog.com
> > patch subject: [PATCH 8/8] iio: adc: ad9467: support digital interface calibration
> > :::::: branch date: 13 hours ago
> > :::::: commit date: 13 hours ago
> > config: csky-randconfig-r081-20240420
> > (https://download.01.org/0day-ci/archive/20240420/202404201240.EYJwoHKf-lkp@intel.c
> > om/config)
> > compiler: csky-linux-gcc (GCC) 13.2.0
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Reported-by: Dan Carpenter <error27@gmail.com>
> > > Closes: https://lore.kernel.org/r/202404201240.EYJwoHKf-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/iio/adc/ad9467.c:587 ad9467_calibrate() error: uninitialized symbol
> > 'inv_val'.
> > 
> 
> It may still be too early for me but I think this is a false positive...
> 'inv_cnt' which is initialized should control if we access 'inv_val' or not
> 

Yeah.  Smatch doesn't handle this sort of loop correctly...

You're reviewing the unfiltered warnings.  Normally, I look through
these and either hit forward or ignore the warning.  If I had forwarded
it then it would have gone out to all the people on the CC list above.

regards,
dan carpenter

