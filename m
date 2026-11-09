Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207848;
	b=v9ecOrYCd4EqKV2foD5r9rq39AxDV9HuOoEssUuI9gbAvx1JHWVpVFXAVp7l2m5R5Xhb
	 7C+iJynhDZIkKRobm/zRNiTNrzVGUqvDVtmAZNHK5t+LrpE/5Eern6Kub4zNaOhgN8MYe
	 UjZwBUJr7FpneF/ITiK5LpZAiE/vVXmXeJ6MAupE8AvNExeM7qlrCZ+//t7lhQ4+/ok1t
	 ob0PuotFNPZwAtHUNyqd/2bGFuhYKOxmDc4xN3KxaZdVgqtiDoKNK7r6cyWUj1oDWx5SS
	 wrFoLd/+/SqS+5xKzHwuzheSTN36xalRZShiVIkFL2DYhFK5Eq1TM12g2rzruipjVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207848;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xkoceP9KNqVUzu6aZn8SkVNvZ5cicX0gL2WBvmszDO0=;
	b=ct+LSiOU4fcjcX3cJX5zDUpO7vQk6sb2WU5RCQoz9UA5sIxM7Hy2ux0sp/kHZzrt6iaA
	 37v9t9sqP9cCkWSNaZ4+10KlpeIMT+VYWmJsME3XdmIcdAhrgZmVQJxUJsF4XIRU9IJzs
	 hqFXOd9O7XwT/K7pk5W6JsaQFBok/WhuCDWtD+tuNbqdAwA1o2YGH3vj3SB5YoIZwSCDg
	 HX1Yu3XQ3ln3Ji+HA3vIkd9WRdSwZql2C+XILl/fN6hP4cCWcRtKfG4M5fRlXNhALqWof
	 ZlZCnbx4OfNf3LT1bhjZQArR47dZBQmsQ9rQmEqE/pcYIHnOJzwbFjwtEB0VpDfbTgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="SfD7Uf/t";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127C606A323
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Nov 2026 07:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7127C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=SfD7Uf/t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xkoc
	eP9KNqVUzu6aZn8SkVNvZ5cicX0gL2WBvmszDO0=; b=SfD7Uf/ta0UpitQb6q0y
	YjWlstzjG8IT7XNqCbQ8i4bQb2o+kGyog0n/SRNlyxOKLbg9wAUmKSrq0e+Gh9t5
	outTCr0kgb1dLy4Olc8MsGb6mWknEuvNqtIwBJu8Wi9DyuKYZ533nwpHizMa0Ary
	3Yq1nC85lxhhlX24+NbuMEsQ2udxWFN77U2QbeNjwpPIjrQ8mMiQEZe2zyhI7jdQ
	+6hyBdNh9Dynb1Tc2DMbHyVy5iyDZ44UmWdq8aZ/Vjo+WfrqR6Kbob3k8RGwnswW
	wsX5APsWy7XCKtTikX4G1jAi0kTc3z5V8wkQs2laGXPuP/pCsxPdVZyXE1fcGEeO
	0Q==
Received: (qmail 3132830 invoked from network); 9 Nov 2026 08:04:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 08:04:03 +0100
X-UD-Smtp-Session: l3s3148p1@O1cqkdJf0OUujntg
Date: Mon, 9 Nov 2026 08:04:03 +0100
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [wsa:i2c/for-andi 13/16] drivers/i2c/busses/i2c-nomadik.c:737
 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success
Message-ID: <avFwY4aH5vtU8Lcw@ninjato>
References: <202611081308.P8lYvNIg-lkp@intel.com>
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
In-Reply-To: <202611081308.P8lYvNIg-lkp@intel.com>


> New smatch warnings:
> drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success

Didn't know that. Good catch! Thank you.

