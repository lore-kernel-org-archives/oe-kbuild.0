Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7643E558F
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142117; cv=pass; b=UBZYIZQjXa0fBlgT/oCQ1SoBjk4LfE+Uf9h/aXGP4iaD+a1HimlilYZ1ST1BjkyF8jeagS81Jj8OdmkOCeK8x761hWdUp+Vu2shDPV24Pvhs+PTKCrbsWPkM1ubGsnIH5dSO1eL0mLuH5GJMestVn9M9OIjPYiTwYHsooPHgXUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142117; c=relaxed/simple;
	bh=4lxt+hA7HPd1zgHzvpqvgnyz9EG1BcZ7MHNBGFtWn3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tugYI3c0zhnxdqMleEkunjo4LH0xRwzqXM2d68tO8kAcSknQ3/p53lPyXFcnS+2gIpEERjGFfbZlrtsq9wVYldO8txmPHep+cZ4VRO6O6AQofGRl4tSgva/PUsNszpGi6EzLrosyJU3f0e/pwv2GdagwUhZkltit7/RtVr7befU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+9p6Lar; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+9p6Lar"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd632f7a4a1so942097a12.3
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 02:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142116; cv=none;
        d=google.com; s=arc-20260327;
        b=M9lQu+yuFRkctLq5EH1hhXM54Z7LcDSGBZaUx5ORSiXmarJoJNbmfjjcyhbOpOpf1A
         yCTAEt/c6wObDTW9Ke/cm3SzkwkUg88jlUJRaaQxM2QRU202C1ZjZiZ6OaO49+Zc57P7
         uNhZgW52ujsjsPFaFCRjz6kuz1fLabwZ8una4ziGgFg1xLePpXhS8+2dygldWOjlme3N
         fQEr2tSfKSeC2uSp8+aLA5PXXnaKxVvvvKqpez8xqS+o2NZEFYgGJoz2DjQOQYopzIvG
         yfojewA1CP7Pmx9Lf2gUygyymPotdxD8gCT/xYc0uaDLFcnB4Xo1/CM8LVnqVqfaAYxx
         jhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        fh=94XS7zfrZLr4k+gOipnUcuH00rPD35p/4sf3npcMMHo=;
        b=oA3qIOTx38jqaSaob2fTuHoS+HwrciMemWSatgGeLbBYlR0PaukubPmlx0usKRXGrz
         MiqQ71IpwxAA5DDqYGjOJGyO5BIh+q8lVst13+LM6JkDmF5QHJKwSZ/rAO6I9w6IqQ5Z
         Nleny6r9A6I3eHDdC3BsAcseN3yhy+MahvbNwMVkZ+6gyqd2m1fBDi5n5sT6gEkO6Yn+
         S9Y3lt3a+0SmSLbuWYQ8FzF67KQfZoWOd3e1DNwJ/SS0QRGJTMXMb6zhSfucCcOzwkyz
         qn31ASf6Nn+/WpBqN4dy/tgS1M2s9NTDdJKtG5cZ78ox7xrJqu+laKimQXRQa9Hev/8Y
         q6GA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142116; x=1792746916; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        b=B+9p6LarJ63wBGW0SF3q58vfxu4149SApmVAmyRfosgrvRZwAnwffC0wjGx+8kE9FC
         6hh1SKZ5bITrM9EhD0LJRleybItS+w4Nd201nTQ7rUoLcxj3CvtDHUC9s1hEFRvIgsdV
         O4vFFcHlvqOsRQUFyvA8PV4N2Bi0ClKYSkzGdyFHhO3sPtp8kjNaAzI7qpQSXwNW96Pv
         f3BU0TDnk3UXlup8Be9cTursyNeVx6h1HDfApE5akDdNPG278mn7AoKtc+P0zwiHkTe8
         r0yugvdJnZzTk1LQxsLYwm0PmJQ81hPY9cRYFCXdgKRSHh+iUXQ52WQEoc7Y41XkLhzK
         30Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142116; x=1792746916;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=phYTTl4PHcJvVRbLzfsV00gncMf9YHBKRHMHM3SJjVA=;
        b=afKZ/7uZLUDM0vCODuH4sNkkBUvktBaeJBb4jDB0y5NnbV7PNFeVqvbg5Mxk8QK9YX
         bmF0lLLHLjQh1Dla1xBJFUhtNFOaCQ7j6qrR6SAVc94YhqOqWG3VAYqxd/XrmUVoXI4I
         yr1RvgCUT0DvQ+2kDYTAjeMEwEEpzCPEcazJc5ZQSqqgZT+H2qTwvseeTqJdF/Bf/pBM
         FNfqH1UCv4CSVEQkSgJCzAUzgLbGkNdJkOmRjqLjZ6jGzKBfwA3vxG5uwq2OvDAlACdm
         qPP96bJKpXJs7B4CPmpeCtd0PmvXVqeeUCHvkx5/yECGYduYC0A+UZc5j7tyR9/DNceW
         eWMw==
