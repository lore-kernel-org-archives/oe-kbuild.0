Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3779DF;
	Thu,  1 Jun 2023 08:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F31C433EF;
	Thu,  1 Jun 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685609882;
	bh=WIWcxj+OlLyjzD4msN15S3QwPv0kqqO3yJBhFxLx1ao=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XesTDaHB0OnBd9c67cK824VH0jTx2mRXAvkSHA67zKL0RAUgXngTzyFyT1HVUkNJJ
	 FRt7H64lpA4E0AD3sBvtMpEJFxPCN8PPA81yoA6BB7s2idIc5Iv1JnxvKskmxlmqyb
	 gSEv8m3KCSoYSFUSRVCifySirD6O2plCTobExFymU1WSDl52jNK2zovDRbk+2jLQts
	 xWbWXk7s7xmHdc2XdmT+oy6gOnTDpabDCohBZ8508Ul2NAr+pb2Lu9JzP6h/+P9hVv
	 yz0H+vQN6KrWz0+SGJCE+wMCHnjijsgcXMwsv42PQPu9fBPoa13X86RHJP0g8r5MOK
	 kMN+P761m4bOQ==
Message-ID: <5cc4995f-47a6-136e-3263-d7e68668cf0c@kernel.org>
Date: Thu, 1 Jun 2023 10:57:54 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error:
 buffer overflow 'ctrl->pconfig' 14 <= 14
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <ea98850b-3b56-4306-87be-a5853a3cdf50@kili.mountain>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ea98850b-3b56-4306-87be-a5853a3cdf50@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/05/2023 10:35, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   d635f6cc934bcd467c5d67148ece74632fd96abf
> commit: 2367e0ecb498764e95cfda691ff0828f7d25f9a4 soundwire: qcom: gracefully handle too many ports in DT
> config: ia64-randconfig-m041-20230514
> compiler: ia64-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
> 
> New smatch warnings:
> drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer 

Thanks, I'll fix it. issue was present in original code, my commit just
made it obvious :)

Best regards,
Krzysztof

