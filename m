Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702051D619D;
	Fri,  2 May 2025 08:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175883; cv=none; b=P9q1AoeMNDnelJgePEEjraj5GAsJhvkGqUyLDJxe0Za317nseqmNclY7Aib0l41pt9qeWn4B2zy3mMjL8hlvFABCcZihFA67N3rgtIzApMhPw7lAUJw1vs8ruGyH8Gem7LX2hVWaDfFRxrbSbGzarMyQv5Co9fJwrGIpBjNGoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175883; c=relaxed/simple;
	bh=Qe3y1DpcCr9lM3IW6ZeGCY4aLrHoW1qoOdV0m49rd3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKvpBqSswxf/YJqPcdiIh3hZyKFR2C8i7APJ8wZ35p0/Fz+3WBrSxPpbRHFpdeHPGeOnLPXORkQG6tntaaog1ErTBE6sNQ9TsAHE8hPYbsYxnCMLVzSS8ekwsAP1FXkMhC9bho0yReae8RpA4+Wfks2v5Vj7geF1fuT71jf3U2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnxeBQLk; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnxeBQLk"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abec8b750ebso264364066b.0;
        Fri, 02 May 2025 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746175880; x=1746780680; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6vOBVl+qrLbK9/YA8UOeR6dgX64WQKM2qpgOaxUY/Q=;
        b=RnxeBQLkMaNKqr8DFegK2v1RiOPOfTBvDH39MTDcfbFTe34CVfJKlCjR6yTa5Yq4T5
         3BDJClayI3FA7VbFc92q8fS6CW05DtPTqQ0wONMWMkFrl5HUnrRWjQ62rK1A/X+qZo0N
         CAhEqfMAnti4iZMPJ4FoOiFRXANpXfTgdCgBL1qkOzL/mX7Cx55Plvl+VoNdMDCL2Q1l
         Tu8h0oCvjz2nXZvwF3/1mop/5J4aaI3mtGYoKajbbFrA3BIjH/Q6fxBbRl4aE4FcRGjH
         qwlRLbLjLo2J2053j8/4/MFuUa0GZVONOXse326k13elZpz2BfA7hr0V6QgsESeMF6su
         gxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175880; x=1746780680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6vOBVl+qrLbK9/YA8UOeR6dgX64WQKM2qpgOaxUY/Q=;
        b=KFCZUDOTmGDkUdwNuLTnBKXPSh7J9xogPXpGwuOxAq57LoGg2NbmEiT8o2Ol8Ck/SN
         IPbx7GKvCALq4dKGw1dBj8er9fbBLEir2/Q6WbprSHIXVnt5Wu5vh6yRHHtMjFx5prsr
         JPUL7Qv8bBgkmYuCW3crKP2x6HM3GfKWtV24cSVjAGdCi0NdpKpsVk3cui5HSaFj3Uyz
         CO5n+79IaJotrWNwKVS2fyAl3bo5c9M3rf8NXlgA3A5lWVyNJeq9QGJi9tP1cJJuRXB9
         Myp6+v1Fsk1vSObbLfXQ5YgavKzeRbfzVA8yhh4zQiaGg0PWlcLGQYV1ysefFqAO8csQ
         exyg==
X-Forwarded-Encrypted: i=1; AJvYcCUAzM5r266eLFKzT0JZV+JVNOSJkE8Q6t++8115/mLcJR8ruDzitudL2dXQUKVowhRQl7TtYzzG/1Ttly+M@lists.linux.dev, AJvYcCWBePgCIL3qOBitxoPYDy2L9oBRM8oS2fuMsVRN+jMtPjSneGGLPUZWwu/l6XRl+ollNfQ0WwBMPhm6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg916/PuH7HbC3xf+Z76EJrBJ2ZSAU05BirSx3gw8CDGhE+uCf
	m3EiyCfCs/eKhCifgVEQ1qKxygK7edohDGy+5lnhgc7jxRPI6/pJyMKF/w==
X-Gm-Gg: ASbGncsT5fy/YaZN2UM0UQiH9tA5MYzi1GHysYOPSYYqPlLb3OrwM4DudAtYJgHV13U
	+GZMTS9GMqRl2XX3GIlwPV2gU4Mb4YOXUoloVJ3x1R4hnUG/JJhluvoK1yg2L5TkqIXLqg0/NgH
	NT7brW+EEbx/HukON4q0cNKBNMg8hcc3GIH0OGu0+PgxBz0IIuXpMO0tYurIgviKw4RgvP1xlJU
	JFuGQBQRsagdUOMfixq8Cq63dxm9ABjdvIHOcmAHsjF1RWi/GgtRMTh/0OTGJMJJu+GtfVn3mXY
	NqILHDEEdWQORicUSw0zwJPhzUdPxZYgAxCbtQPM5qXIYd5S0kxIJgq1G7abnOO7
X-Google-Smtp-Source: AGHT+IF8PvMfnMyouruHME8LsKvrQBJ44B8NEmFYIAr6RkmCc1t0DpA5Usj6H8hUxcT68T6TdcA/pw==
X-Received: by 2002:a17:907:803:b0:ac7:66fb:6a07 with SMTP id a640c23a62f3a-ad17ad1aca4mr210932466b.6.1746175879399;
        Fri, 02 May 2025 01:51:19 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::1fc? ([2620:10d:c092:600::1:80f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a7467sm17676566b.67.2025.05.02.01.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 01:51:18 -0700 (PDT)
Message-ID: <001dd55e-6859-409e-afc5-d37c4ea5a77f@gmail.com>
Date: Fri, 2 May 2025 09:52:25 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [isilence:tx-tstamp 5/8] io_uring/poll.c:713
 io_arm_poll_handler() warn: if statement not indented
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <202505021022.SUf8vLiH-lkp@intel.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <202505021022.SUf8vLiH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/2/25 08:19, Dan Carpenter wrote:
> tree:   https://github.com/isilence/linux tx-tstamp
> head:   6f5b01cc66b200d99c494caaa62f429268923263
> commit: 275ff22a8d4d1524bbf3b6514af8ab291d682a6b [5/8] io_uring/poll: introduce io_arm_apoll()
> config: x86_64-randconfig-161-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021022.SUf8vLiH-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
...
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27  709  	if (def->pollin) {
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27  710  		mask |= EPOLLIN | EPOLLRDNORM;
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27  711
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27  712  		/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27 @713  		if (req->flags & REQ_F_CLEAR_POLLIN)
> 275ff22a8d4d15 Pavel Begunkov 2025-04-27  714  		mask &= ~EPOLLIN;
> 
> Missing tab.

Thanks, I'll take a look

-- 
Pavel Begunkov