X-Gm-Message-State: AFq9FYIUGnM8GzIUrpM3jh4xoxOXk2PdAH+TSD4bpO5aux3UbkHIrnwr
	SFJ4V3TTndnB0M7oHHN/WmelpX+QAI5YvEo/t9jjdnEIdHrfx42inqxNroRJ43Ptz5HEFbjgxh/
	p/q63vvQFyma7eJe7qhO5DIW2g6ePhQk=
X-Gm-Gg: AYBFou2DXmGCun4CRsWKXZEW4ow2BEweRPDIY1hnf834Me6k9oI6HsLojb+pByaSGU0
	vMCzgK+JllNnz+6aJnddec6eGuGAlw+THNV8SlJoE6mUDz5z7QfjXGaAY1fA4mt2vpMZD59LiEy
	/qF9PmJzg97G7ESR48ADvEeU2pbRaty4XVC7Z/cbpRq4ey01JLORMF3RpVnYz97nuXTyS8zhnye
	eB5a6wYSvrkla3aom5NOju4joxMnVJCeYe4dUfo/jjy7beSHc37MuVYRs5P51fUK1qM4Kj04QgF
	0vn3DmPStxBi2C2BzJZdeuFRyfZLShVQouhNBVFXIt9X1yME21UzAexR4abkx58UCulypdTs3mF
	m2XuhU1E1oLQStRyBcGfBjb8zmJnXqEDnxYsQcQ62BiaYDmzwufpEeYSG1R2y4zUTkNw=
X-Received: by 2002:a17:90b:4ac7:b0:3a5:133:ca5f with SMTP id
 98e67ed59e1d1-3ab3af71187mr19329077a91.46.1792142115820; Fri, 16 Oct 2026
 02:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202610152233.eVrGPEyh-lkp@intel.com>
In-Reply-To: <202610152233.eVrGPEyh-lkp@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 16:15:04 +0700
X-Gm-Features: AclHuK9xOpPEoV5IICqolD0ZAyyJiNgo92FzWBvhd8CsN_s17TOQfTH046kzxVA
Message-ID: <CAABR9nGRwfhqrHptqew7=otJch7=JLOghns7Mw0ahB8QcbKhRQ@mail.gmail.com>
Subject: Re: [linux-next:master 5778/17613] sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648
 mt8189_mck_enable() warn: missing unwind goto?
To: Dan Carpenter <error27@gmail.com>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dan,

Thanks for the report.

>
> smatch warnings:
> sound/soc/mediatek/mt8189/mt8189-afe-clk.c:648 mt8189_mck_enable() warn: missing unwind goto?
>
..................
> dc637ffeed6c32 Cyril Chao   2025-10-31  645     /* enable div, set rate */
> dc637ffeed6c32 Cyril Chao   2025-10-31  646     if (div_clk_id < 0) {
> dc637ffeed6c32 Cyril Chao   2025-10-31  647             dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> dc637ffeed6c32 Cyril Chao   2025-10-31 @648             return -EINVAL;

After re-checking the code, the "div_clk_id < 0" branch can't actually
be reached:
mck_id is bounds-checked earlier,  and every entry in mck_div[] has a
valid div_clk_id.

So this looks like dead code.

I could move the check before the "if (m_sel_id >= 0)" block to avoid
the missing
unwind goto warning, but that doesn't seem really necessary.

This dead check could also be removed in a follow-up cleanup.

Best regards,
Phuc
