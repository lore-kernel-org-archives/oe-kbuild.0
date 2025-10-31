Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404F2EAB61;
	Fri, 31 Oct 2025 15:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926255; cv=none; b=lE5GKQ6aYLXtUT7Nnf88QiFnpIbDAw9HdzGWwGPYvoQM4fzpeWQlZxdIx81y0eSnOYpv8Es5DLkqZkBz2ibrJvMoNHooCxlAQCLWRalXD3cPh236IQv+VOLmEY7c9P9lhUR8vWegtcZxst2Pndc7kZcRLLsw7q4WdljoSozR/ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926255; c=relaxed/simple;
	bh=LaQggS+mOgBDjauYG/KbuP9LeIDBv+j8KUivy1pNnpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKZAKsuEHLXKszfvgc4Mv+Vz4pltyR8GFzvC4/YJYrCoHZts64LtqB4t6X634DmgctuiYziHKViJjaBT9aBI88k5oVjojUkELBqBNcnNVOlZho7zefTTzi2BTvNiQDqlLlevnUjvlNJkilqpgVyTnkvVjA2iG2+09uEQwtaPbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=dOSo2BKt; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="dOSo2BKt"
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cylx830G6zlvkTS;
	Fri, 31 Oct 2025 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1761926251; x=1764518252; bh=KV/HeKT+oqIG+u0c8Uk48dZO
	7VS6Liw+wQ10rVhwuk0=; b=dOSo2BKtqSeCWfBkvuQICflq8pwWqQmyNudxj5r9
	EQu5HHeHTWvV5U1kHFlvsq2CSqkima9fcCAuPv8inIKBEcaiK6UQEwQHNwqEpvKn
	TMWhhMjXIYHKQzLODHxT/u954VcuHEiBqL+NVPo7Cr5iDOxD5qI71ur7uttWFjME
	MdTp2Y56C8KBMld28SUZESb42BFFcwYa4Yd0JufEUTCtu+WvKTFm7h6OT2QYWvmD
	UIr6wXI3yS6sRapRw37AYNCWkzvE09ZV8dwGuSjvIwSD4GKg3pmhRaRNBymIgzUj
	Zlu8P7CSd3YltQDdqE/CeJ4VzhVOPmUgSC1H3I6Fe4DiSw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id iLyr1z_j3S5E; Fri, 31 Oct 2025 15:57:31 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cylx36QjmzlvkTY;
	Fri, 31 Oct 2025 15:57:27 +0000 (UTC)
Message-ID: <5dd16de9-4594-4b42-b912-d56c3ce6868e@acm.org>
Date: Fri, 31 Oct 2025 08:57:25 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bvanassche:ufs-lrbp-as-priv-data 27/28]
 drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn:
 inconsistent returns '&hba->clk_scaling_lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Avri Altman <avri.altman@sandisk.com>
References: <202510311328.Is1wMfkq-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202510311328.Is1wMfkq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/25 11:06 PM, Dan Carpenter wrote:
> tree:   https://github.com/bvanassche/linux ufs-lrbp-as-priv-data
> head:   f5ce986a0b77ce2944bf8314554d60eec17968e8
> commit: 226979e4eb8a5844be9fb6047a1d042bf2cd72ab [27/28] ufs: core: Move code out of ufshcd_wait_for_dev_cmd()
> config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311328.Is1wMfkq-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202510311328.Is1wMfkq-lkp@intel.com/
> 
> New smatch warnings:
> drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->clk_scaling_lock'.
> drivers/ufs/core/ufshcd.c:7594 ufshcd_advanced_rpmb_req_handler() warn: inconsistent returns '&hba->dev_cmd.lock'.

Hi Dan,

Thanks for the report. This report applies to a patch series from July
10 (more than three months ago). I just pushed out the latest version of
this patch series to my github account. Can you please repeat your
analysis for https://github.com/bvanassche/linux ufs-lrbp-as-priv-data?

Thank you,

Bart.
