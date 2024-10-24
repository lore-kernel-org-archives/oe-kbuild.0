Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF46829D0D
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 02:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729737952; cv=none; b=s2CQFhsQrd+BPfnV1ndySqUIAS/WiPrE6U2zxI3WUaq1YExaNlcZEPMmvgpnSnOxiQMv8EFFqLqifWqSn/7mCB4HyHICsrPe4xBX94ZV2mdV7e9NXdLK7mBVm5eYRpXw/PXhsIT3DxY5x/rmvjC52V6HSWlRBS/f1zrAGYhNElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729737952; c=relaxed/simple;
	bh=TdWQF7T4YKAWC48K53Jh6GCzZJ70lSJ6D69qBmpAjOI=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hj5c1zBYtL2rHwjPAOCsY7OFmdfk013N5Qq/SJAawcCXigq3Va/1W5L9ok2NiHBAvBhyZ3zfhkU80Dzl4V5JxvNlcbsmuWKs93E/qu59zVF0AAhS3Reh850PQ/tZFamt0Fwfi4oVs60jYA6q8qSgOrIpzXcdYhz0gMlEy/X3b8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYqxW5nCPzyTlg;
	Thu, 24 Oct 2024 10:44:15 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D603140393;
	Thu, 24 Oct 2024 10:45:48 +0800 (CST)
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Oct 2024 10:45:47 +0800
Subject: Re: [PATCH] fgraph: Fix missing unlock in register_ftrace_graph()
To: Steven Rostedt <rostedt@goodmis.org>
CC: <dan.carpenter@linaro.org>, <mhiramat@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<oe-kbuild@lists.linux.dev>, <lkp@intel.com>
References: <20241023170448.808512-1-lihuafei1@huawei.com>
 <20241023052948.0285eb2c@rorschach.local.home>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <49d1672e-71e2-dc87-1fb3-cde430e0339f@huawei.com>
Date: Thu, 24 Oct 2024 10:45:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241023052948.0285eb2c@rorschach.local.home>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemf500004.china.huawei.com (7.202.181.242)

Hi Steve,

On 2024/10/23 17:29, Steven Rostedt wrote:
> On Thu, 24 Oct 2024 01:04:48 +0800
> Li Huafei <lihuafei1@huawei.com> wrote:
> 
>> Instead of returning an error, goto the mutex unlock at the end of the
>> function.
>>
>> Fixes smatch warning:
>>
>> kernel/trace/fgraph.c:1317 register_ftrace_graph() warn: inconsistent returns '&ftrace_lock'.
>>
>> Fixes: 2c02f7375e65 ("fgraph: Use CPU hotplug mechanism to initialize idle shadow stacks")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/r/202410220121.wxg0olfd-lkp@intel.com/
>> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
>> ---
>>  kernel/trace/fgraph.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/trace/fgraph.c b/kernel/trace/fgraph.c
>> index 41e7a15dcb50..98fa7b2a4903 100644
>> --- a/kernel/trace/fgraph.c
>> +++ b/kernel/trace/fgraph.c
>> @@ -1259,7 +1259,7 @@ int register_ftrace_graph(struct fgraph_ops *gops)
>>  					fgraph_cpu_init, NULL);
>>  		if (ret < 0) {
>>  			pr_warn("fgraph: Error to init cpu hotplug support\n");
>> -			return ret;
>> +			goto out;
>>  		}
>>  		fgraph_initialized = true;
>>  		ret = 0;
> 
> Actually, I'm thinking we just should use guard(mutex)(&ftrace_lock);
> 

Agreed, this will make the code simpler and avoid mistakes. If we need
to replace all mutex(&ftrace_lock), would it be better to submit another
cleanup patch? We can fix the issue here first.

Thanks,
Huafei

> -- Steve
> 
> .
> 
