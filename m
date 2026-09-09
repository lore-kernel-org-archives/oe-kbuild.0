Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E993438E8A1
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Sep 2026 17:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975450; cv=none; b=VIiFNiRJ8hFXSsM0RhlgpAyFFjSdAzvtd4o1ILkf3hVEAr3rFbIpnbm4DXuoG5UKzb01nB847ixj3Cef5oCYTqXXngAwr8cKDlJkKWmPtd63GYUVAzDDxSoMku89BiGNzPggU6Nx9e3aMf/BhSU/uJ2CygBz5cKz9gZJ4Q8Mrk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975450; c=relaxed/simple;
	bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
	h=MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:From:
	 To:Cc:Content-Type; b=eNrBahhbeAfntXa2qs9Y/J64ThNgkKYq5UEaE2FohT7ys34y57Of5rGWTOHnrZYo89mFxyx8qOjCo1lkXxYyoMFlNZTgckIGKfzah/MuXD5k4TWX+NfXp3XsxV1oNygEv/02En++PMm6G1fZjALAyN4vaqnB80AEKY3SxP3q+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+tidQUJ; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+tidQUJ"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so84271a91.1
        for <oe-kbuild@lists.linux.dev>; Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788975447; x=1789580247; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=Y+tidQUJ9GNeNAB0gnZ003tHI53Do65NGD5lZt5OknSd2GsX+DTjHDdjTyc29O8brk
         eFHqvQdEPBoW3XoLNlH63l2fawKJe+Cvl1eVMn+Zj3Ym60n/KfZ5ykYk7PpYR4qYKL9U
         kzVgZ+Xv2NMhltQ6R3imfGv02DmwYDMU9jx7cvPL7zdta9poEAxu0FVxQ069vOjOCSjc
         SIWT0gQGRdHthiGbm6YGJT84Ip/57UXhq94aeimVpaTpIuOWFCempEKZiYQ9Bt+/Jkok
         ApaqJgntYSMJZJMvjP3X/5WmcmKAWdE23M/gmP7/f/cUbLLnmvmXp6IrcRSLjVMedj8a
         5fkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975447; x=1789580247;
        h=content-type:cc:to:from:subject:date:message-id:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gllQAeSfz8wD6OjJWJ5fccK3rEpdJJl3i7TSr7C1Q/s=;
        b=AdhvrkBfE8AVPBSqYo7u0RonLASY2sJic9lvO5nuhxUZ2XKpr9ulYzeZ/c0Cqe6yFf
         hdfbjJXu31UpUxmACKbbv5BgOlF+VqodT06BHTWA3gavPkaD00lvacuHF8gQ9jow0i2h
         o95mGo4C4VY3s95H+8Dxdx+5V+xKN5qQBqvkCGEj3UUgwwfA4dsk09SOBdsMqATa7BqN
         eXulNl2QofOErf3Bwe9XcfKsTlIYJ+RuKRZ1owFEchgmY/96JsZSn4R0oL098xMO3xOu
         6kSpHUCt8jZkcgsi/Z0oABYx/h6oU6Ug1O7oHbDOiANw74lrmhDrKNODlyJ2PxYrshbT
         OM1Q==
X-Forwarded-Encrypted: i=1; AKwUvBydPe7BI4NgAu9dm3ufJ30qaMcJFsn9lpPeZcmT/1F0Q/jywpY8glO274oSFrKKoOzYzbkM1I95PKw=@lists.linux.dev
X-Gm-Message-State: AFuF++k9o1TmtgFY9YQ2+7YiRN3Aw8MZcworcRGitoXpS7sJ0ljNhFWk
	zK4k9BypQvyHRmBK0UGv/vb0QV6C5GjRbwhOi0hjLt2oc5VprUyQkND/yV9DO9nWtvQ8vgp9Nj4
	DRwVy91uK+36C9ag0aWBcPLwB3pgisOnvwQ==
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: from pjbpm12.prod.google.com ([2002:a17:90b:3c4c:b0:396:702b:655e])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:37cf:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-39d77aa1851mr284135a91.8.1788975447027;
 Wed, 09 Sep 2026 10:37:27 -0700 (PDT)
In-Reply-To: <202608260405.gHL6gOJf-lkp@intel.com>
References: <20260824-pcie-lmt-v6-1-bab4ce233fa5@google.com> <202608260405.gHL6gOJf-lkp@intel.com>
Message-ID: <18d3b7b0cfb6fcb1.3137322e31392e39302e313337.965f0.0000sendgmr@google.com>
Date: Wed, 09 Sep 2026 17:37:27 +0000
Subject: Re: [PATCH v6] PCI/pcie: Add PCIe Lane Margining at Receiver (LMR) support
From: Priyank Rathod <rathodpriyank@google.com>
To: Dan Carpenter <error27@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, oe-kbuild@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-kselftest@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report!

This series has since been decomposed and restructured into a 3-patch stack,
and this issue was already resolved in the v3 submission:
https://lore.kernel.org/r/20260904-pcie-link-endpoints-v3-0-4b9a91bd4b35@google.com

Thanks,
Priyank
