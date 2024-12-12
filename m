Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C10126BEE;
	Thu, 12 Dec 2024 04:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733978356; cv=none; b=GA7qk+NTEYXyn0dd09VliKgEShIAWZFz89gFG5m8s+mQGQppzOf5hN89IxkBZpjcLVr3PG4ICdPtASUcawW3vyZbz5TUCtLTSWqhVoHlPePs6DKc7FZpFcQTX4kbAMyYRexJn6jqlhOhA6tsCJQxvFvOIjebnhf6tGGhkRP0Tg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733978356; c=relaxed/simple;
	bh=nss5JaMp+JaD36ryepYq/7ZKvmQIDAKaBxMN35EcrIk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RE3kQRDpXX08DzSHvRRHdfhpHhEZYGSXmA3t93PwDlvaHexnJGZGY9k/2atL3UtoC4/rReXDO5IXKva94UqFIaNe0Sqe1DebPYmhzPDi5LEFGrzkQQbIAILf0xGpp4a/XxFj4h3WsKqqjxPMweN/iGavOg3NC4NyovCoi4CDG4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIX0YkVc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIX0YkVc"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2163dc5155fso1364295ad.0;
        Wed, 11 Dec 2024 20:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733978354; x=1734583154; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=euoOkejvzC05isEf8AF+KcO5aHTUbvu/T0nkeSpJLWs=;
        b=jIX0YkVco6TkzxgvV3XxU0namDOYuu+tM0/Uv+dNniVSlHs77+xGldbLEeqJnd9MJ9
         R7oDxoReC2u9EZt9uCI7GoFqAlRRqtJ5Y48I6jYg+OVISUzvUNx0H65mVhEMeHD3HDz8
         NDXonbQO6+SI7rnWEnayEo8dKSzOVfLP/B8vV4oCBHZobWRmY6m6CtFN4OI95BTCxBS8
         FiSj6Krw7xKq3MCf28bdlfB4um1fsxMBhprpvSqWcdoBSbGx/bXBf5nGYTDZN1JQWx+U
         sfkf7T1I0i6tTrX1+bjuzoKWYeeQ2/K2fDOp7xZoyJU2VcV7aPGG0GbnJe1Nh+dRDzbG
         ukBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733978354; x=1734583154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=euoOkejvzC05isEf8AF+KcO5aHTUbvu/T0nkeSpJLWs=;
        b=bRbBrUlzbtb7o7rj7k6Cznp0pn9loVT9SXXsWP7+ERCShN1wdjUwOCZwycQWOzJdsv
         MID8jxwV1YThJ6M+oFGUFaqsSomlt2RPqxbkPrGrvTBF2hMr7zihoNcidGqYBnSLC9b/
         RIyh5QRG1J0sK6+4kz73KBtxpbTguUFlmo4AknOHqWMIvreJYyjDa85w+0GfHaYlNo84
         lOQ5LTfBVLSUrI1QDS/nFdanhC42SSLWaNUi3cHUla4A6MRTtKNavyWfBzQWr+qZVp0Q
         85WXDxxysq6omydmsumRSXE/9KkiaX/NiV+3R/8v1N4+aBaJTU8PZFNmfuPnB06vjC6G
         OsGw==
X-Forwarded-Encrypted: i=1; AJvYcCV8HqwkUkDkLuN8idwQsXwI/DJKeLMpSEl7f7289G3zSlOt4yQltSMWgJlqjUYRmhKmDGdTNK/LYF7s@lists.linux.dev, AJvYcCWlUJvvtffhtzuxLRPBu2oRY9WBCTPrzZoO7wQdysHNB/NKJT8aWQ05dYxw2ltSIcgwGGtqo5sSmh3aJNlg@lists.linux.dev
X-Gm-Message-State: AOJu0Yys+/L2VLEPEPJV7QjZ/jnEuTuZDEi4sZERBb3xe7uiwlIqQlld
	bKiAsF3nSpgZE9inpCOetLc9RE9hD0wgNZ7GOtNeIFDYUg/ZGMRL
X-Gm-Gg: ASbGnct6EizfWl417AaCX2vhD8ldC43r6xYGpC6DvPciZw3W3i5dB4dA5iAMp1ltUut
	8jusF7mberzcMRk1vNW0VJazAXUcc4HCfr9l9fsEsF593htt9qWvCCC2IgPbFEqRdzVuAGZmHaQ
	xKh/KBYGi+tZHMZRiAqKO4Ht0wgJlr/jnjFfmS1OcwYxNB5Varf6Y8AKu8NfcdP8I9hHT/fGFeU
	5shSRZWbhV41fxeU60KGQN44JlZ+0/oLiMAQEOPytALoRTfSE3djg==
X-Google-Smtp-Source: AGHT+IHWxG4p54sXcyb1D1FA9kvdR8NaYo4jsAu0T9OABuOjLtKSkIaC19PQswAxdueWU4kpH+mBEg==
X-Received: by 2002:a17:902:e746:b0:215:b8b6:d2ea with SMTP id d9443c01a7336-217783ab359mr89354455ad.15.1733978353651;
        Wed, 11 Dec 2024 20:39:13 -0800 (PST)
Received: from [192.168.0.235] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162d266d77sm79395475ad.201.2024.12.11.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 20:39:13 -0800 (PST)
Message-ID: <d60f66e78d651e5c6a4120720581f91c4f9a1599.camel@gmail.com>
Subject: Re: [linux-next:master 2974/3192] kernel/bpf/verifier.c:22231
 bpf_check_attach_target() error: we previously assumed 'aux->func' could be
 null (see line 22212)
From: Eduard Zingerman <eddyz87@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, Alexei Starovoitov
	 <ast@kernel.org>
Date: Wed, 11 Dec 2024 20:39:08 -0800
In-Reply-To: <7de4b716-f0de-4cad-8cd9-3d6b0862644b@stanley.mountain>
References: <7de4b716-f0de-4cad-8cd9-3d6b0862644b@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2024-12-11 at 14:19 +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   91e71d606356e50f238d7a87aacdee4abc427f07
> commit: 81f6d0530ba031b5f038a091619bf2ff29568852 [2974/3192] bpf: check c=
hanges_pkt_data property for extension programs
> config: i386-randconfig-141-20241211 (https://download.01.org/0day-ci/arc=
hive/20241211/202412111822.qGw6tOyB-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202412111822.qGw6tOyB-lkp@intel.com/
>=20
> smatch warnings:
> kernel/bpf/verifier.c:22231 bpf_check_attach_target() error: we previousl=
y assumed 'aux->func' could be null (see line 22212)

Hi Dan,

Thank you for reporting this. This is an issue indeed, the null
pointer dereference could be triggered if I try to replace main
sub-program of a program with one sub-program.

Thanks,
Eduard

