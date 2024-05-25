Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE51DA2F;
	Sat, 25 May 2024 14:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716645699; cv=none; b=lXZrk+gDxsoFfqJYtgh5lzrE9XkoVD2jkSk15lPGcT5csJ8yHb6s8kgcnQ4EEzmV88J/N0GwvO0DlJGZJFTj5MuQGCV1k/lfcX/93Zji6DCJJqhwethahwezt8EnXU2jM+Zy5JXjr0fPq6/ggkiNJj81Q6B5LY3McsuYkmHMsv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716645699; c=relaxed/simple;
	bh=jz9wkc1FMP4qp1PK1KagkY0E2zB1V5eh7JiuozjXfyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxfkGyOBpMVHNVIXQrumw8Q9tadJ96wwhaKJJqDo4LkzXL4SBCKoye4I32Br5QpCR73kB1MPFI7+xKI1MEfVoEh9suk+r6yel4PohJ6mNe7MlwOP58QMG3ZzHt+3pdYbgckzi6xFK+AmjYmNhrQqbcrl3V/4h8KeX5m9RKtgs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTer4deG; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTer4deG"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-529648cd69dso1923457e87.2;
        Sat, 25 May 2024 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716645696; x=1717250496; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qjIf/Nlt5hfmMgIm9+EKfmLkc5Lr9onDLEUZ7ihTSio=;
        b=OTer4deGqEk4lMqSd5/xul/gsyoiMJNmDQE3lI9SqgH5smWZQ80d1bm3skXrqIhIhh
         DnMmXW28713rj/OyrTYjLgTRv5CH0N5ObbSSWGZUsUQWW+di9hdyHnTyGrnVCCR63NbI
         diEUc+MNVFjCDZcwalzlkZPw9Ff47QhdopRtCZh7o0fS97pkdqHZngk1cX7iL+19CYCW
         g/9IUGkvhmXHCZ36wEB07PQXtdbXQnsjftVQsOwL5E3vYTvxq7Zv+5ihyA7zCnjPyVS+
         hTc7SpZ02so7jtsoYj/P6qLBRjtbOg2gqnf260wtFpb6gFI0mU7N3enONNa8rHx6TY8Z
         8/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716645696; x=1717250496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjIf/Nlt5hfmMgIm9+EKfmLkc5Lr9onDLEUZ7ihTSio=;
        b=KHo64S3Gfft09De8FyvoP+5hUVmCpkW1MrRFPjjoYD1nqxKw3krc3cYHCKZAa0MU/h
         tk+wVPLLYc1u/JTab5eoYbiaE0ElSGo3rnzBzi8TtllEWiUs7Zr8U+GrEzld1euqVsZ/
         CPq30V0KC9geGJoisCjdCVP6wX1tSnzEp36GDSqf1UMDZaXtIYZDoOoEmwronM00ms2w
         DC4sfl4lvSJD4JUE1HrA4LCUrfQPlOC4BLohJ7TWIFeI0/Di+KZZCnoTPSt6KAirnCA/
         fs7FY1yBb/aTH+3AlQ6zZ7TGVkYIL6lWlgF4cFResPpBeQo42T2EQ16qdSkpBZS0TS3M
         95rw==
X-Forwarded-Encrypted: i=1; AJvYcCWY+QI0XTUQufKUitO0WO4x+7AgYN930wn86CEda2dQV1DyDWRt2ngt5SmdDMl0Gg2DoqWvUXCif3fukQh4qeAMueOC5+GnCHiQopv5fw==
X-Gm-Message-State: AOJu0YxcfO7w0TgliMb7ga8L9CwGlry2xq69RS7fWh2Dmeoqij30bbvW
	d3/EcfqxDYqErMRgGWRmC0pzSuIRuexdTVQ6GmJhZFURFvey3XdXx6DKYZa1AxrXv+gX4Y/lNBx
	hzYOevn4RyPVL3nkRAfDRr/nCvdk=
X-Google-Smtp-Source: AGHT+IHy4xNxaHBYuO/6Df4lWzmUbbVJPFJKbyrk49Ry6yefo2WEXYFOcDI9deIszyWdSb6CWPt6cebYXP2Gu8iRLSA=
X-Received: by 2002:a05:6512:1051:b0:529:a66e:5b52 with SMTP id
 2adb3069b0e04-529a66e5bd3mr1852678e87.46.1716645695725; Sat, 25 May 2024
 07:01:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <SN7PR12MB8101EDFA7F91A59761095A28A4E72@SN7PR12MB8101.namprd12.prod.outlook.com>
 <59869d5f-3d97-48a2-8a96-127f7b46c0e8@moroto.mountain>
In-Reply-To: <59869d5f-3d97-48a2-8a96-127f7b46c0e8@moroto.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 25 May 2024 17:00:59 +0300
Message-ID: <CAHp75VcTxXsnKVR5EQYTNhokHeXrOxQPe9gAkWFRr0yZT1KTPA@mail.gmail.com>
Subject: Re: [PATCH] iio:proximity:hx9031as: Add TYHX HX9031AS/HX9023S sensor driver
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Yasin Lee <yasin.lee.x@outlook.com>, jic23@kernel.org, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, lars@metafoo.de, 
	swboyd@chromium.org, nuno.a@analog.com, u.kleine-koenig@pengutronix.de, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	yasin.lee.x@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 3:42=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:


> 5e5a419c9407f6 Yasin Lee 2024-05-10  1110  static ssize_t hx9031as_raw_da=
ta_show(struct file *file, char __user *user_buf, size_t count, loff_t *ppo=
s)
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1111  {
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1112       char buf[BUF_SIZE] =3D {0=
};
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1113       char *p =3D buf;
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1114       int ii =3D 0;
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1115
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1116       hx9031as_sample();
> 5e5a419c9407f6 Yasin Lee 2024-05-10  1117       for (ii =3D 0; ii < HX903=
1AS_CH_NUM; ii++) {
> 5e5a419c9407f6 Yasin Lee 2024-05-10 @1118               p +=3D snprintf(p=
, PAGE_SIZE, "ch[%d]: DIFF=3D%-8d, RAW=3D%-8d, OFFSET=3D%-8d, BL=3D%-8d, LP=
=3D%-8d\n",
>                                                                          =
^^^^^^^^^


> Also use scnprintf() instead of snprintf() unless you need to check the
> results.

This is incorrect advice. You should recommend sysfs_emit() /
sysfs_emit_at() in this kind of case.

--=20
With Best Regards,
Andy Shevchenko
