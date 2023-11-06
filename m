Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AD11F95A;
	Mon,  6 Nov 2023 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfQdQ2Pu"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40790b0a224so34743615e9.0;
        Mon, 06 Nov 2023 07:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699283772; x=1699888572; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3v3nCG3TlJu5hJkh/EcwD9eIuQG7bBphrhJ6+6K0+LU=;
        b=RfQdQ2PuH/JHbGvOiFhFQYMbHhPedxCRm2KwOjPPa7H307lZxuSt37iUrrJY4ruAOh
         J5qY32UIlg07Ua8acXzg3UiDx2D8mVrtT+0CHw/38BZo5QKvHidaJTXdu6WmDAyakUlT
         N/eclfyZzEPzCznWJIFLTo7D+LBBv8eBBTwn/FxvInto/3ZJaewwnKgNnGk3FTE2Y+hr
         yYn0tXjgcxMcmr75zn/W8aNq1u6DNUqODbhYtutdx2qZ7P8F39CGSPtYmB/ayIRmICbm
         QP8fpgmT/IL5Cwbzu3SMIl63XVAd59twE4RlE4tNDYc6CdibYKJq3I0Pz7anXV2abF1t
         pGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283772; x=1699888572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3v3nCG3TlJu5hJkh/EcwD9eIuQG7bBphrhJ6+6K0+LU=;
        b=HC0sxag5RB1srg/fz5rU0W5ppwV3hH84ul6hW6gIgEsWLxMeyhW/bY3wxeB2N2c+g5
         DOis4niDXY5X4YBofkFY7RNR7pBU0hyvxVJ+oVDhqplRy9eYa3B96mO68xQG0GhysCkK
         FgcqJ67akmO1hqeoiD3CIVYRxgCkaMCAlkqr4CDtBzYtqbFbckFr0aBdeb9Jbt+4uEfd
         317uqWCOFcz1oAq+g/YPWSSlx2T73GQy5rWs/dlvTgV7y/HxtpJyD9bHNct3QMpEHJjw
         IC0H1Ox+0bjepBcUiIGlh93iFfEAVbVyA7mXlwTUQN+D+L1AdCRfgFvEMZSTNx2czQHO
         k7Sw==
X-Gm-Message-State: AOJu0YxawG+9PfogXAHO/3NA26S9znsbkygUqfgWP67mflpcKaPb3Qdn
	fWQ7jxneasQQutikgbSxsYs=
X-Google-Smtp-Source: AGHT+IEqXBr/fsfrXexxWha/Icxv2t4d1e39DSTutU3sK2NePYGtnET5E7xVnOVFsm5AQTqYZz1vag==
X-Received: by 2002:a05:600c:1394:b0:409:7aa9:a8fd with SMTP id u20-20020a05600c139400b004097aa9a8fdmr4928544wmf.22.1699283771396;
        Mon, 06 Nov 2023 07:16:11 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b00407b93d8085sm12688608wmq.27.2023.11.06.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 07:16:10 -0800 (PST)
Message-ID: <8371368263aea64bc0f635f723cb6ca9d0176dea.camel@gmail.com>
Subject: Re: [alobakin:pfcp 5/20] drivers/iio/imu/adis16475.c:363
 adis16475_set_freq() warn: set_bit() takes a bit number
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>, Nuno Sa
	 <nuno.sa@analog.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
	lkp@intel.com, oe-kbuild-all@lists.linux.dev, Przemek Kitszel
	 <przemyslaw.kitszel@intel.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 06 Nov 2023 16:16:09 +0100
In-Reply-To: <41eff9b4-3041-4a1e-ba28-b16d866cd894@intel.com>
References: <ff4ef031-774e-4e4d-a009-31f242bf6aee@kadam.mountain>
	 <5b0f8705-71cb-4c4c-a70c-d9d3a15886cb@intel.com>
	 <f040255ef1b3be87050b8255c947b4b375e75a02.camel@gmail.com>
	 <bf2b6899-fad0-4ac7-a906-e8d361e5a46d@intel.com>
	 <e29dc510c78205d87b573e0fe185dc7c7d509310.camel@gmail.com>
	 <41eff9b4-3041-4a1e-ba28-b16d866cd894@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-11-06 at 14:39 +0100, Alexander Lobakin wrote:
> From: Nuno S=C3=A1 <noname.nuno@gmail.com>
> Date: Mon, 06 Nov 2023 13:02:58 +0100
>=20
> > On Mon, 2023-11-06 at 12:18 +0100, Alexander Lobakin wrote:
> > > From: Nuno S=C3=A1 <noname.nuno@gmail.com>
> > > Date: Mon, 06 Nov 2023 11:07:16 +0100
>=20
> [...]
>=20
> > > assign_bit() does not take a bitmask as a first argument, but a bit n=
umber.
> > >=20
> > > I.e. if you want to switch BIT(0), you call it like assign_bit(0, ...=
),
> > > not assign_bit(BIT(0), ...). Same for the bit nr 1.
> > >=20
> >=20
> > Yes, I know... if you look at my reply to Dan you can see I realized th=
at already
> > :)=20
>=20
> Oh okay :)
>=20
> >=20
> > I guess by the time I first sent this time I didn't knew or maybe just =
a dumb
> > mistake...
> >=20
> > I'll send a patch later today removing the BIT() from the #define, thx!
>=20
> Nice! Don't forget the tags the build bot asked for :p
>=20

Just sent it... Hopefully no tags were forgotten! I was not sure about the =
Fixes tag
but added it anyways as this is indeed fixing something (even though the bu=
g was
never triggered).

- Nuno S=C3=A1

