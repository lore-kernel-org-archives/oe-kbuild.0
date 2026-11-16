Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808922;
	b=u/US+UCU0nHoSg/k8//52HYVDG2TvAbs2jyBwFQDi6Nd5tspBBYlw0jvSeZtmIfYX+V4
	 GBPskw3iCPaaCx6RDLdbzKjhYUPdgK7iQCqabeRcKpJRjOMLFwmoWDUc0JiXMcV2pVKOG
	 7CMZrhc1eSHfQD6mA3z5FIm/10DCJe2UyrafqzDSz/LNP8xjnFWZCQw4cfMBn2AOUte/Z
	 Z0J52aufYgE8cDrxw1PFi3Dpuo075JQmnPGVKOC5XJs8wTIOSl2vuw6paLx/J+JBNtwIR
	 0yOiCSeRCNrc1iDjPb0qfS0Tk+rky7j+Hex7xVabeYmk7mxRxg+xXQgx8NHn2gGNKlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
	b=aaRETjA4fiTPqoHQSikb6GYQgvrwU/9qNoC7A8Hzvq045IMDNuM1HSiwf8nLFjcwqOT/
	 CSI3URfwMiVIyaECR8Gt2JEQHGOI5svQhn8IP0DsRXZjrJ1xVss7BM0H6qRTucLmIgY3C
	 2Hrr7gfeLdXPcFx6QeI+7P915PV8OgVKlxNeo6AllHK6NxjfynP78Lc6WRyVHufPsLToj
	 PYv1mXqyMs0o5UugphZVzmwICue8Arm7C9NX2iC9rpj0Gc4fVRSNNF33fKBiBKz3mp4lY
	 Vjl5taQxvzPdKeDi7pCXD5K4QT4vGwu1fYhSemLE9BRouLsMzzUQBAsdBrp3evctzhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPRzpq2n;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967B2606A329
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 06:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 967B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPRzpq2n
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17641685e9.3
        for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 22:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808921; x=1795413721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
        b=aPRzpq2nOU0mR52VyHYPPsi5MpEmN0Ywe8sEbxphCZIQvce3qUER2/AVG+RCncLjcW
         H8bvDYjiFg8jKW/nLMIe8k7IZE36lJXJfXzJxW9uSI3xY8gr6Q7Xkxtw7rmlFtox/D4R
         hPsRfQ7yAP8rz6a2t8ZcTf5cdt9MMgD3Y6kZ/PUGfoxwsioNDUoOkPbu7Dg2J4ge2dkK
         /wxDmXE8AUTk92zF4aUluq7mOD+u3xCmWkqN/zvPcTnM4WRiIYGRJBH3YWLlyQEcCK1N
         1E9bu1kWVPkCmVJaVzV4N5mf+o605SxHIBtaK0x2CMrxzew8ai5/RTEdkntHssrmnU0U
         GOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808921; x=1795413721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6FNxbnnu/0yNQoPXbolulSs+Roxu0nUNixTH/GF4RF8=;
        b=Z/yX11NTpKeI8rfeJkbt29xzL9x4n1Z7Zv7R17mZuw8aKiICQ/GaNpvlDZLgZd/G5r
         pKoWRNsqDxGEXh/OeXNA9UKDO8JKmTuGjfem6QV1qx5mQ2ypY/sGUx0hTYGAVsPKhV2p
         hXbVf+rzF7BxEwF12Pjx/dMR2it02j041eo/uL0UZ+geZjwy3oQ6VBNEJXLem96TVETu
         i5RFXTJi1Ow4PKp8bfSwK/1l8fQGInglW3GJAsHhjUx3nSmBdiN1zGU7VRlampkDN+tN
         gcohRMB2E455AUzl30z/qQeAk8PGTBT3iN9/K7yPTtniTOOCyNFR79jHU2X1Vpk2+YwM
         Zapg==
X-Gm-Message-State: APuU4Z/gyMkEUR8kVWEwXEiwInX+S0iJkVHDXFwd7IfB7m38JGe4LOWs
	X/aVYwBlogTTkp34wVAzgmOdhuOWJ/kY+PF2NAmNJt7aJQPgFdOEY8Ly
