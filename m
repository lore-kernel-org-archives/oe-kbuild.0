Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091153D3D18
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774443213; cv=none; b=jIFIbd20y07GFvYHLForGr/0g+OrQdgvdODJSt+PsA6BK8sJABLBnUCjfnlyP3bl8J9cpmxJoKhQ/RzmixLQcwg60LuIkYX0gdfhNdjnrWtIbFklikEKNgkgtMgYu6ik3jT2ZVfPW/fdaQQ9mKaCQh9KdwjVY9NZJ8lW1W9/d30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774443213; c=relaxed/simple;
	bh=wd6qcLyIyBnt4tHj2qbcBMKAd7V/rlQdFXPodyXLGJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=IOoAKEZeQK3bRelVl7FpJMoqYVuSpcu5uVNwYizR+hatjheEYjZgupf7OrZPSHipbiIwCv7hWIqKv8GZjXHfvtSaw8XrFJNB3AswlrVkkexWMA8UgpsSvOjaGWl7U1Z07RxKkUUbphnevXU7xX9EPUZI/tlk1icd0I38Xazbj/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Wqdb+Y9U; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Wqdb+Y9U"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260325125329euoutp021b5214d12085aa22511b44d41f03d06b~gFrKI9AaJ0713707137euoutp02Y
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 12:53:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260325125329euoutp021b5214d12085aa22511b44d41f03d06b~gFrKI9AaJ0713707137euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774443209;
	bh=1/6T2FpQgsppkaTR/3bl5Vlomn0KI9cxE87fYMkK9uU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Wqdb+Y9UlsW9EFwsXfHqTjfiI4vRMzLfSdj4WOLBPn1Py3svAOpogoPH449ZLVQgI
	 8EpUwwhdomV3AD9wY3Qt5LQKDuY/fqT/3jriVCti9PGL4YKhlooGg6WNRiw+lTmJoT
	 9OqF5sGzjSn0B60QoXuKSob7HRJMFXkhnLjf9qoQ=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260325125328eucas1p2c331247db3de72353af82fed8494ed8b~gFrJuwxpf1760517605eucas1p2J;
	Wed, 25 Mar 2026 12:53:28 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260325125328eusmtip21911f3510691319c3da0ac95e19553d4~gFrJaSAeG1984519845eusmtip2w;
	Wed, 25 Mar 2026 12:53:28 +0000 (GMT)
Message-ID: <41ff0286-a70c-43fb-b992-e5f30774c20a@samsung.com>
Date: Wed, 25 Mar 2026 13:53:28 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/firmware/thead,th1520-aon.c:174
 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, Ulf
	Hansson <ulf.hansson@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <202603251917.9rxYz4kf-lkp@intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260325125328eucas1p2c331247db3de72353af82fed8494ed8b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260325121354eucas1p23128fc76e3662308baedfcc0f970fc72
X-EPHeader: CA
X-CMS-RootMailID: 20260325121354eucas1p23128fc76e3662308baedfcc0f970fc72
References: <CGME20260325121354eucas1p23128fc76e3662308baedfcc0f970fc72@eucas1p2.samsung.com>
	<202603251917.9rxYz4kf-lkp@intel.com>


Hi,
On 3/25/26 13:13, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
> commit: e4b3cbd840e565484d0ad8d260d27c057466ed17 firmware: thead: Add AON firmware protocol driver
> config: riscv-randconfig-r073-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251917.9rxYz4kf-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://protect2.fireeye.com/v1/url?k=d678e7b9-b7f3f28f-d6796cf6-74fe485fffe0-2c4534b9bc72cb13&q=1&e=1ce670d0-4eef-4bf7-a0c1-c4094e13228a&u=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch: v0.5.0-9004-gb810ac53
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202603251917.9rxYz4kf-lkp@intel.com/
> 
> New smatch warnings:
> drivers/firmware/thead,th1520-aon.c:174 th1520_aon_power_update() error: buffer overflow 'data' 2 <= 3
> 
> vim +/data +174 drivers/firmware/thead,th1520-aon.c
> 
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  162  int th1520_aon_power_update(struct th1520_aon_chan *aon_chan, u16 rsrc,
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  163  			    bool power_on)
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  164  {
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  165  	struct th1520_aon_msg_req_set_resource_power_mode msg = {};
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  166  	struct th1520_aon_rpc_msg_hdr *hdr = &msg.hdr;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  167  	int ret;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  168  
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  169  	hdr->svc = TH1520_AON_RPC_SVC_PM;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  170  	hdr->func = TH1520_AON_PM_FUNC_SET_RESOURCE_POWER_MODE;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  171  	hdr->size = TH1520_AON_RPC_MSG_NUM;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  172  
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  173  	RPC_SET_BE16(&msg.resource, 0, rsrc);
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11 @174  	RPC_SET_BE16(&msg.resource, 2,
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  175  		     (power_on ? TH1520_AON_PM_PW_MODE_ON :
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  176  				 TH1520_AON_PM_PW_MODE_OFF));
> 
> This is deliberate, but I'm surprised the runtime hardening we have
> done doesn't complain that we're writing outside the &msg.resource
> struct member...  Maybe the RPC_SET_BE16() macro adds enough indirection
> to confuse the checker.
> 
> Why not just do?:
> 
> 	msg.mode = cpu_to_be16(power_on ?
> 			       TH1520_AON_PM_PW_MODE_ON :
> 			       TH1520_AON_PM_PW_MODE_OFF);

I've sent a patch last year to fix this [1]. Maybe it can be picked up ?

[1] - https://lore.kernel.org/all/20250403131051.1097423-1-m.wilczynski@samsung.com/

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  177  
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  178  	ret = th1520_aon_call_rpc(aon_chan, &msg);
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  179  	if (ret)
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  180  		dev_err(aon_chan->cl.dev, "failed to power %s resource %d ret %d\n",
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  181  			power_on ? "up" : "off", rsrc, ret);
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  182  
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  183  	return ret;
> e4b3cbd840e5654 Michal Wilczynski 2025-03-11  184  }
> 

