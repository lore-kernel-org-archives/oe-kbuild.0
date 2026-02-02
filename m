Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48F1FDA92
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Feb 2026 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769997997; cv=pass; b=g0KrBGibW8y9DzymzxD+mbyWyAvFrwjIERKox8KUXXo9F/rwMWel8q3V5vNUWz1uLsvZV7RL5Ybv+ZmkDnXfX+bt9bRY6yPmL1EP7zrPEubMw9UM1hJB6K0t+4g/eLmPOGogva6l5ZLuMpfUxGTjp6+gYcc6gMwFJTpHsG8XDas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769997997; c=relaxed/simple;
	bh=cZHOuyFSDD0YCiUahnVWqH20bORv4bma4nfHULxUbNM=;
	h=Mime-Version:From:References:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fID/Qd7TIuFMnPKazjzZOmK0XKIBQNF+ZsHpCEeKxUMGki3oAc0MoTmXN7sxqkxzvYJhRVpifcnlvZJZy/LrNKVWp1iS2Fi3NXzECCuwQTtdOw6G+kTGAMcC/VujVilpvC4x/fhJEYL9BPjsmJ5JyCQt2mjFjTs5LyfU6kdvV7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=bgHyg5iP; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="bgHyg5iP"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-794d58b892cso3948657b3.2
        for <oe-kbuild@lists.linux.dev>; Sun, 01 Feb 2026 18:06:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769997995; cv=none;
        d=google.com; s=arc-20240605;
        b=fJkyPdlFJRewsbL8yCF5jcYE+I+17KoS5K3XVL50FX2CVVCku87FBoz0iRAlCcvcIk
         /vF/enXcWxZX3gi9iqIv1wO1+3J7TNuW8ZnbxrOnZ34f/7jL/38cS8ARxEOUixSPj4nu
         mygMFySdFU06TFQrtFIKGYZo6JS/H356FiPs0jFwMF8lb1ndr+qI44yUvblneHOihVps
         D0PgYFjYlxlHXWdawQVvJKOn0Ai0VAZ49NuqUC0CR1wgZOOzfn93vXaps/E70NuXehIH
         R6DSb8rXgWPbhxboJeIOyxFVRp2aUWEtZFWTD2ReILfKs2v8E/pxzuslNePvCOk/FKSy
         /MeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:dkim-signature;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        fh=sjLV5qE6VCYcM4aWZr5zXd5UCCsxWuKPnztwr4znrLo=;
        b=DgPWN3c4lLzlKhwzkUOt5tUjeobH9pcQ8jhmeefen2zcVJjvDWCpVaNgBGXl1S3KUb
         pv1wNP5jysYEmaXD0IXBYu8BqVNPhsZhiR/LIQt02TshOOGipCwPDNPMCq6lOG26iybU
         Symb2xC7V7Gf/rIpcUVes4cxEEnnDehFpOGuX0tRpxsQbjw7RcFJxR3wM/SFG6ypPGWv
         HJc2aEXFfhMJqFNdK5OjlXW7Yewce1vzuXe4wx+kcuzempnZYul/7FcDzBUXiatLo02n
         OECaAQQhLhtj6RbJwqXIth4ofRGXomz6Lti5iMax6qe8Dz0JDSnn5VsBV0tn7XOI9rox
         +6tA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769997995; x=1770602795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=bgHyg5iPxcHz6bEaeXaLbSk/iPXuI5jm9GEaNtdeX9sZPllwAFjazferJbx/IgDP4s
         /VM0yj3z4RpPZ4iFgR0BxVTqBvMO1krDMBA9OCJDeXkMcNxerd8NNyZbz7vWfXAa4l/d
         F8eBjgQcehSxrJcBbwkRGBoG2nMmi0M04wY/EceUrO/nl2e4B84rswSK48XQvV4P0W2R
         imG5hqd93dDhUlfVDjNDWC0GFcd1uAo0kUyv6CVu03bjVGlk8S2IlTP5eDCXP7FNq/7p
         E5VnWQ2BGeodJiniBeNlWd+B7Cyw6AaTce+OO7jAxzFL9Up3dm8l7K0hLSXQiwceuyoC
         gXgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769997995; x=1770602795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMiZMMtcuEUphHiFBhOZs43qw2Jy4XV2UcTsb9dz3D0=;
        b=Pcz+u2HFIcQWZK4FMEB0MLpDMC5Wvf/mwq5m1Pb94MqyI7myDP4u6jwNAfJjChTLdq
         FqjE7aVRCD0nhIeI6S5MiMILCtWiz7bGtdaAZh4IXhWKWlR1sloJPuFAg6uxZA19S6lW
         1v7XivJsARfZmiYZLp12uhTZwIe9mwWCavEtOYHBoVRJH8/DtbbpQJgFL171AHvxVDPn
         V7YzYMyTUnZqkbwJhCEOQTtpjU4u9WpwBl8fQCailt2s4d68ZcBlqxagwA9uOdcFyDJl
         q2FYkAZxYFbu4+okIHzfI5G4cSttbucf4ZOjzK5pEPVba688gSYUs/B/uZatjYZ3Z1x+
         A/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWp/lUChg4SORr+kY1eKjBWddAQ5je43TAhNM4tfQvuT6qANruENfLUuA9ACeZ9KhWolaDe7hqlDbE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSImMRDmgpLSAUvDw15/hDepEsHaKpn1F8JlV2S2jVG7/YWM8x
	i2qeJs3SeLI4Q2a+Zo7rowFERqwjFwgCMGPL54Q3Xq8m7cMMOZG4xFkhY3gDavyVoiPutHgTs7b
	1sKZsPtiQsbNMH8/EL1Dflf86gn9NH1EfBi5X2yWk+A==