X-Gm-Gg: AYBFou2qAUVVOFUGODOtHKEl4dqWUsDszAkF9JTpNggirHZx3/n9kxyb6Kk+bHbPhZx
	TCxA163RP8EbCMrq8XGzYI0DFhUTzXSGvKrru3NP5mTFFswihPjSC05+XjwhFpYXO09gxo1pAhK
	YDuurkIacWMHXR7RZHb3czBQEok/w2RfnHEFFDYJBc8n0xn74H8I/duxKxqv6vwi/LqHSz06Mqt
	AMEO/r+N/zgBbQjyYwyVeHdFnhAorj2QL3VbZyxPAfgjGsT/YBCnTrbmE0O1Hu7bVY8OZgwL7d+
	8/AEDlttIy8Hf+BHbjOnrR2zw8itY4QOuCzXOmhRQHPOKmrqVQItIjG8mJq7vwSsyONlP5DXd0Q
	J7BN6bKlq2vYq94+sakK+KxtSqoekRRmpKl0aoFTC/GqcfW+rZ18e1dcvE9dEKoEKP4AMDetCSZ
	t7DJf2mugbgU1MWkoR8hdFPQIaxq8bhZS9VfGGeqZeCZEOogu23tbS4WXcbJxjKwuuMBTxS+ays
	5ry4YcBnmiM6VKo1/NMPWu92rbiZFtGgZVLb1QmonTY5P6f/Mhfd7sg7/5u0ottmjDsssuzWjYO
	iqQTL4CQVZDjnQ+GIJITwMjmGSzMuXcsbePiZGa7suVUmgBuqruR/sNRchtCS0mebZku2CVxf88
	4fJ9mPVE9zqaQFmL2XnsvBAtpsLZTc5bpvpvA1NozNtwUBLWmUa3TpwiIWW+coeZMLbQ=
X-Received: by 2002:a05:600c:c165:b0:4bb:685e:cc42 with SMTP id 5b1f17b1804b1-4bb685ecce6mr91958735e9.18.1794808920781;
        Sun, 15 Nov 2026 22:02:00 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm372885465e9.12.2026.11.15.22.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:00 -0800 (PST)
Date: Mon, 16 Nov 2026 09:01:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Phillip Lougher <phillip@squashfs.org.uk>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	mm-commits@vger.kernel.org
Subject: Re: [akpm-mm:mm-nonmm-unstable 139/151] fs/squashfs/namei.c:283
 squashfs_lookup() warn: passing zero to 'ERR_PTR'
Message-ID: <avqcVK8VjSl6RqJ_@stanley.mountain>
References: <202611131955.0Gd7ipSP-lkp@intel.com>
 <20261115215756.839150412f8e2ce4bab5105c@linux-foundation.org>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115215756.839150412f8e2ce4bab5105c@linux-foundation.org>

On Sun, Nov 15, 2026 at 09:57:56PM -0800, Andrew Morton wrote:
> On Mon, 16 Nov 2026 08:26:18 +0300 Dan Carpenter <error27@gmail.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> > head:   152f0559e66c079f717de375f133ff127afb1f58
> > commit: 5213b0a08263b2191b86b046c3a63f11e8abc399 [139/151] Squashfs: fix variables in directory code and add more sanity checks
> > config: um-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131955.0Gd7ipSP-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
> > smatch: v0.5.0-9187-g5189e3fb
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Closes: https://lore.kernel.org/r/202611131955.0Gd7ipSP-lkp@intel.com/
> > 
> > New smatch warnings:
> > fs/squashfs/namei.c:283 squashfs_lookup() warn: passing zero to 'ERR_PTR'
> 
> OK.
> 
> > 5213b0a08263b21 Phillip Lougher 2026-11-11  224  			if (!squashfs_dir_space(dir, length, sizeof(*dire)))
> > 5213b0a08263b21 Phillip Lougher 2026-11-11  225  				goto read_failure;
> > 
> > We need an error code on this path.
> > 
> 
> How's this?
> 

There were two paths which need an error code.

regards,
dan carpenter

