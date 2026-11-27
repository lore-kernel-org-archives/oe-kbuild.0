Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795760103;
	b=W3aGB5q6cLtDwIZ07dykyLlYnxjGEAyQGlJQyIwNVGEPEkqzSvVym1HLVraA4dhVmWtW
	 HG8I0XV0Ms+fYlri/Siuo7XEl37NUrkeYVhlMjeQDybGYhrLYAgfCNTyJOD7LQurCbtYO
	 BOiDQBU90HOM1LfqP6xrNxHo1AcfL1IBnM8HhSmuQ5a6lJO/Bewq9YD9SXV3JCm4pKPKe
	 lIbgJlyTgMi2DJSq6Ke+oygZkaS8SrbfdX1HWGtOdjJkmGVTdJCiK19g9AhX+mlmQ/6Fa
	 SWA6ln/+xyLhXYGvkY/AaisFwcYixGwMx+HinG4k89TqLHzUg7LV2ix+2PQmeRSnuJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795760103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
	b=bsuNnCzDGVhlyxbNgMG8sWI9CWypHUns+g1fEmrybvi2N0W2OG101a570WHWItCzaogB
	 2asjV9JT0xVDsvtJuAIjAETvbE2sbT2Wag3G1ybHqy3nOonyPaWtaKGMJ2oE6fWYq6HQY
	 qC19D1w0u5PGQLHAAiMg1pF/mVOfnXQkVxMjkNYp0kAoafdRT6l1DzSF2syL9wuW9Ykb8
	 XIGsuxw1LmerjyXPAe8JCOzlERiX3qUbQippuC1yDZ4nYUxMriSWfwKnyt/gGW4xHVH2l
	 /BW0aCbZJ/63pvG202vvI+TEVv0wdpvF5fkKV5yVYM5mH5S3EwbILKWY5UJSq4ZSLQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pereq.eu;
	spf=pass smtp.mailfrom=cryspen.com;
	dkim=pass header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=g73JgnZU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DF8606A323
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Nov 2026 06:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7DF8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cryspen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=g73JgnZU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so50236955e9.0
        for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 22:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795760101; x=1796364901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
        b=g73JgnZULRI+EFn1x/b7AhgSv6Mk4iOnufKBO0xK4kvh+55aFK9IX8BaEwennnE81j
         UX6hTLZjfMQhseniYrlOjD1hXvTU/PiyCrltLB9PdFlfxnfZed3cKqnqke8HsNpmgFCs
         1zMOCOv38ABRxC6LUbQidbiGlPu9Nu94nNq02S7rIIoewKOtcwZSj7tA7li3opKLdIx6
         5wjE9T9GxUmtPuQ9CJtKAgCe1ly7Sx1fwgWNn7oyOWRTrw3ixmLkMy4/MnsFRtZzMqYt
         HITVfR84mONJ0VLsHxXA4ZmfS7G9+ajZ+dDoLx6WOY6vdREkC7gWA1/3tgeNHfZj1mv+
         4K3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760101; x=1796364901;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5VeSFAKw842mvl8PUGM5OyRSDHWV2W9U3+XW9s+w0GE=;
        b=mbhxF1gPgSSzga+z3gSKS6JAEsRXHwkJySbSjJ2STQqt7OQlIqIVGzILz/e2F8z2p/
         w8vcdiAqcBgEuJkg68fo56rP66Q0IcyeG5KN4vxH2HlRSYelyrZz9HhGTUMlABFCuvvb
         GBzXNhQUOCeWuxMC3QsfY5vwKZ4B9xI+nv3ynuhm5O0SUoYteCWIQX/2lKab+TKbbi2i
         l43nDx7U0gGFjHDq0uDg+YZ8NP8jO/HiqIIldpmZDOua35Qk0DNz1Q81IIBubccuWXMu
         U2JYF8wFYX0UMrb+YklSRcV6Mzwn+wEGp3q8dEbgZdRWzf9+xnMgXSDhYbxtFDJYyuj7
         Nz6Q==
X-Forwarded-Encrypted: i=1; AL+hErGAEtDAJnEPzEc6pnih055CJtm9s0hTnHC/vdp2Y0rwsA/9zznNSg9jjNAGr5fwe5W01Dtjksf1owA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9OMvU0v6NOJHH+Lf1azyfDNpU4+2OdqJK6BUocmpG1AXN6lVkq
	QAS+XvIkeb4tqbkJvKvYHEfVHovfZK4WP4cfBfLJR4MdjJ0PnhErHDegde4zisA1Mgs=