X-Gm-Gg: AZuq6aJ+kCGJqtpQ1/bUgk5D0TDqOWrWAU60Nl/QhpVMYet9iz7LyBLIxJj8N9woxqS
	HlX+h8XpJobYH0ecxrdjdmgSTyTWWRIKFj2XP1JLqZkG/Gga+rVZsLzACL0wwRmPIZm6Vu/kVWf
	85zY3NQuABQlhqDN3w1qEJv1zQtWCGnCZIXmF4tDUq6JvU3GPMoWxheu/h06+/e8mfj3rWZWjuP
	LE+NUCKqJXNFFVheN33s8RJlhuTo/d/87yXFtdLJakHZqaWhzLY100dIdzM4/Z0cbLj6PQw
X-Received: by 2002:a05:690c:e3e1:b0:794:198e:943b with SMTP id
 00721157ae682-7949de7f6bfmr88706007b3.8.1769997994805; Sun, 01 Feb 2026
 18:06:34 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Feb 2026 02:06:34 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <202601311615.10yziOui-lkp@intel.com> <81522270-1703-48E1-B64C-8CF174E1EF94@nexthop.ai>
 <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
In-Reply-To: <r2qkeep6jf7xxjzckn72z4avgx3qiqh4g2fkvzeyu2p2o54bff@xs4kzlong7cn>
Date: Mon, 2 Feb 2026 02:06:34 +0000
X-Gm-Features: AZwV_QgA40VM4P6w_-3GskOG6YPGtVtQKONh5VU7M0VmOxyGKRkaTPHiN25oam0
Message-ID: <CAGYn4vxTAJwO3GiKmRtD1gTit-Wm4VOMnxZPxUfUJ0JEwj8dEw@mail.gmail.com>
Subject: Re: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun Feb 1, 2026 at 10:23 PM UTC, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Sat, Jan 31, 2026 at 06:14:58PM -0800, Abdurrahman Hussain wrote:
>> > On Jan 31, 2026, at 6:35=E2=80=AFAM, Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
>> > kernel test robot noticed the following build warnings:
>> >
>> > url:    https://github.com/intel-lab-lkp/linux/commits/Abdurrahman-Hus=
sain-via-B4-Relay/i2c-xiic-skip-input-clock-setup-on-non-OF-systems/2026013=
0-054653
>> > base:   63804fed149a6750ffd28610c5c1c98cce6bd377
>> > patch link:    https://lore.kernel.org/r/20260129-i2c-xiic-v7-5-727e43=
4897ef%40nexthop.ai
>> > patch subject: [PATCH v7 5/6] i2c: xiic: cosmetic cleanup
>> > config: i386-randconfig-141-20260130 (https://download.01.org/0day-ci/=
archive/20260131/202601311615.10yziOui-lkp@intel.com/config)
>> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 8=
7f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> > smatch version: v0.5.0-8994-gd50c5a4c
>> >
>> > If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>> > the same patch/commit), kindly add following tags
>> > | Reported-by: kernel test robot <lkp@intel.com>
>> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > | Closes: https://lore.kernel.org/r/202601311615.10yziOui-lkp@intel.co=
m/
>> >
>> > smatch warnings:
>> > drivers/i2c/busses/i2c-xiic.c:1539 xiic_i2c_remove() warn: pm_runtime_=
get_sync() also returns 1 on success
>> >
>> > vim +1539 drivers/i2c/busses/i2c-xiic.c
>> >
>> > e190a0c389e601 Uwe Kleine-K=C3=B6nig    2023-05-08  1529  static void =
xiic_i2c_remove(struct platform_device *pdev)
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1530  {
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1531   struct device *d=
ev =3D &pdev->dev;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1532   struct xiic=
_i2c *i2c =3D platform_get_drvdata(pdev);
>> > 36ecbcab84d023 Shubhrajyoti Datta  2016-03-02  1533   int ret;
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1534
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1535   /* remove a=
dapter & data */
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1536   i2c_del_ada=
pter(&i2c->adap);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1537
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1538   ret =3D pm_runti=
me_get_sync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29 @1539   if (ret)
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1540   dev_warn(dev, "F=
ailed to activate device for removal (%pe)\n",
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1541   ERR_PTR(ret=
));
>> >
>> >
>> > pm_runtime_get_sync() can return 1 on success.  Perhaps use
>> > pm_runtime_resume_and_get()?
>> >
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1542   else
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1543   xiic_deinit=
(i2c);
>> > 810199f7315604 Uwe Kleine-K=C3=B6nig    2022-10-19  1544
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1545   pm_runtime_put_s=
ync(dev);
>> > 2557b4ba04df79 Abdurrahman Hussain 2026-01-29  1546   pm_runtime_dont_=
use_autosuspend(dev);
>> > e1d5b6598cdc33 Richard R=C3=B6jfors     2010-02-11  1547  }
>> >
>> > --
>> > 0-DAY CI Kernel Test Service
>> > https://github.com/intel/lkp-tests/wiki
>> >
>>
>> This maybe a false positive.
>
> It's not.
>
> The blamed commit 2557b4ba04df ("i2c: xiic: cosmetic cleanup") has:
>
> -       ret =3D pm_runtime_get_sync(i2c->dev);
> -
> -       if (ret < 0)
> -               dev_warn(&pdev->dev, "Failed to activate device for remov=
al (%pe)\n",
> +       ret =3D pm_runtime_get_sync(dev);
> +       if (ret)
> +               dev_warn(dev, "Failed to activate device for removal (%pe=
)\n",
>                          ERR_PTR(ret));
>
> So we need
>
> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.=
c
> index 37a15065db60..a5334b7c46d8 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1536,7 +1536,7 @@ static void xiic_i2c_remove(struct platform_device =
*pdev)
>  	i2c_del_adapter(&i2c->adap);
>
>  	ret =3D pm_runtime_get_sync(dev);
> -	if (ret)
> +	if (ret < 0)
>  		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
>  			 ERR_PTR(ret));
>  	else
>
> Best regards
> Uwe

Hi Uwe,

Yes, indeed, I missed that. Thanks for pointing it out!

Best regards,
Abdurrahman
