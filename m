Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1DE2DE6F8
	for <oe-kbuild@lists.linux.dev>; Sat,  2 May 2026 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777741515; cv=none; b=QfqNSyyBaJD0Qso9aN3KLPLaNBar3SyyNdcr9gSqWcAJwPGy4wjOdvEvuXDT4GwI83EpwNl7m2aEgjACIFT0suVb4IpQ4GyIVzGzcX4Ekm5KWzMtdICnHNOCdaFMyxyHrLIm0UQ8FFxHhg5SlGKGuF99bW3M91gY42RxSqp8q5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777741515; c=relaxed/simple;
	bh=FdBVkyT70nLb57XfOr6JT3sFi3ZSJD39ANIk5R41Idk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzOH0a65DLZ3Grb70SAFE8nFz3T3fVEMj8Wb+toAi6RDY0NbTlMt5V2V7iU1sju+VmMFvMT5372YLoaG2Zx9eJ38wDONyvzMD7wJxUyTskyElVhg1ZmikKl6jAqHUFgdueWjlgi8tU0IjQfHVJp6XSarTS4SrPlp1YTPRlTNcpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQvtBn1b; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQvtBn1b"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe608cb92so1564955f8f.2
        for <oe-kbuild@lists.linux.dev>; Sat, 02 May 2026 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777741510; x=1778346310; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1OvxfOGDImPDEvap085cD/4NlYHfKvABsDFeu1Dgyuc=;
        b=bQvtBn1bnlWLica1GcwjYRYSbtjvxtRkBoX9QrkZMn7xpuDHm6HSxCpiO/52KG6zrq
         jkTl6IUpQrR5/5LdbaREy0h50T09nkc+vdPqeVB95FVIJ2RsR9yixEx+aEMb2F7QqM8P
         wXRBiRC9ssBAhTkEvjHJMVb288RfPj2jIXfqiINyCA7KGQHAz8GhquQE2lKaI6fiaInd
         A58VhEkYmaaY28BS6islrhijLvqXxGAYX6yOdnNyzGNqzsTUkNkAIli+Wy8ed7ksRvfj
         jNbLqiSPu8Vf0CfxkMbb78iHXUvUG20UCCJkJQbAtCzrAJ78Ef02dw8jpOJ+elYumtlD
         fFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777741510; x=1778346310;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OvxfOGDImPDEvap085cD/4NlYHfKvABsDFeu1Dgyuc=;
        b=CsRNOu2A9JmQ4wFsdUSXJ90gRPTVjE2LdSAPBF1g3rgbqY0paeZpFI3fsrjsW8jh0S
         2U+YLJLzcKDpAriA5WtzKrJd2X7SB1LCFR0cPXkWci0Icm6rc3XrT4yd50WyheE6wsT+
         AdukxcXDHS0bIXwJp2JYOYo0bESUVUFxcT7RvLGCFkMOK1xmP1j+W0BAAA40CsnKbK8g
         ruHiVmH8vAkzypmION+apUCL4ubvuVRN6CU3tMufx8D+P9ej+TLW97n987eBe8+O/J1h
         M9iEqLhimH3Y3H9+4Cd74eEB2QODbS0LN8cifBPihJdS/CP6J2VFV64k9K6HvDMmVixy
         J9pQ==
X-Gm-Message-State: AOJu0Yx048M2xxlRQO99oZGKG8hUjU6lDpmlReB/q16bld43yWVPJCzq
	bbgvwLDniRoddm/ZKOnGm9s06K8xkxyUOlaT/a2jAydf+2at37tY3zLzZBka3A==
X-Gm-Gg: AeBDieuNb0PUO7DW0tHb4PkAMRHMopTqf1woOMVusWyV9ecCqBLyiTJu1l0i9IS8WzX
	vPdBrnsg4Dh9x/bYJ6TFoqVW+uj+11PyrGjQgiIUWl2d67R1he0oz/xFxNa2DOEL5E/0wory6q+
	oHT6Vq1iTqv26T+/7c6YOKTJ+mBzUkERBBwS11ibpYY1BzZuxMkhSPxTHbd+d8ysksrpsYnGW6K
	5oeIWN9pcXxOsW+ZEti0CcOPbDb6rZJntDx7UeCi/dfO56461DXsuUU6kpCFABYm0FAx48V58fv
	+FOZpGwXsWjpHIvNuQRb2hJ3QGFBLD48iuluDIX+GL9xkcdD0DOpYrJGRLCwTEaFqlWngYqPOV3
	wjZSSitF4qNO0ALv1mixayqPtSiAfZApi3FXXna+96x1Ziv6gOzMJKCbuenWBzRfb501lL3vUgh
	7itBzjPDFS/AioFZ6PLXzKVMqdDpXKgA==
X-Received: by 2002:a05:6000:1acf:b0:441:2473:c30a with SMTP id ffacd0b85a97d-44bb5c425d4mr5958184f8f.31.1777741510282;
        Sat, 02 May 2026 10:05:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aaad6sm11422643f8f.28.2026.05.02.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 10:05:09 -0700 (PDT)
Date: Sat, 2 May 2026 20:05:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Tristan Madani <tristmd@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: Re: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware
 bssdescriptsize in scan response
Message-ID: <afYuwVf23vKag2XA@stanley.mountain>
References: <20260421135027.357622-3-tristmd@gmail.com>
 <202605030019.lL8x0ZPx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605030019.lL8x0ZPx-lkp@intel.com>

On Sat, May 02, 2026 at 08:02:39PM +0300, Dan Carpenter wrote:
> Hi Tristan,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Tristan-Madani/wifi-libertas-fix-OOB-read-from-firmware-pkt_ptr-offset-in-RX-path/20260423-061353
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
> patch link:    https://lore.kernel.org/r/20260421135027.357622-3-tristmd%40gmail.com
> patch subject: [PATCH v3 2/2] wifi: libertas: fix OOB read from firmware bssdescriptsize in scan response
> config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260503/202605030019.lL8x0ZPx-lkp@intel.com/config)
          ^^^^^^^^^^^^^^^^^^^
Of course, it can't wrap on 64 bit systems.  But just do

	if (size_add(le32_to_cpu(p_rx_pd->pkt_ptr), sizeof(struct rxpackethdr)) > skb->len) {

I don't know if anyone uses this hardware on 32 bit systems but we may
as well do it right.

regards,
dan carpenter