X-Gm-Gg: AZFdTZfcu8DZWcrFOQv1I4jJt7dNqIMxdz8fx1N5R95WU/BZitGUQWbPfSd7jDZfcfO
	8uRQmLBYiyZbGQNcXRTcbp7sSrWyJ4zDppdAyg5GBvzihk1/bJ/76P2wvhO0+JB0fCrCY2+UpPi
	0WkUxfzkDOAPVHosRI452aHCinB7GxbJAa2Oc6bKfRes+DVcXo7gIuyckB4eX3hWOiAhprlQjcN
	+CiFFbUhQGl7fhr+FiOTOHiRxvhqEQr9EJLBjrAqA8IURrUfVp3ASu8NT62ofeEL1A4Kc4YBoBC
	yTsOQbLHx/oRlAmkr0c5uLL4LlE77YMd0RlKxOIhT6xzPxFwP5Ko71LTt6qnyYVc0slBAWo7T/X
	dGh1uoYaC3L7QGLWGkfn+Bl/K46GxyR5yiPXCfCvWE0ausH5uWptTWTUpnvdcOIOgqO3w4nH2ap
	MplpIcsHV+f3MJHszLPsmr3U1v7sXok3aeitYdIo+rd299BmzpGGtFJ5Ayabu6TzkNCn3NlIV8f
	hOdyRhbyeeGoajnTDUzopjz9vV6Qu6vomAp4Rw7tJtNsweLg0ZJujbzaVi4RlcWkO+oErv5X1Pl
	a+tPyFPnuAGRaJff2kU=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr448194565e9.9.1795760100638;
        Thu, 26 Nov 2026 22:15:00 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b2437sm922527445e9.13.2026.11.26.22.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:15:00 -0800 (PST)
Date: Fri, 27 Nov 2026 09:14:56 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Mark Brown <broonie@kernel.org>,
	oe-kbuild@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lkp@intel.com
Subject: Re: [broonie-regulator:for-7.5 6/6]
 drivers/regulator/qcom-labibb-regulator.c:444 qcom_labibb_setup_ocp_irq()
 warn: 'vreg->ocp_irq' from request_threaded_irq() not released on lines:
 444.
Message-ID: <awkf4CNhSPz-lcEk@stanley.mountain>
References: <20261125184601.R647t8Sj-lkp@intel.com>
 <179567739729.2548149.711673218230357357@gmail.com>
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
In-Reply-To: <179567739729.2548149.711673218230357357@gmail.com>

When I send these emails, the only context I have is what's in the
email itself.  But I have now downloaded the git tree.  The init
process is a mess if "->done_this = true" flags.  That's a nightmare.

The better way is spelled out in my blog:
https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

In this way every function either succeeds or cleans up.  We only
have to keep track of the last thing we have allocated so we don't
need ->done_this flags to keep track of it all.  There is only just
the last thing to keep track of.

Looking at qcom_labibb_ocp_hw_enable() now, can those regmap_update_bits()
calls even fail?  It's not clear if we're undoing the "Clear irq latch
status" or the "Enable OCP HW interrupt"...  If we did the clean up inside
the qcom_labibb_ocp_hw_enable() instead of the caller, that would make
it more clear.

There are two callers so this weird error handling is probably done
deliberately,  that makes it even less clear what is failing and what
we are trying to do.  I would prefer to have a normal function the cleaned
up after itself and a weird-o qcom_labibb_ocp_hw_enable_no_cleanup()
function that had comments explaining why we left it in an inconsistent
state.

I asked Claude to review it without any context.  Here is the prompt:
"Review qcom_labibb_set_ocp() from drivers/regulator/qcom-labibb-regulator.c
to ensure that error handing and cleanup is correct.  The error handling
ideally should undo all the things that were done so we can fix whatever
caused the breakage and retry.  Ensure that we don't leave the driver in
an usable state."

I haven't looked at Claude's response carefully but it complained about
the same code said that there were simpler ways to write this:

  @@ static int qcom_labibb_setup_ocp_irq(struct labibb_regulator *vreg)
          ret = qcom_labibb_ocp_hw_enable(vreg->rdev);
  -       if (ret)
  -               qcom_labibb_ocp_hw_disable(vreg->rdev);
  +       if (ret) {
  +               if (!vreg->ocp_hw_enabled)
  +                       qcom_labibb_ocp_hw_disable(vreg->rdev);
  +               return ret;
  +       }
  +       vreg->ocp_hw_enabled = true;
 
  -       return ret;
  +       return 0;
   }

  A simpler alternative: return early from qcom_labibb_setup_ocp_irq()
  when ocp_irq_done is already true and the source is known to be on.
  Re-applying the constraints then never touches a working setup.

regards,
dan carpenter
