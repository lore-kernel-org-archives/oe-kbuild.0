Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B5C28E7;
	Tue, 29 Oct 2024 01:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730166271; cv=none; b=fVxXl8HZ6fsEt7rGbq63ioAntIMvin6wQHoi4rN7K77cB6SgXT/LxTeO3H40YoQHaQJm3IlGkeRElUNeikCivBAgpXrgn//Xc4p80shnNuqycHnFzU4Hx2+EEkMOu/whXJinBvTPTBMJn19XXNi4tHnH3/2IcNnovEldlOfUdtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730166271; c=relaxed/simple;
	bh=sm2oEhUFL3iw5LnlMa5XaknGmcIxTgmhr3GSHcfx9p0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmNg8T0xFd+0WlH0uUXO73Ic6pm8aHoDv6UCCx5sZHvpYNyT+KkcZCYOmlOTn/8bj4RgOCxc6Q4ZtHeKM3WnaTGFl0OlpDuMlOWoKdOB9ciZ7nLdI72yuj0MOCejcHHH2u/7643JuxHVvn2Ldz/WDlvE7jQSG/02vr1R3b+GS2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dgv6oafy; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dgv6oafy"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 900708917A;
	Tue, 29 Oct 2024 02:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730166266;
	bh=c2wCYI6kx7mXQrfxEG9DIV8y4RSFqmerKsZblMIbetg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dgv6oafyBS6abKyuvtDfXQKAMzFfi56JMXnrYHF+djSyBUjhbNM1lcKLBhr8lqRWZ
	 +OHt+7QSjMfs4bouPvfC9nzvGiMT6D3oa8MV791fLb9kcaMP/6IVl1ci0bYR1CWsKr
	 YrY/iuwJMHe3G5CE1oEHFnA8T8tWS2hTY0kHVAHSAYAlmMFUey7Q0x5vh8gslYtvnG
	 joCGYuX+vUzcQjkDK6DM1lgljbyG7Y3qzKBkDYiuHCMOBNslVEv9Kr79xHfzpyDV/G
	 UuFIturxO/Bp/o9sCRKdxaHG4VghHS5NHfLI32hEmFkDCLzlMyWFYWXtBbRGnMWdBT
	 CEor29zHOh7iA==
Message-ID: <7fa2bf02-cb65-4e98-aac1-602641628b3e@denx.de>
Date: Tue, 29 Oct 2024 02:17:29 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <668ca5ea-6086-49d4-bffd-15ba1bf11ad3@stanley.mountain>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <668ca5ea-6086-49d4-bffd-15ba1bf11ad3@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/28/24 9:29 AM, Dan Carpenter wrote:
> Hi Marek,

Hi,

> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/hwrng-fix-khwrng-registration/20241025-003448
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20241024163121.246420-1-marex%40denx.de
> patch subject: [PATCH 1/2] [RFC] hwrng: fix khwrng lifecycle
> config: i386-randconfig-141-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271650.hsa6hWLy-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202410271650.hsa6hWLy-lkp@intel.com/
> 
> smatch warnings:
> drivers/char/hw_random/core.c:685 hwrng_modinit() error: double free of 'rng_buffer'
Indeed, one of them should be rng_fillbuf instead of rng_buffer.

Fixed for V2, thank you.
