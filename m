Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1362431076C
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761722564; cv=none; b=SFlp2HqC+1q3ToRofoRemakn51m7Dx3DS163pOZIqeouvFtyFyp0Sx3qUuLI+EGaHs6YLYrNxbnW/Cu1XRs5kzj0g/N47QiTMpkDHVKRbN0ejip8PA3oDjoNwqIf3f8C+VRtVLIxkq8rKq8Zq3ls9dx/fY/Fxp9+3IwvqmehTzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761722564; c=relaxed/simple;
	bh=38Eo1P6RRDbm7EclJHqXCna4ukniZc5nALvl1JL0vdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci1nZvZwcVpe4tQQWUnftz2zwdtMIyX9yzEbN4euhDjzQTGSIBVxdZuIdsMv0lNtfYrSMbtFfN/OcoR5yDV+ELtjJndJb7UlO0xs6CiNndH1BQK/iHcSlnkH3QrxEub0PUPIeipk5XYEOMs51FWzNWGhySFTgBswGU7OTvoourc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcVpQ3Pu; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcVpQ3Pu"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso954216b3a.2
        for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 00:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761722562; x=1762327362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LID1edKT1JVB/T0mGZC8Aw5XEVCKHk0/2C+33wP9ZS8=;
        b=IcVpQ3Pu0OWyTKbTJ24Ji5jFVqQ/8dnHwucDk0oX+28AqLE1H9uSOlQxcgvXTpp/NL
         del8+yOPqU1LI0nh3n8wfKMmgXR61RxqNX5voz53EDcGL2NpU0rqIU+96iheFF7qFfoC
         z/ZsjBwKLb0igxruBLdbBoxH42xRfvpk0MfxCmAAoA/Eb+CrM4dQfsr9l5OLbdAUYutr
         5tsjKUcptoCjSBbpPbjHEUIPTX4m9W1SrJGVvy66TPtbVRHGQr6y8VTTejjIpVPeir6R
         ew+4XH2XdclEjNb8t8b0gcZqWLM/X4MwchquKgJhnSSvGiYOvPrfyapXYbdz7B4hgPBc
         xaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761722562; x=1762327362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LID1edKT1JVB/T0mGZC8Aw5XEVCKHk0/2C+33wP9ZS8=;
        b=kdU+LMhWtyemL2eNaJaJuG+1ZA6a8G7ZYG3ekQU2HjnNl1Naf/ujMPf6wkUPbN4ZCf
         B3LajzV7atL9rMW5UGZbe03aYU99X+ao+VaThr9G0UkmsxFok25LZsgOJxMRPUC8STTt
         KuwpD+40imvaNUzvg0CvrXfkn7yWFQ5yYLBIVlbvVyx0d58if3o+w+Ra9w5syckRkcBb
         odMwVYePumcYRhZG0x+6JEBic/ZO9OG2DwcPDfq6oeY1PDz8CdcJBrFceexSXglL1oVn
         c+fZxfTUWxb+EY2xfwx8L7C6+UwnEJuxm+EKiPZ4DNCHjsfMAgY3GguEjlQZMHdJ8e6Z
         Y15Q==
X-Gm-Message-State: AOJu0YwAF4pHbgvtxwexKDPEl40Fjv7jcKU1q73LxMLxNDH0nXqRUVov
	8U24mizyjR8nA8X7LlnOjkcR4wDITe9wk6m01L8E1sJhF4ixkVymTEpUhFo//vvwWWQ=
X-Gm-Gg: ASbGncsgJMUzo4gofiC56uDFARYqID6JLGPgYOZ414RIwd1ycBHsLlqQDow6PPyhm9k
	mU8k2UouafBgKW0d5raQBAasxNRlEq/bwHkvJ9Mtqt71GKKO3WjccVBbmYBwHKpYdiF5jOewhqV
	z/RKY2wMOSYXYdJsuGgbYOZcYoWirXDajJPrXhAYB90PIuL/GsT05DJ9X32f6GokvVBh7MCDm5v
	OSAZwqDA3WzNmDpYiI8JncJy88l16zXz53IY2K5Mx9lL0k7D2o3IQX9LA+315v5/lGBgx6aYo06
	df0N21HQ+PUd5wThURCyW5IDz+uPxASL68n+RE+Vq8uO+UWZDY4aWQMrLbUdR7/JR2HjMkrmop5
	JnNZpqbDiP74hFbt92W3WXwN4gRqLe9JdtLEmJ8F9bIAYPnUqSxC6fxXRhdYPmU+vNiL9JKMews
	QKog==
X-Google-Smtp-Source: AGHT+IEhdlp8hcgPuzis1yOLKf8mKDRjGcPPEyjXNdtjkDYKEEcpG2vOnMqPOc1m3K1HLryEF62BgA==
X-Received: by 2002:a05:6a00:170c:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-7a4e2722d99mr1979822b3a.3.1761722562258;
        Wed, 29 Oct 2025 00:22:42 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41409f714sm13951002b3a.72.2025.10.29.00.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 00:22:41 -0700 (PDT)
Date: Wed, 29 Oct 2025 12:52:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev
Subject: Re: [vireshk:virtio/msg-xen 12/16] net/vmw_vsock/af_vsock.c:2292
 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.
Message-ID: <w5ouuibeaodg45yai4kyi5sipltb6lgykthcngf3sw5xekzype@z4e3khjuevsz>
References: <202510291001.CGX6PpWu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202510291001.CGX6PpWu-lkp@intel.com>

On 29-10-25, 10:14, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
> head:   27143c677cd93a347826a8702540f4b7cdb0d14e
> commit: 8d1fc26e2f13344cd4d4f0552d6f0eaaade83913 [12/16] vsock: Add memory sharing support
> config: x86_64-randconfig-161-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291001.CGX6PpWu-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510291001.CGX6PpWu-lkp@intel.com/
> 
> smatch warnings:
> net/vmw_vsock/af_vsock.c:2292 vsock_connectible_sendmsg() warn: inconsistent returns 'sk'.
> 
> vim +/sk +2292 net/vmw_vsock/af_vsock.c

Thanks Dan. Will have a look.

Btw, this is WIP stuff and isn't posted upstream yet.

-- 
viresh
