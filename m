Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C945FFA2
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150839; cv=none; b=ei7ZRuuuaMYW4UQZH+3W4SJ+WuT4hwQxdgi/dWhacuLKJRRCPnkCEgVjx3cYDkdAVGm9Mtmht2v45or2oDTn13F9fupnxnLP4NPPvxxbjob7uCqEELNabyn5+tpNM7NdL1IuMa5SfCPDyVZHirydJxiWT3hR5/EFMbsGl7C+1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150839; c=relaxed/simple;
	bh=wdWYojEt48ftP9ujjDAWl7rD+7XfcjcbNcf5JZZmNu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQhh5+L4+Yrxhlo/YAz3xyrG1AE+bWYVpF7DGqjRHqOiYa3LRfn79zA26e303J0VQmC2x21c8gydUYYB/ar87Axc2WKhwKOtWDV7ZIey15POmll/VmUpyBEqm4nVTVN9WnTKagTEQ4QHEiQiat1d2fq2aMVtEXww4/HP3IJCLoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cktl6qfr; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cktl6qfr"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so74566966b.1
        for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790150836; x=1790755636; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yaSZkWQ2JAEPbtr/y1XvAGtkxaY0QvD+qsHMDQEgS6Q=;
        b=cktl6qfr0PxMmcdG/Beu26s/uEqC1XuS5/0l1nfK65ILETtx+us+UggqCTbBXMxEPp
         52aVgnN9rAQzX/Q7wbdeGeXMh6RlVCxUfltgm759yv4DV3UEceHKaWoWr2uExFQtWwt4
         +DsrI0Cp1GQlgIv1nkIcyyprxiL9GKWjGQcFjEx+IRQWMQE3+JiQv6v5Cz4e+2zIekqc
         B9U03IukoqS9fV0Jruf2YK0/D7Y4t/XEsSAi67GMipoqP0J5z70ivooyv88y7uSy1hjy
         +0BTauxRJ6Y346B8LegjzgC3FQwUXerjDKId4nEn+LvcCrsIFE0ErVdo/JUdRb8c3Wrk
         wHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150836; x=1790755636;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yaSZkWQ2JAEPbtr/y1XvAGtkxaY0QvD+qsHMDQEgS6Q=;
        b=KsS17ehIvBbvf7LnjuaccGk7aRpXEeHozPJISsi8l4IBU72S6B1tiI4lUXpWmXqLjl
         8lzZdbGg97p0hroHmXmdpLD+BRiL+PNreviFxYHktB61k816aDDYhfdsYQOmxRyQY/lN
         k8WoFroMtlnbGESEyYtwUpkk/RtlKBW4IWmNbJCrprJtaY+gE8nG7MH7B3mqICrbwTo5
         tj7z1JNSf8wOsp1ad7eBpIcIYTNwP6gbq09sY/SccHrZTXTISWHUxIbfMTAjFIAIFHeJ
         qX1lhcBJHNnHx0X/12Ih5WgqMf2aT4fpMYXhqCyJwnFFygSfDBoDuYXVZ7M8B2o3lB9e
         TYAQ==
X-Gm-Message-State: AFuF++lgI8cpgkpkDIANrv1+OmfaEocz7cVkw+l8+gQ/3IYDxwj2YXCs
	PTuqSZ0l0mRT33neJSlw5bifLP2qyTfBX2WXEVzu3TBS09rhsFfOILnn2PPHjPjB4tna3w==
X-Gm-Gg: AYBFou2sptZQodLv6E5Bfi1tfgnuP5fme0bEFuwT6DfBnHZUTmqp/mswgaCh8sS68fA
	VacWKfp9yzsprkIcMZPK4Qs44ucX54uWq45DK3PDoJcYA/vUrA3pCCXwCwLPvWDeiMaV47CZGDC
	3rpM6aFxMLcV7ecgPxljtZ/Sy0lgetyfq3WNHEt12HYacCQ6OsnAWLUpemSQw6Q0BQwTtRPXm6X
	YZ+f2FzWNuOUTdWNTIlhZhF1s2DbXyFCVZ8EdlyEln+9XyabpbQVajjkNfB34DnsYit83RmQM44
	ZWu7CTxqnZpruilwoNnPus/7y/VRvpB7wPeBjL1dBzHDzCuly88H5jLVyq1nSXeIT8xDAiS0ndH
	F4jmZlmc3zIf36j2I9YaLOnbe0R1NYv3wV3xi6vDKYdEv26eDNIyRnfwiXfj7K4Kn7Y+hju/0/v
	LAyzV5zFiw7AE/U+Jc9OFwUgTfVsJR3ATjcyDYJBpzzGq+nT+RolxMUZazBcPvDU9mXYM=
X-Received: by 2002:a17:907:6ea2:b0:c29:5340:182e with SMTP id a640c23a62f3a-c2aade19438mr144048266b.2.1790150835570;
        Wed, 23 Sep 2026 01:07:15 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c6022sm63898766b.14.2026.09.23.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:07:14 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:07:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: Re: [linux-next:master 4776/8910]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn:
 platform_get_irq() does not return zero
Message-ID: <arOIr1dTk46HVFFn@stanley.mountain>
References: <202609230734.R1jtbjb4-lkp@intel.com>
 <CAABR9nGwX8v2sdRCe1+NBVTS2O+7s3GiJpTVJ-0mK23p1YLUCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nGwX8v2sdRCe1+NBVTS2O+7s3GiJpTVJ-0mK23p1YLUCA@mail.gmail.com>

On Wed, Sep 23, 2026 at 02:35:58PM +0700, Bui Duc Phuc wrote:
> It seems the analysis tool may have been mistaken in this case.
> 
> 
> > bb2b71024976a39 bui duc phuc             2026-09-09 @2974               if (!lp->rx_irq || !lp->tx_irq) {
> >
> > These should be checks for negative instead of zero.
> >
> 
> The check is intended for the case where rx_irq and tx_irq are obtained from
> irq_of_parse_and_map(), which returns 0 on failure.
> 
> > 95219aa538e11d5 Srikanth Thokala         2015-05-05  2975                       dev_err(&pdev->dev, "could not determine irqs\n");
> > bb2b71024976a39 bui duc phuc             2026-09-09  2976                       return -EINVAL;
> > 8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977               }
> > bb2b71024976a39 bui duc phuc             2026-09-09  2978               if (lp->rx_irq < 0)
> >
> 
> This check handles the error return from platform_get_irq()

Ah.  Right.  That works.  Sorry.

I kind of hate that we still have irq functions that return zero on
error instead of a normal error code.  It's a historical artifact.

regards,
dan carpenter

