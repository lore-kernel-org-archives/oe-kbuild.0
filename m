Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B925EEC0;
	Sat, 13 May 2023 11:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9866C433D2;
	Sat, 13 May 2023 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683976144;
	bh=eZU2toRUsCc05ABHU0WOvkAv0LyPZ4e+alp6zVRLq+4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fXxWU+Dn0+wO2MS66K2cmaXblBkpIeuo8uDydSnSg61pnIqKuZ9a53JssEa0fTtCH
	 WzGKH/LnFI9r7aCyOiBX+vv9S+Oh4RrFLtX8hASKP8FuosIKScWZdLHmJXFAZEAX9w
	 ouiIvVVVYYK5ZBtF59ZBjuJqA03NQcUSe0aS9nuEIIbRO5hQwbM2JrEB9Rtq/I87il
	 NTCZV/DS0JdYk3V0hUmmEyKUj88AShuULxCp5Wcwnaj3npJfPx5ogsDzAeu/Bimgcs
	 rfD5LDdsmKA6DyOA/AVOtEMenrw7H5ghx4UG+A807rZ30tKHO6Y9Yi1w6Il9kDv5Dx
	 EWxqY6Ny1tAiw==
Message-ID: <168b52bc-830e-f827-10ed-33d5732f4f43@kernel.org>
Date: Sat, 13 May 2023 13:09:00 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero
 to 'dev_err_probe'
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>
References: <98e45455-7d5d-48e1-a87e-e0b3a05f1bb0@kili.mountain>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <98e45455-7d5d-48e1-a87e-e0b3a05f1bb0@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/05/2023 12:14, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   9a48d604672220545d209e9996c2a1edbb5637f6
> commit: b9c2ae6cac403dee3195fda9eb28d8ee733b225b soc: qcom: icc-bwmon: Add bandwidth monitoring driver
> config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230513/202305131657.76XeHDjF-lkp@intel.com/config)
> compiler: or1k-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202305131657.76XeHDjF-lkp@intel.com/
> 
> New smatch warnings:
> drivers/soc/qcom/icc-bwmon.c:360 bwmon_probe() warn: passing zero to 'dev_err_probe'
> 
> Old smatch warnings:
> drivers/soc/qcom/icc-bwmon.c:365 bwmon_probe() warn: passing zero to 'dev_err_probe'
> 

Thanks, I'll fix it.

Best regards,
Krzysztof

