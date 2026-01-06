Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5A930AACF;
	Tue,  6 Jan 2026 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767689812; cv=none; b=GlBdAsi366rzUdLZbirt4uMywoGmTMJ18myy+gZEgnESwiIPo0/JcVIdUcclU0vrhWqTzSEgiOTelRa6nC+3R78WpZkYlT4LoY3dE+auqnkelb7W1CJ58+d/EBRBHEUpPxYfeBKTeomM5gtZiwHhEJ7gWG9XOkSpk8sOMsxSZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767689812; c=relaxed/simple;
	bh=r4QldG6+HAH6x0Mpm5H/n1xC5UaWqga9jaikvnBEpw0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pZ/uQ0cnd3Q7jzU0I2eENpxAPQEAz4ndxwaRZwCtjtwZEPQX62m5c92y5/xKiKzlhCk5fquux7Q/qyqdzsAoMb4cSz3rcTsOmKKBRaUnTWGPRkUxElm9rGwoU1uFv9hWSY38HlQrSX7rgkFjBJIj1u7+yu2Br3DP+cJQCP57Ypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=taxJxW8A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="taxJxW8A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3485C116C6;
	Tue,  6 Jan 2026 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767689810;
	bh=r4QldG6+HAH6x0Mpm5H/n1xC5UaWqga9jaikvnBEpw0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=taxJxW8AqAtp8izkyrs1lZjIiZrVpzGiNhQtCg78qwa3x/KNRoyxqhCV8terbjD5D
	 ohaHRq+NP8FWch9h+DSBgNMsIPHUQoj7WC7q1OBaH5qwmgPzmW3S3lzJAycIYsdfAT
	 4lA7zdflyVeXfWmKC+sGWljxUKskFjhp+eMRxA3h0UtVF56RQHlFAObjN6uiW6xcsz
	 IbAA4gfbD+gz9glaZ/O9rG1iTw4P1e8BxgdHl+FJv2AA7EpfYmo2i4O/sEUX2HbBh+
	 pl8nQLh2c4iegcOnH9PIQ0ogh1MFkqt3qccoyf4Vso/7L0O+SWzMEKBEW2YLUhYwkE
	 zo5VL92OOi8VA==
Message-ID: <1d351a3e-3676-4de9-ac07-f0fb40c9ed9a@kernel.org>
Date: Tue, 6 Jan 2026 16:56:55 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [chao:feature/lock_trace 1/12] fs/f2fs/checkpoint.c:80
 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
References: <202512292145.pYzliixm-lkp@intel.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <202512292145.pYzliixm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/2026 7:59 PM, Dan Carpenter wrote:
> New smatch warnings:
> fs/f2fs/checkpoint.c:80 trace_lock_elapsed_time_end() error: uninitialized symbol 'running_time'.

It should has been fixed in last version, thanks for the report anyway.

Thanks,
