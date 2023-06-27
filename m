Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412D8EC2;
	Tue, 27 Jun 2023 08:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B67C433C8;
	Tue, 27 Jun 2023 08:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687856274;
	bh=qDujfLZQmgvl7kJdh5u9YfTadKPZW6myWSe+E5524qo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NpXF2tShzYAn0GpjcK0vmbxyzuj08S2eU5ygqlM/Y/Pu7AOr49eoWLqB9NFKH7TAx
	 sfoVFtNGz7Ps/EOJkTYurYXovTNiPAVL9iqbswVQ4PXC2fbRwJXp+1k4snyR0gV6xy
	 QOp7inbYdAlnu60M9DH73HkBkhD8MhcwnjvfFqAXzYz4qsm5J1jpsIGXJAlDdUcV3S
	 7fE4AYoIeCuTmcYcUhWKgmg27iCrxAJ09qj3rvRhgxBp99FsMhGdl8JEElmYzdWXju
	 lLH/rfdQ3sBotJERatAEQD3HpEpZ+RfL2DT/QdgNR80h+km+w0eJgSdyTGD5BA7Mne
	 QYvO9reZulu8Q==
Message-ID: <d5e3a542-3456-293e-8ea8-112eb8cff7cd@kernel.org>
Date: Tue, 27 Jun 2023 10:57:49 +0200
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
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <3b63bde3-797e-4d58-92a7-c77c953f17d6@kadam.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2023 15:05, Dan Carpenter wrote:
> Hi Krzysztof,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/Input-gpio_keys_polled-Simplify-with-dev_err_probe/20230626-003156
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> patch link:    https://lore.kernel.org/r/20230625162817.100397-23-krzysztof.kozlowski%40linaro.org
> patch subject: [PATCH v4 22/24] Input: bcm-keypad - Simplify with dev_err_probe()
> config: i386-randconfig-m021-20230625 (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230626/202306261505.wTjCXRIO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202306261505.wTjCXRIO-lkp@intel.com/

Thanks. I run smatch on the patchset before sending and did not point it
out. Nothing also after pulling latest master. I guess you run some
unreleased version?

Best regards,
Krzysztof

