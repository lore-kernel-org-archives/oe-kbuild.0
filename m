Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CB11B808;
	Thu, 22 Jan 2026 10:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769077853; cv=none; b=Yd6bK7RsUQ5R4AuAt+1gygJMkyczzcz+xfwnlr/+OR+xStx5eCYLjOsAj3hXxxbHWIfZQlnV0tYRHtLSKsJwG5gICho6j3Zc3vnU+k5akfAwy3u0DqMdWWKbbZYYdss9SnsjWYjzvh4Hq0+vjPZtWhfA7dLPs1uy2BcoKCt4cHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769077853; c=relaxed/simple;
	bh=oob4836ApX1NmCp6W5wN39YQoJSroAdcAzkzIA4BG4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NXeXU/Tb1yQ5BdKnsmnPXvafptSxhfajAs2eQUlLaGS+ogehI29/QMWZgj23YS/rax8lOge5uo4l6q/IUlRMNuZursjlWBnJEhF83WQDxUAqlwGTvrclht6Ycrirc8k2AxWDSUmfiqABPDuo6yHr46hhUYQCEuEzrxIIDBYRo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEPPxBuZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEPPxBuZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365EBC19423;
	Thu, 22 Jan 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769077852;
	bh=oob4836ApX1NmCp6W5wN39YQoJSroAdcAzkzIA4BG4I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IEPPxBuZeQAaoWrm0Q/0yacJ6g8aW1SaVBpZxnVfWGy+98v4PpmapYdHzAUnOPgb/
	 9A1htMHuYPV1C47RCzZ5adWPCVUaNSmY3Dq26rpXwBiBP4KkmTg3mE5ocLIJJKeV8c
	 ccUksZFyagWuncViM/Edd04a7N2s7a33xzRZTVSUOX/ovxbsMMjaSDIiEyRCjN+/pA
	 xEH0yu19hHsYXNuDX9zModUUvano+eQfwho4D9p51O0iwKavo5DFq9ip8BZBies1t8
	 Y6zAdUcX0Pc9r3Gqu3+mYqEvOlTMA6s7H2VIOWmWN4gQeANNFqJPLCqgyynoFVU5n7
	 jNxA3pGCMQITA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,  oe-kbuild@lists.linux.dev,
  Pasha Tatashin <pasha.tatashin@soleen.com>,  lkp@intel.com,
  oe-kbuild-all@lists.linux.dev,  linux-kernel@vger.kernel.org,  Linux
 Memory Management List <linux-mm@kvack.org>,  Jason Gunthorpe
 <jgg@nvidia.com>,  "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: Re: kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc()
 warn: missing error code 'err'
In-Reply-To: <20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
	(Andrew Morton's message of "Wed, 21 Jan 2026 12:39:22 -0800")
References: <202601211636.IRaejjdw-lkp@intel.com>
	<20260121123922.c0bb0ef8505c70b99998c324@linux-foundation.org>
Date: Thu, 22 Jan 2026 10:30:49 +0000
Message-ID: <2vxzh5seaqhy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 21 2026, Andrew Morton wrote:

> On Wed, 21 Jan 2026 11:58:20 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
>> Hi Pasha,
>> 
>> First bad commit (maybe != root cause):
>> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   6c790212c588fddeb0d852f2790840753bb604b1
>> commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
>> config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
>> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
>> smatch version: v0.5.0-8985-g2614ff1a
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> | Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/
>> 
>> smatch warnings:
>> kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'
>
> Indeed, thanks.
>
>
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: kho: kho_preserve_vmalloc(): don't return 0 when ENOMEM
> Date: Wed Jan 21 12:36:17 PM PST 2026
>
> kho_preserve_vmalloc() should return -ENOMEM when new_vmalloc_chunk()
> fails.

Thanks!

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav
