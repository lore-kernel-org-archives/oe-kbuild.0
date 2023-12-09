Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFF372;
	Sat,  9 Dec 2023 00:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/AC66OH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31DFFC433C8;
	Sat,  9 Dec 2023 00:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702082026;
	bh=AfLb7lzkekGavRKpv+fk7GiWlvNDaLb3U1ZIzEmK8vc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s/AC66OH8JYebqlwn7OY8iCTM3N3Z5QjmwjeORQmgOQYNGEUxU9lFRuUytR5985NK
	 w5QAAdBIPHdBfee73BSoMsySU7ilCs76Ck6nvwyS7eZpX7wQPt1uLuXKDpxcfseJ7h
	 15UoWofUJQRlDqCiz8Z/dNBhkkqtrhyPL3sGTX9lxt8dsNVX4jdfKnFFIGEAPMGyv2
	 cunwV+v7cpv0F1m3S7yluXxE4l99rWVFIN7sFUyOBVM8Wf8f6IteZJl84BuJHfVQob
	 4EAF0rIMtyEc7TY7GUHoF4umQEeAoW6AWeCn7EsqJXV1bnFryCyrMzVggpjTh2vGnw
	 9Dz4oSRZJE/+w==
Message-ID: <b78607e5-6965-4e7f-b43a-c1ca58eecf89@kernel.org>
Date: Fri, 8 Dec 2023 16:33:44 -0800
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error:
 uninitialized symbol 'release'.
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 Vineet Gupta <vgupta@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org
References: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <c2148229-bea9-40ef-bbf3-6019555f3f1a@suswa.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/27/23 22:22, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   2cc14f52aeb78ce3f29677c2de1f06c0e91471ab
> commit: fad84e39f116035ae8d550c6020107b8ac113b45 ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
> config: arc-randconfig-r071-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231128/202311280906.VAIwEAfT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202311280906.VAIwEAfT-lkp@intel.com/
>
> New smatch warnings:
> arch/arc/kernel/setup.c:203 arcv2_mumbojumbo() error: uninitialized symbol 'release'.

Thx, I've posted a fix.

> Old smatch warnings:
> arch/arc/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

This seems like a false warning. Its a register variable and thus can't
possibly be initialized.

static inline __attribute_const__ struct thread_info
*current_thread_info(void)
{
    register unsigned long sp asm("sp");
    return (struct thread_info *)(sp & ~(THREAD_SIZE - 1));
}
