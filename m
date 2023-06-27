Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8498470;
	Tue, 27 Jun 2023 10:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42676C433C0;
	Tue, 27 Jun 2023 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687862131;
	bh=9c/+tPutaLNwx5Oepfwnq53GOwpU1knOOjFuPJC1uC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ibIScON+eyvCHjpE8h/cPMWFyNG7nD9EPCiU9JAtnRZm/+pWDP7Ffk/BAFDg3jB0k
	 PuJouMaG9u+C/5gqM1DNo5Wy5sZz85Or8Yp4s0wntAcv7Z2Wbpyk4+E47/w+lpleUj
	 kSBSLKvRCHApQkUZg7yGK4yF+8UhDwdZVA9M3Hpgt6usAzH9xJu+hOfQEit3nfVud/
	 c4UOBc0gclW8wGwZwDblrIjj1Xh2VgRlRBuOY6BA8KqQ8NpIPFd1XEtzBreS+iARpX
	 ouySzCiYp29UDcuD4F433ebVtoWmrdFLm20DB3rW8TJ2YmkmgpxJUNY6ZPBaVr3BI4
	 NgfpgUg4J4vag==
Message-ID: <e54c7b49-6d61-9de4-3cc5-4915fc800247@kernel.org>
Date: Tue, 27 Jun 2023 12:35:24 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 22/24] Input: bcm-keypad - Simplify with
 dev_err_probe()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
 <d5e3a542-3456-293e-8ea8-112eb8cff7cd@kernel.org>
 <8d3ff4b2-8f43-428a-9cb1-9f939f64636b@kadam.mountain>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <8d3ff4b2-8f43-428a-9cb1-9f939f64636b@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/06/2023 12:01, Dan Carpenter wrote:
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> | Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/
>>
>> Thanks. I run smatch on the patchset before sending and did not point it
>> out. Nothing also after pulling latest master. I guess you run some
>> unreleased version?
> 
> No, this is the kbuild bot.  It's using released code.  I tested it on
> my system as well and it should work...  That warning is newish though
> so maybe you're not using the latest Smatch?
> 
> $ ~/progs/smatch/release/smatch_scripts/kchecker drivers/input/keyboard/bcm-keypad.c
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      drivers/input/keyboard/bcm-keypad.o
>   CHECK   drivers/input/keyboard/bcm-keypad.c
> drivers/input/keyboard/bcm-keypad.c:370 bcm_kp_probe() warn: passing zero to 'dev_err_probe'

It was latest from master:
$ ~/dev/3rdparty/smatch/smatch --version
v0.5.0-8393-gde59d476b2df

I now double checked on x86_64 (previous was cross-compile for arm64 but
it should not matter):

$ x8664_cc make C=1 CHECK="~/dev/3rdparty/smatch/smatch" -j8  drivers/input/keyboard/
make[1]: Entering directory '/home/krzk/dev/linux/linux/out'
  GEN     Makefile
  DESCEND objtool
  INSTALL libsubcmd_headers
  CALL    ../scripts/checksyscalls.sh
  CC      drivers/input/keyboard/bcm-keypad.o
  CHECK   ../drivers/input/keyboard/bcm-keypad.c
  AR      drivers/input/keyboard/built-in.a
make[1]: Leaving directory '/home/krzk/dev/linux/linux/out'

Does the C=1/CHECK method differs from kchecker?

Best regards,
Krzysztof

