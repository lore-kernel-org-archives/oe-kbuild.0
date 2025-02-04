Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6747125A659;
	Tue,  4 Feb 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683107; cv=none; b=ODfGDwCoVyD9tsODPInkkrYSTmUesW+0kGHOJ0vCuhBunccWKlQ7fuu2dytpy9kFO3sGVigKQZlFhhIX1777AVWJqMGQshTRYYrTm6xLH6OaQopAOlF99ZpX9tggNDNltYHWzqCld3LGTmWNk0Mxh0kcUQ3S+ABYTfdx2yvyO4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683107; c=relaxed/simple;
	bh=6LTXlAyjSVcDOt/WE0GtwotYSD6uBDnTNySXFvouTL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3zhVIZXcWb5AM/064FHYaoJLdvpMKvzDePsymMKJTp5xM//Au2KV1NiaFXVo4EeZgYmUr5rchPlZiFTMQkRbR9Vjar5AUs6rRl/mgZCh+E1faAy94mhKiIoRPFFx738X1QNH4nZm4ivm9YIbtjpypZfozm1UgrJtcAl9pWjSEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaLsWbh3; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaLsWbh3"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e4277e4791so3997206d6.0;
        Tue, 04 Feb 2025 07:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738683105; x=1739287905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rLqioGcTpHEUtguRgMSoF5lAUN71V0fqChdDIQ0y4U=;
        b=HaLsWbh3rvSkRmtMvuH/FeOASvaEKleKy639nG4xu6koxXVzx9pMGNNYt8S1pWKrJ4
         mbOFBAMQtFBWpgkFOC1gMpOx592fjQWaEj3BZzHRDrHv2KEc0B7JcswbOGCUK6WUhMw+
         dKo76duikGQAhcebkpa8N15vkK7tKULf2nHH7gnE/4RE2GKZAGzI8440hDc5fyTyAByd
         dE27GoN+xbdC+RR724x1XkpUzCJejB6x4kUmSs2Rq6QC4ghpqeW2WoDWSP9RSikYBTx4
         ZrlGpbLwhSaKCqOlfLgMTrQk2wI5lccBC7+pQyFVk5IAfyKgcizvxo+W4YgszOBIb7Pr
         8VMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683105; x=1739287905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rLqioGcTpHEUtguRgMSoF5lAUN71V0fqChdDIQ0y4U=;
        b=AAM5uhdsEuM2l0nDzDOzRkeFP0I0zcp/vyrf1Bofi2hUTUJHaPHVU0TdMbpavS4S1F
         Yz6GXHrDof6K9+l9k8fRQRtI6XyNlCirvyyXJ3q65snLNgAWjFGfx9YbtDSfcBD6bHPq
         pnseqUTsmcbjgSycR3LVDovkDChQOk3JXPm4md8IK8GApChGNX5eHG8PW66ZL3AgNjCX
         Xn7g0vjWRhk4EKMPTUHaqHwd26n5f8ssdKne7DxvuaE35KgsSEKuq42wkARtSg0jdzZY
         gCSPel5tOQogR98trpDM2gvTeGJcIt3wEZPty9VoABOWRLoW71ov4mebtLwu9knp/7k0
         e+aA==
X-Forwarded-Encrypted: i=1; AJvYcCU5qf4jv50NutBip8E4EAsTRPOw0hHbjrrQYf5e/gTxi81YFq42jYnnc+9dNoS6SxgqqnU4u80obn6zdgEB@lists.linux.dev, AJvYcCX1Il0G2Ok9JYdWWEFhTSMvThowf9VYTJHiau6FeWDODt+wCGiYhtCpB64yJXYXFPEu0IyABqiz0aFC@lists.linux.dev
X-Gm-Message-State: AOJu0YwoAcuAbB1PYkHN1l9H604D4ycpU1olURC2GREWp3xwbxON3EV3
	duy8jgExL/6r7wWuk1VDSv9S108/bF9YuMrmm4fklbsXdwd3V5AD
X-Gm-Gg: ASbGncv0uaNaBsFMyb3TTenm7Afo6DCf3n34kSKo8wt3vXX8E5lbAbAXtIwRHKMDrcv
	hETa1X8QMGf/NjG0CkY/Cm3hAfSh+QtaKbUdntgCgBY/s6k9rZb6SEGwOaNIRnQEV0k+Unq54Py
	b8vtlbWEMc7D6fidHE2AtXPGKV9gYTEqy9VQT9bL5TQdzRi9Q0W00SLh/aqsqDLDW7dieuA6G21
	l5vBfid+XqaVR8WaaOh9o6uVVtsAouFX/uVcCu1hRbFLRbtN7/L/vDaXKQd4HRBDCe9bbQpWTSz
	sEHAexTyuM6OQIvz2bOvYaFRRvpKypxwaEjvEKNMxXaT1qHeQEo=
X-Google-Smtp-Source: AGHT+IHTE3r9hO7VkAo3EnDxfTDhthPBj1GkrNC5WVo7PPbvOZJjWt+GF2ek/8mEUQknHCa9w+XdLA==
X-Received: by 2002:a05:6214:3290:b0:6d8:9d28:ff07 with SMTP id 6a1803df08f44-6e243c7e5a8mr400392116d6.45.1738683105122;
        Tue, 04 Feb 2025 07:31:45 -0800 (PST)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25493ee7asm62861406d6.94.2025.02.04.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:31:44 -0800 (PST)
Date: Tue, 4 Feb 2025 10:31:42 -0500
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
	Pawel Czarnecki <pczarnecki@internships.antmicro.com>,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mateusz Holenko <mholenko@antmicro.com>
Subject: Re: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:81
 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
Message-ID: <Z6Iy3r9wab6IXoIh@glsmbp.wifi.local.cmu.edu>
References: <2d9d0dab-8892-43ae-bac5-213246705e31@stanley.mountain>
 <CAMuHMdVBXH6++4yLuP6GMyNLVztEkZjrpL-mxLT5vgTXSOVx-w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBXH6++4yLuP6GMyNLVztEkZjrpL-mxLT5vgTXSOVx-w@mail.gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett

On Tue, Feb 04, 2025 at 03:49:44PM +0100, Geert Uytterhoeven wrote:
> > b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  72          for (i = 0; i <= CLKOUT_MAX; i++) {
> >
> > Presumably this should be < CLKOUT_MAX instead of <=.
> 
> Indeed.
> 
> And in litex_clk_read_clkout_dts(), we have the inverse bug:
> 
>         if (dt_num > CLKOUT_MAX) {
>                    ^^
> should be >=
> 
>                 pr_err("%s: Invalid CLKOUT index!", child->name);
>                 return -EINVAL;
>         }

Fixed, rebased, force-pushed.

Thanks much,
--Gabriel
