Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3CC1D9346
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 17:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806137; cv=none; b=oHn7ByvAdzYWiURmLX15DFE8bO1oA4KuGl0huJX+9+jUVOfe9zvABQ6jmA6OTNAG9OnSF8DbaYpOxmfWyQsqI10iG+Bse44DRI1vMZRUnehHIZhR7doxHDIIHYKWB0foRGDeLfWKdyKO4dBw5NHKDT55cNyyYlVhRtiHnSW7YWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806137; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeKNmS+Ab+8Nt4bS5/wMmKxI8rQo8ariYK4BSrFfmIOLB7L4HpXYLn6uwvQAhJfr5tcpVZbP4EDTlBtp+j2pDDm2NiBzqespe8mtXOkqQjflODwbPuHrlA82p93deqVJQSgaKIuzRSksKQrk1SaSSG3eI9fwGZpyYp+sIRHV9X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y3FAd6Jq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y3FAd6Jq"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88a2f2e5445so26261936d6.1
        for <oe-kbuild@lists.linux.dev>; Wed, 07 Jan 2026 09:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806135; x=1768410935; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Y3FAd6JqrM7CxwfL2+Q13DUXvrlGKpb3R56Gzu4FlFpc5R4zU2HxEYoFCYV4F2P50+
         Cvav0kK5/EYRC5LpFJM5BWlfuJoTNh/YFNxfqiGBj1IK4cWX0o2yi1bvmiCQ7yBck3WF
         vtR1t8WMvDfEpWcp7tNFtYKbwOTsL0mxAVcPwtViWdQVlN743BS2FyfdqRVN0PNNpTmG
         fXG11us30VCdw5sCFT9/dd5BXRXhoi4K0LdTYSvQxq3lM8a11n0XDPQHJvOlcth6QqPc
         YfqaLNFnvXSQ4A/d8M3EYObs0WDVAfV+x1RJVWFWvgnBoL6mjrHDNBfxt0+JClJttjpG
         ewGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806135; x=1768410935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=t1MUXf0zCc6wNgejyJSxgdAS26egiJ8aKgNTkGSTQYxupAwEkC16hFhfxcroOQ3tNh
         NQ+RfJUo7uooTcmLFlAWcXOjNO9knVA6QSFbxppN2f/zUcOi81qzq8ihDv13jP+aXE14
         vlL0TSF6GapQBhZZeMUH3ujUw1CjtHF7hDuFiiUdk3eoWC5FJ45DH4KZXXFZ/eNdqSL2
         9kvyI/HG/Ap5HblZ/tKy/ie4IeHHHd9FfduMqrybk7nYUn/15Q0coiRP2teUk0IoTuLJ
         KMQxBM/fUyvNBq8pPe5IlSMwYfCeZJtxw+cfXqPeZUy0ShfJQEeVFps9UT/MzjmBqdzQ
         YBwQ==
X-Gm-Message-State: AOJu0YzWW8v0lrUOXxsQqbr1hDdWVGOoPnLYY6htjBzT+mZYRPrc3Iiy
	jjyk+gy48S+EFfIVWCbXn92FOh8oQH0rQ2KKQ7kYuFqwCw3g2ALKXGv3
X-Gm-Gg: AY/fxX5vHQdLKnmwEExERRRWoOmv2vpxxj26sDVpf4VdB8p8IoleP70cYQf0Rp3wAQ2
	TMZzAgksydW3v+BdDPp7aH2bDXjdS40rLyeLYSLlATUTVgrSB8LjeJ8Z/rSlyQrPQwn78fcbNlP
	uKiw3XIilmO2Di5c/dAHAopETzpyCDmEiUvbUUY/D7BBcRFQJ5R1sSnPPXRG7J5ZvhP8Xsh5LCJ
	uND2x2bvoEvsgSavZPYjrIopxcrkZuUK6sQb2clUUt21EjHd0ljqOTSwNBkqLe9kHUsiYmbUkc0
	DWEXCnCpMwKnLea/WClHLvHGZetQogpN6S5eVkDKZwyKZ3GCVMF0C/YpXiBRgCGyl+eobzj8n1a
	dGO/ukD0C2ua66JrHJiKWAo0er6UXvm1JCVIAzl3FDfkZ03LeOG2wAeQgA3PURCrvCEDcmdZSGu
	i0eZmmaQq2a0YIiJZlck+iRJARNc4GSOjjM4X2lbXblmSRxaw=
X-Google-Smtp-Source: AGHT+IGBcD/eFtEImj7e5KYE8GOV6+e1HKiyKKDtFqn1cFCTIVq/A/5Pxj6UDNDHAc/7Yp4J5A1Nrw==
X-Received: by 2002:a05:6214:20c4:b0:87c:152c:7b25 with SMTP id 6a1803df08f44-8908417a83emr46946426d6.13.1767806135006;
        Wed, 07 Jan 2026 09:15:35 -0800 (PST)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907726f1f1sm36313046d6.52.2026.01.07.09.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:15:33 -0800 (PST)
Date: Thu, 8 Jan 2026 01:15:29 +0800
From: Kairui Song <ryncsn@gmail.com>
To: Linux Memory Management List <linux-mm@kvack.org>, 
	kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: mm/vmscan.c:784 __remove_mapping() error: uninitialized symbol
 'ci'.
Message-ID: <aV6TfFOYng8mYzK6@KASONG-MC4>
References: <202601010353.E7g5cCo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="__Tagbar__.1"
In-Reply-To: <202601010353.E7g5cCo8-lkp@intel.com>

